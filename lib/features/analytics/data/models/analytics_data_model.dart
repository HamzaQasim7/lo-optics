import 'package:json_annotation/json_annotation.dart';
import 'package:lo_wearglass/features/analytics/domain/entities/analytics_metrics.dart';
import 'package:lo_wearglass/features/analytics/domain/entities/revenue_data.dart';

part 'analytics_data_model.g.dart';

@JsonSerializable()
class AnalyticsDataModel {
  final AnalyticsMetrics metrics;
  final List<RevenueData> revenueData;

  const AnalyticsDataModel({
    required this.metrics,
    required this.revenueData,
  });

  factory AnalyticsDataModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticsDataModelToJson(this);
}
