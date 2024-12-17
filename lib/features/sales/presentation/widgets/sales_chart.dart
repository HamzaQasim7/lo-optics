import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/entities/sale.dart';

class SalesChart extends StatelessWidget {
  final List<Sale> sales;

  const SalesChart({Key? key, required this.sales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales Trend',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _createDataPoints(),
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _createDataPoints() {
    final sortedSales = List<Sale>.from(sales)
      ..sort((a, b) => a.saleDate.compareTo(b.saleDate));
    
    return List.generate(
      sortedSales.length,
      (index) => FlSpot(
        index.toDouble(),
        sortedSales[index].totalAmount,
      ),
    );
  }
} 