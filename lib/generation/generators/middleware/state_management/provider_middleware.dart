import 'package:parabeac_core/generation/generators/middleware/middleware.dart';
import 'package:parabeac_core/generation/generators/middleware/state_management/utils/middleware_utils.dart';
import 'package:parabeac_core/generation/generators/pb_generation_manager.dart';
import 'package:parabeac_core/generation/generators/pb_variable.dart';
import 'package:parabeac_core/generation/generators/value_objects/file_structure_strategy.dart/provider_file_structure_strategy.dart';
import 'package:parabeac_core/generation/generators/value_objects/template_strategy/stateless_template_strategy.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/pb_shared_instance.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_gen_cache.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_symbol_storage.dart';
import 'package:recase/recase.dart';
import 'package:parabeac_core/generation/generators/value_objects/generator_adapter.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';

class ProviderMiddleware extends Middleware {
  final PACKAGE_NAME = 'provider';
  final PACKAGE_VERSION = '^4.3.2+3';

  ProviderMiddleware(PBGenerationManager generationManager)
      : super(generationManager);

  @override
  Future<PBIntermediateNode> applyMiddleware(PBIntermediateNode node) async {
    String watcherName;
    var managerData = node.managerData;
    var fileStrategy = node.currentContext.project.fileStructureStrategy
        as ProviderFileStructureStrategy;
    if (node is PBSharedInstanceIntermediateNode) {
      node.currentContext.project.genProjectData
          .addDependencies(PACKAGE_NAME, PACKAGE_VERSION);
      managerData.addImport('package:provider/provider.dart');
      watcherName = getVariableName(node.name.snakeCase + '_notifier');
      var widgetName = node.functionCallName.camelCase;
      var watcher;

      if (node.currentContext.treeRoot.rootNode.generator.templateStrategy
          is StatelessTemplateStrategy) {
        watcher = PBVariable(watcherName, 'final ', true,
            '${getName(node.functionCallName).pascalCase}().${widgetName}');
        managerData.addGlobalVariable(watcher);
      }

      addImportToCache(node.SYMBOL_ID, getImportPath(node, fileStrategy));

      if (node.generator is! StringGeneratorAdapter) {
        // Add instance import
        PBGenCache().appendToCache(node.SYMBOL_ID,
            getImportPath(node, fileStrategy, generateModelPath: false));
        var modelName = getName(node.functionCallName).pascalCase;
        var defaultWidget = node.functionCallName.pascalCase;
        var providerWidget = '''
        ChangeNotifierProvider(
          create: (context) =>
              ${modelName}(), 
          child: LayoutBuilder(
            builder: (context, constraints) {
              var widget = ${defaultWidget}(constraints);
              
              context
                  .read<${modelName}>()
                  .setCurrentWidget(
                      widget); // Setting active state

              return GestureDetector(
                onTap: () => context.read<
                    ${modelName}>(), // TODO: add your method to change the state here
                child: context
                    .watch<${modelName}>()
                    .currentWidget, 
              );
            },
          ),
        )
        ''';
        node.generator = StringGeneratorAdapter(providerWidget);
      }
      return node;
    }
    watcherName = getNameOfNode(node);

    var code = MiddlewareUtils.generateChangeNotifierClass(
      watcherName,
      generationManager,
      node,
    );

    var parentDirectory = getName(node.name).snakeCase;

    // Write model class for current node
    code = MiddlewareUtils.generateModelChangeNotifier(
        watcherName, generationManager, node);
    fileStrategy.writeProviderModelFile(code, getName(node.name).snakeCase);

    // Generate default node's view page
    await fileStrategy.generatePage(
      await generationManager.generate(node),
      '${parentDirectory}/${node.name.snakeCase}',
      args: 'VIEW',
    );

    // Generate node's states' view pages
    node.auxiliaryData?.stateGraph?.states?.forEach((state) async {
      await fileStrategy.generatePage(
        await generationManager.generate(state.variation.node),
        '${parentDirectory}/${state.variation.node.name.snakeCase}',
        args: 'VIEW',
      );
    });

    return node;
  }

  String getImportPath(PBSharedInstanceIntermediateNode node,
      ProviderFileStructureStrategy fileStrategy,
      {bool generateModelPath = true}) {
    var symbolMaster =
        PBSymbolStorage().getSharedMasterNodeBySymbolID(node.SYMBOL_ID);
    var import = generateModelPath
        ? '${fileStrategy.RELATIVE_MODEL_PATH}${getName(symbolMaster.name).snakeCase}.dart'
        : '${fileStrategy.RELATIVE_VIEW_PATH}${getName(symbolMaster.name).snakeCase}/${node.functionCallName.snakeCase}.dart';
    return fileStrategy.GENERATED_PROJECT_PATH + import;
  }
}
