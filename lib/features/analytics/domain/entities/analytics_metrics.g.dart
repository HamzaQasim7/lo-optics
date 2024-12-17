// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsMetrics _$AnalyticsMetricsFromJson(Map<String, dynamic> json) =>
    AnalyticsMetrics(
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalOrders: (json['totalOrders'] as num).toInt(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      conversionRate: (json['conversionRate'] as num).toDouble(),
      activeCustomers: (json['activeCustomers'] as num).toInt(),
    );

Map<String, dynamic> _$AnalyticsMetricsToJson(AnalyticsMetrics instance) =>
    <String, dynamic>{
      'totalRevenue': instance.totalRevenue,
      'totalOrders': instance.totalOrders,
      'averageOrderValue': instance.averageOrderValue,
      'conversionRate': instance.conversionRate,
      'activeCustomers': instance.activeCustomers,
    };
