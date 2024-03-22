// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_intermediate_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBIntermediateConstraints _$PBIntermediateConstraintsFromJson(
        Map<String, dynamic> json) =>
    PBIntermediateConstraints(
      pinLeft: json['pinLeft'] as bool? ?? false,
      pinRight: json['pinRight'] as bool? ?? false,
      pinTop: json['pinTop'] as bool? ?? false,
      pinBottom: json['pinBottom'] as bool? ?? false,
      fixedHeight: json['fixedHeight'] as bool? ?? false,
      fixedWidth: json['fixedWidth'] as bool? ?? false,
    );

Map<String, dynamic> _$PBIntermediateConstraintsToJson(
        PBIntermediateConstraints instance) =>
    <String, dynamic>{
      'pinLeft': instance.pinLeft,
      'pinRight': instance.pinRight,
      'pinTop': instance.pinTop,
      'pinBottom': instance.pinBottom,
      'fixedHeight': instance.fixedHeight,
      'fixedWidth': instance.fixedWidth,
    };
