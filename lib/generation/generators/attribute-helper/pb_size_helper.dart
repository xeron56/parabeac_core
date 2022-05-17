import 'package:parabeac_core/generation/generators/attribute-helper/pb_attribute_gen_helper.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/container.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_context.dart';

class PBSizeHelper extends PBAttributesHelper {
  PBSizeHelper() : super();

  @override
  String generate(PBIntermediateNode source, PBContext context) {
    if (context == null) {
      print('Tried generating a size but couldn\'t retrieve [currentContext]');
      return '';
    }

    final buffer = StringBuffer();

    buffer.write(getSize(source, context, DIMENTIONS.Width));
    buffer.write(getSize(source, context, DIMENTIONS.Height));

    return buffer.toString();
  }

  String getSize(
      PBIntermediateNode source, PBContext context, DIMENTIONS dimention) {
    var isHeight = dimention == DIMENTIONS.Height;
    var dimentionString = dimention.toShortString();
    var lowerCaseDimentionString = dimentionString.toLowerCase();
    String sizeString;
    final buffer = StringBuffer();

    double relativeSize = isHeight ? source.frame.height : source.frame.width;

    // Add relative sizing if the widget has context
    num screenSize;

    if (context.screenFrame != null) {
      screenSize =
          isHeight ? context.screenFrame.height : context.screenFrame.width;
    }

    if (context.sizingContext == SizingValueContext.ScaleValue) {
      // Size for scalevalue
      relativeSize =
          (relativeSize != null && screenSize != null && screenSize > 0.0)
              ? relativeSize / screenSize
              : relativeSize;

      var size = (isHeight
              ? source.constraints.fixedHeight
              : source.constraints.fixedWidth)
          ? (isHeight
              ? source.frame.height.toStringAsFixed(3)
              : source.frame.width.toStringAsFixed(3))
          : 'MediaQuery.of(context).size.$lowerCaseDimentionString * ${relativeSize.toStringAsFixed(3)}';

      sizeString = '$lowerCaseDimentionString: $size,';
    } else if (context.sizingContext == SizingValueContext.LayoutBuilderValue) {
      relativeSize = relativeSize / screenSize;

      // Size for LayoutBuilder
      sizeString =
          '$lowerCaseDimentionString: constraints.max$dimentionString * ${relativeSize.toStringAsFixed(3)},';
    } else if (context.sizingContext ==
        SizingValueContext.LayoutBuilderStatefulValue) {
      relativeSize = relativeSize / screenSize;

      // Size for LayoutBuilder
      sizeString =
          '$lowerCaseDimentionString: widget.constraints.max$dimentionString * ${relativeSize.toStringAsFixed(3)},';
    } else {
      // Size for constants value
      sizeString =
          '$lowerCaseDimentionString: ${relativeSize.toStringAsFixed(3)},';
    }

    // Determine if it is going to show width and height
    var show = true;
    if (source is PBContainer) {
      show = isHeight ? source.showHeight : source.showWidth;
    }

    if (relativeSize != null && relativeSize > 0 && show) {
      buffer.write(sizeString);
    }

    return buffer.toString();
  }
}

enum DIMENTIONS { Height, Width }

extension DimentionToString on DIMENTIONS {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
