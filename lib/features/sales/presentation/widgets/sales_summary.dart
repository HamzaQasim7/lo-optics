import 'package:flutter/material.dart';
import '../../domain/entities/sale.dart';

class SalesSummary extends StatelessWidget {
  final List<Sale> sales;

  const SalesSummary({Key? key, required this.sales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalSales = sales.length;
    final totalRevenue = sales.fold(0.0, (sum, sale) => sum + sale.totalAmount);
    final averageOrderValue = totalSales > 0 ? totalRevenue / totalSales : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _SummaryItem(
              title: 'Total Sales',
              value: totalSales.toString(),
            ),
            _SummaryItem(
              title: 'Total Revenue',
              value: '\$${totalRevenue.toStringAsFixed(2)}',
            ),
            _SummaryItem(
              title: 'Average Order Value',
              value: '\$${averageOrderValue.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
} 