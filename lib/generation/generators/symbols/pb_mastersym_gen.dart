import 'package:parabeac_core/generation/generators/attribute-helper/pb_box_decoration_gen_helper.dart';
import 'package:parabeac_core/generation/generators/pb_generator.dart';
import 'package:parabeac_core/generation/generators/value_objects/template_strategy/stateful_template_strategy.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/pb_shared_master_node.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_context.dart';
import 'package:quick_log/quick_log.dart';

class PBMasterSymbolGenerator extends PBGenerator {
  PBMasterSymbolGenerator() : super(strategy: StatefulTemplateStrategy());

  var log = Logger('Symbol Master Generator');
  @override
  String generate(PBIntermediateNode? source, PBContext? context) {
    context!.sizingContext = SizingValueContext.LayoutBuilderStatefulValue;
    var children = context.tree!.childrenOf(source);
    var sourceChild = children.isNotEmpty ? children.first : null;
    var buffer = StringBuffer();
    if (source is PBSharedMasterNode) {
      if (sourceChild == null) {
        return '';
      }
      // override styles if need be.
      context.masterNode = source;

      // see if widget itself is overridden, need to pass
      var generatedWidget =
          sourceChild.generator!.generate(sourceChild, context);

      context.masterNode = null;
      if (generatedWidget == null || generatedWidget.isEmpty) {
        return '';
      }
      var decoration = PBBoxDecorationHelper().generate(source, context);
      buffer.write('Container($decoration child:');
      buffer.write(generatedWidget);
      buffer.write(')');
      return buffer.toString();
    } else {
      return '';
    }
  }
}
