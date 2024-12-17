import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/manufacturing_order.dart';
import '../bloc/manufacturing_bloc.dart';

class ManufacturingDetailPage extends StatelessWidget {
  final String orderId;

  const ManufacturingDetailPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufacturing Details'),
      ),
      body: BlocBuilder<ManufacturingBloc, ManufacturingState>(
        builder: (context, state) {
          if (state is ManufacturingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ManufacturingOrderLoaded) {
            final order = state.order;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatusSection(context, order),
                  const Divider(),
                  _buildSpecificationsSection(order),
                  const Divider(),
                  _buildQualityCheckSection(order),
                  if (order.notes != null) ...[
                    const Divider(),
                    _buildNotesSection(order),
                  ],
                ],
              ),
            );
          } else if (state is ManufacturingError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUpdateStatusDialog(context),
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildStatusSection(BuildContext context, ManufacturingOrder order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: ${order.status.toString().split('.').last}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Priority: ${order.priority.toString().split('.').last}'),
            Text('Assigned to: ${order.assignedTo}'),
            Text('Scheduled: ${order.scheduledDate.toString().split('.')[0]}'),
            if (order.isDelayed)
              const Text('DELAYED',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificationsSection(ManufacturingOrder order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Specifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...order.specifications.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('${entry.key}: ${entry.value}'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualityCheckSection(ManufacturingOrder order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quality Checkpoints',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...order.qualityCheckpoints.map(
              (checkpoint) => CheckboxListTile(
                title: Text(checkpoint),
                value: false,
                onChanged: (bool? value) {
                  // Implement quality check logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesSection(ManufacturingOrder order) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Notes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(order.notes ?? ''),
          ],
        ),
      ),
    );
  }

  void _showUpdateStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<ManufacturingStatus>(
              items: ManufacturingStatus.values.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Text(status.toString().split('.').last),
                );
              }).toList(),
              onChanged: (ManufacturingStatus? newStatus) {
                if (newStatus != null) {
                  context.read<ManufacturingBloc>().add(
                        UpdateManufacturingStatusEvent(
                          orderId: orderId,
                          newStatus: newStatus,
                        ),
                      );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
