// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inherited_scaffold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InheritedScaffold _$InheritedScaffoldFromJson(Map<String, dynamic> json) =>
    InheritedScaffold(
      json['UUID'] as String?,
      Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
      json['name'] as String?,
      json['originalRef'] as Map<String, dynamic>?,
      isHomeScreen: json['isFlowHome'] as bool? ?? false,
      prototypeNode: PrototypeNode.prototypeNodeFromJson(
          json['prototypeNodeUUID'] as String?),
      constraints: json['constraints'] == null
          ? null
          : PBIntermediateConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
    )
      ..subsemantic = json['subsemantic'] as String?
      ..layoutMainAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
      ..layoutCrossAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
      ..auxiliaryData = json['style'] == null
          ? null
          : IntermediateAuxiliaryData.fromJson(
              json['style'] as Map<String, dynamic>)
      ..type = json['type'] as String?;

Map<String, dynamic> _$InheritedScaffoldToJson(InheritedScaffold instance) =>
    <String, dynamic>{
      'subsemantic': instance.subsemantic,
      'UUID': instance.UUID,
      'constraints': instance.constraints,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'boundaryRectangle': Rectangle3D.toJson(instance.frame),
      'style': instance.auxiliaryData,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNode,
      'isFlowHome': instance.isHomeScreen,
      'type': instance.type,
      'originalRef': instance.originalRef,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
