// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameGroup _$FrameGroupFromJson(Map<String, dynamic> json) => FrameGroup(
      json['UUID'] as String?,
      Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
      name: json['name'] as String?,
      prototypeNode: PrototypeNode.prototypeNodeFromJson(
          json['prototypeNodeUUID'] as String?),
      constraints: json['constraints'] == null
          ? null
          : PBIntermediateConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
    )
      ..layoutMainAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
      ..layoutCrossAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
      ..auxiliaryData = json['style'] == null
          ? null
          : IntermediateAuxiliaryData.fromJson(
              json['style'] as Map<String, dynamic>)
      ..type = json['type'] as String?;

Map<String, dynamic> _$FrameGroupToJson(FrameGroup instance) =>
    <String, dynamic>{
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
      'type': instance.type,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
