// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injected_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InjectedContainer _$InjectedContainerFromJson(Map<String, dynamic> json) =>
    InjectedContainer(
      json['UUID'],
      Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
      name: json['name'] as String?,
      prototypeNode:
          PrototypeNode.prototypeNodeFromJson(json['prototypeNode'] as String?),
      type: json['type'] as String?,
      constraints: json['constraints'] == null
          ? null
          : PBIntermediateConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      showWidth: json['showWidth'] as bool? ?? true,
      showHeight: json['showHeight'] as bool? ?? true,
    )
      ..subsemantic = json['subsemantic'] as String?
      ..layoutMainAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
      ..layoutCrossAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
      ..auxiliaryData = json['style'] == null
          ? null
          : IntermediateAuxiliaryData.fromJson(
              json['style'] as Map<String, dynamic>);

Map<String, dynamic> _$InjectedContainerToJson(InjectedContainer instance) =>
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
      'prototypeNode': instance.prototypeNode,
      'type': instance.type,
      'showWidth': instance.showWidth,
      'showHeight': instance.showHeight,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
