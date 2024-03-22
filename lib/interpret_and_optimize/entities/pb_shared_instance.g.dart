// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_shared_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBSharedInstanceIntermediateNode _$PBSharedInstanceIntermediateNodeFromJson(
        Map<String, dynamic> json) =>
    PBSharedInstanceIntermediateNode(
      json['UUID'] as String?,
      Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
      SYMBOL_ID: json['symbolID'] as String?,
      sharedParamValues: (json['overrideValues'] as List<dynamic>?)
          ?.map((e) => PBInstanceOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
      prototypeNode: PrototypeNode.prototypeNodeFromJson(
          json['prototypeNodeUUID'] as String?),
      name: json['name'] as String?,
      sharedNodeSetID: json['sharedNodeSetID'] as String?,
    )
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
      ..type = json['type'] as String?;

Map<String, dynamic> _$PBSharedInstanceIntermediateNodeToJson(
        PBSharedInstanceIntermediateNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'constraints': instance.constraints?.toJson(),
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'boundaryRectangle': Rectangle3D.toJson(instance.frame),
      'style': instance.auxiliaryData?.toJson(),
      'name': instance.name,
      'symbolID': instance.SYMBOL_ID,
      'overrideValues':
          instance.sharedParamValues?.map((e) => e.toJson()).toList(),
      'prototypeNodeUUID': instance.prototypeNode?.toJson(),
      'type': instance.type,
      'sharedNodeSetID': instance.sharedNodeSetID,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};

PBInstanceOverride _$PBInstanceOverrideFromJson(Map<String, dynamic> json) =>
    PBInstanceOverride(
      json['ovrType'] as String?,
      json['value'] as Map<String, dynamic>?,
      json['UUID'] as String?,
      json['name'] as String?,
      json['valueName'] as String?,
    );

Map<String, dynamic> _$PBInstanceOverrideToJson(PBInstanceOverride instance) =>
    <String, dynamic>{
      'ovrType': instance.ovrType,
      'value': instance.initialValue,
      'UUID': instance.UUID,
      'name': instance.overrideName,
      'valueName': instance.valueName,
    };
