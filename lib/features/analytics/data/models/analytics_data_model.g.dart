// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsDataModel _$AnalyticsDataModelFromJson(Map<String, dynamic> json) =>
    AnalyticsDataModel(
      metrics:
          AnalyticsMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      revenueData: (json['revenueData'] as List<dynamic>)
          .map((e) => RevenueData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalyticsDataModelToJson(AnalyticsDataModel instance) =>
    <String, dynamic>{
      'metrics': instance.metrics,
      'revenueData': instance.revenueData,
    };
