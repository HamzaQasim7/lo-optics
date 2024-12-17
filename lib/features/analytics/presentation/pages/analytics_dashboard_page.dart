import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/analytics_bloc.dart';
import '../widgets/revenue_chart.dart';
import '../widgets/metrics_summary.dart';

class AnalyticsDashboardPage extends StatelessWidget {
  const AnalyticsDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
      ),
      body: BlocBuilder<AnalyticsBloc, AnalyticsState>(
        builder: (context, state) {
          if (state is AnalyticsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnalyticsLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MetricsSummary(metrics: state.metrics),
                  const SizedBox(height: 24),
                  RevenueChart(data: state.revenueData),
                ],
              ),
            );
          } else if (state is AnalyticsError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Select a date range to view analytics'));
        },
      ),
    );
  }
} 