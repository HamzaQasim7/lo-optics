import 'package:flutter/material.dart';
import '../../domain/entities/manufacturing_order.dart';

class QueueSummary extends StatelessWidget {
  final List<ManufacturingOrder> queue;

  const QueueSummary({Key? key, required this.queue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalOrders = queue.length;
    final inProgress = queue.where((order) => 
      order.status == ManufacturingStatus.inProgress).length;
    final pending = queue.where((order) => 
      order.status == ManufacturingStatus.pending).length;

    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Queue Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildSummaryRow('Total Orders', totalOrders),
            _buildSummaryRow('In Progress', inProgress),
            _buildSummaryRow('Pending', pending),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
} 