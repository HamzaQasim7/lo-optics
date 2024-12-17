import 'package:equatable/equatable.dart';
import 'analytics_metrics.dart';
import 'revenue_data.dart';

class AnalyticsData extends Equatable {
  final AnalyticsMetrics metrics;
  final List<RevenueData> revenueData;
  final Map<String, double> salesByCategory;
  final Map<String, int> ordersByStatus;
  final List<DailySales> dailySales;

  const AnalyticsData({
    required this.metrics,
    required this.revenueData,
    required this.salesByCategory,
    required this.ordersByStatus,
    required this.dailySales,
  });

  @override
  List<Object?> get props => [metrics, revenueData, salesByCategory, ordersByStatus, dailySales];
}

class DailySales extends Equatable {
  final DateTime date;
  final double revenue;
  final int orders;

  const DailySales({
    required this.date,
    required this.revenue,
    required this.orders,
  });

  @override
  List<Object?> get props => [date, revenue, orders];
} 