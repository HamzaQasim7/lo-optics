import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/manufacturing_bloc.dart';
import '../widgets/manufacturing_queue_list.dart';
import '../widgets/queue_summary.dart';
import '../../domain/entities/manufacturing_order.dart';

class ManufacturingQueuePage extends StatelessWidget {
  const ManufacturingQueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufacturing Queue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: BlocBuilder<ManufacturingBloc, ManufacturingState>(
        builder: (context, state) {
          if (state is ManufacturingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ManufacturingQueueLoaded) {
            return Column(
              children: [
                QueueSummary(queue: state.queue),
                Expanded(
                  child: ManufacturingQueueList(orders: state.queue),
                ),
              ],
            );
          } else if (state is ManufacturingError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No orders in queue'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/manufacturing/new'),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Queue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Add filter options here
            const Text('Filter by status'),
            DropdownButton<ManufacturingStatus>(
              items: ManufacturingStatus.values
                  .map((status) => DropdownMenuItem<ManufacturingStatus>(
                        value: status,
                        child: Text(status.toString().split('.').last),
                      ))
                  .toList(),
              onChanged: (status) => print(status),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Apply filters
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
