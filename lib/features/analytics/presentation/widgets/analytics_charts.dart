import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/entities/analytics_data.dart';

class AnalyticsCharts extends StatelessWidget {
  final AnalyticsData data;

  const AnalyticsCharts({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRevenueChart(),
        const SizedBox(height: 24),
        _buildCategoryPieChart(),
        const SizedBox(height: 24),
        _buildOrderStatusChart(),
      ],
    );
  }

  Widget _buildRevenueChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: data.dailySales
                  .map((sale) => FlSpot(
                        sale.date.millisecondsSinceEpoch.toDouble(),
                        sale.revenue,
                      ))
                  .toList(),
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryPieChart() {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: data.salesByCategory.entries.map((entry) {
            return PieChartSectionData(
              value: entry.value,
              title: entry.key,
              radius: 100,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildOrderStatusChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: data.ordersByStatus.entries.map((entry) {
            return BarChartGroupData(
              x: entry.key.hashCode,
              barRods: [
                BarChartRodData(
                  toY: entry.value.toDouble(),
                  color: Colors.blue,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
} 