import 'package:flutter/material.dart';
import '../../domain/entities/analytics_metrics.dart';

class MetricsSummary extends StatelessWidget {
  final AnalyticsMetrics metrics;

  const MetricsSummary({Key? key, required this.metrics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Metrics',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildMetricRow('Total Revenue', '\$${metrics.totalRevenue.toStringAsFixed(2)}'),
            _buildMetricRow('Total Orders', metrics.totalOrders.toString()),
            _buildMetricRow('Average Order Value', '\$${metrics.averageOrderValue.toStringAsFixed(2)}'),
            _buildMetricRow('Conversion Rate', '${(metrics.conversionRate * 100).toStringAsFixed(1)}%'),
            _buildMetricRow('Active Customers', metrics.activeCustomers.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
} 