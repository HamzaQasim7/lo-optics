import 'package:flutter/material.dart';
import '../../domain/entities/manufacturing_order.dart';

class ManufacturingQueueList extends StatelessWidget {
  final List<ManufacturingOrder> orders;

  const ManufacturingQueueList({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            title: Text('Order #${order.id}'),
            subtitle: Text('Status: ${order.status.toString().split('.').last}'),
            trailing: Text('Qty: ${order.quantity}'),
            onTap: () => Navigator.pushNamed(
              context,
              '/manufacturing/detail',
              arguments: order.id,
            ),
          ),
        );
      },
    );
  }
} 