// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBIntermediateColumnLayout _$PBIntermediateColumnLayoutFromJson(
        Map<String, dynamic> json) =>
    PBIntermediateColumnLayout(
      Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
      name: json['name'] as String?,
    )
      ..subsemantic = json['subsemantic'] as String?
      ..constraints = json['constraints'] == null
          ? null
          : PBIntermediateConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>)
      ..layoutMainAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
      ..layoutCrossAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
      ..auxiliaryData = json['style'] == null
          ? null
          : IntermediateAuxiliaryData.fromJson(
              json['style'] as Map<String, dynamic>)
      ..prototypeNode = json['prototypeNode'] == null
          ? null
          : PrototypeNode.fromJson(
              json['prototypeNode'] as Map<String, dynamic>)
      ..alignment = json['alignment'] as Map<String, dynamic>
      ..layoutProperties = json['autoLayoutOptions'] == null
          ? null
          : LayoutProperties.fromJson(
              json['autoLayoutOptions'] as Map<String, dynamic>)
      ..type = json['type'] as String?;

Map<String, dynamic> _$PBIntermediateColumnLayoutToJson(
        PBIntermediateColumnLayout instance) =>
    <String, dynamic>{
      'subsemantic': instance.subsemantic,
      'constraints': instance.constraints,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'boundaryRectangle': Rectangle3D.toJson(instance.frame),
      'style': instance.auxiliaryData,
      'name': instance.name,
      'prototypeNode': instance.prototypeNode,
      'alignment': instance.alignment,
      'autoLayoutOptions': instance.layoutProperties,
      'type': instance.type,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
