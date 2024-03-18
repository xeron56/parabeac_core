import 'package:parabeac_core/generation/generators/import_generator.dart';
import 'package:parabeac_core/generation/generators/value_objects/file_structure_strategy/commands/node_file_structure_command.dart';
import 'package:parabeac_core/generation/generators/value_objects/file_structure_strategy/commands/write_screen_command.dart';
import 'package:parabeac_core/generation/generators/value_objects/file_structure_strategy/pb_file_structure_strategy.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_context.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_gen_cache.dart';
import 'package:parabeac_core/interpret_and_optimize/services/pb_platform_orientation_linker_service.dart';
import 'package:recase/recase.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

mixin PBPlatformOrientationGeneration {
  NodeFileStructureCommand? generatePlatformInstance(
      Map<String, List<String>> platformsMap,
      String screenName,
      FileStructureStrategy strategy,
      Set<String> rawImports) {
    var formatedName = screenName.snakeCase.toLowerCase();
    var cookedImports = _cookImports(
        rawImports,
        p.join(
          strategy.GENERATED_PROJECT_PATH!,
          WriteScreenCommand.SCREEN_PATH,
          formatedName,
          '${formatedName}_platform_builder.dart',
        ));

    /// Check if we have multiple platforms or orientations for any platform
    if (platformsMap.length > 1 ||
        platformsMap.values.any((orientations) => orientations.length > 1)) {
      return WriteScreenCommand(
        Uuid().v4(),
        formatedName + '_platform_builder.dart',
        formatedName,
        _getPlatformInstance(platformsMap, screenName, cookedImports),
      );
    } else {
      return null;
    }
  }

  String _getPlatformInstance(Map<String, List<String>> platformsMap,
      String screenName, Set<String> cookedImports) {
    var className = screenName.pascalCase;
    return '''
    import 'package:flutter/material.dart';
    ${_serveImports(cookedImports)}

    class ${className}PlatformBuilder extends StatelessWidget {
      const ${className}PlatformBuilder({Key? key}) : super(key: key);
      @override
      Widget build(BuildContext context) {
        return const ResponsiveLayoutBuilder(
          ${_getPlatformsWidgets(platformsMap, className)}
        );
      }
    }
    ''';
  }

  String _getPlatformsWidgets(
      Map<String, List<String>> platformsMap, String className) {
    var result = '';
    platformsMap.forEach((platform, value) {
      var nameWithPlatform =
          platformsMap.length > 1 ? className + platform.titleCase : className;
      if (value.length > 1) {
        result += '''
        ${platform}Widget: ResponsiveOrientationBuilder(
        verticalPage: ${nameWithPlatform}Vertical(),
        horizontalPage: ${nameWithPlatform}Horizontal(),
        ),
        ''';
      } else {
        result += '${platform}Widget: $nameWithPlatform(),';
      }
    });
    return result;
  }

  void getPlatformOrientationName(PBIntermediateNode? node, PBContext context) {
    var map = PBPlatformOrientationLinkerService()
        .getPlatformOrientationData(context.tree!.identifier);

    if (map.length > 1) {
      var platform = PBPlatformOrientationLinkerService()
          .stripPlatform(context.tree!.generationViewData!.platform);
      if (!node!.name!.contains('_$platform')) {
       // node.name += '_$platform';
       node.name =  (node.name! + '_$platform');
       //node.name = (node.name ?? '') + '_$platform';
      }
    }
    if (map[context.tree!.generationViewData!.platform]!.length > 1) {
      var orientation = PBPlatformOrientationLinkerService()
          .stripOrientation(context.tree!.generationViewData!.orientation);
      if (!node!.name!.contains('_$orientation')) {
       // node.name += '_$orientation';
       node.name =  (node.name! + '_$orientation');
      }
    }
  }

  Set<String> _cookImports(Set<String> rawImports, String possiblePath) {
    var result = <String>{};
    rawImports.forEach((import) {
      if (possiblePath != null && import != null) {
        result.add(PBGenCache().getRelativePathFromPaths(possiblePath, import));
      }
    });
    return result;
  }

  String _serveImports(Set<String> cookedImports) {
    var result = '';
    cookedImports.forEach((import) {
      result += FlutterImport(import).toString();
    });
    return result;
  }
}
