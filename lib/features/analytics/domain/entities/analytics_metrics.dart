import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analytics_metrics.g.dart';

@JsonSerializable()
class AnalyticsMetrics extends Equatable {
  final double totalRevenue;
  final int totalOrders;
  final double averageOrderValue;
  final double conversionRate;
  final int activeCustomers;

  const AnalyticsMetrics({
    required this.totalRevenue,
    required this.totalOrders,
    required this.averageOrderValue,
    required this.conversionRate,
    required this.activeCustomers,
  });

  factory AnalyticsMetrics.fromJson(Map<String, dynamic> json) => _$AnalyticsMetricsFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticsMetricsToJson(this);

  @override
  List<Object?> get props => [
        totalRevenue,
        totalOrders,
        averageOrderValue,
        conversionRate,
        activeCustomers,
      ];
} 