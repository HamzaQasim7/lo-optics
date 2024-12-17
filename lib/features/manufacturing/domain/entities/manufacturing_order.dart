import 'package:equatable/equatable.dart';

enum ManufacturingStatus {
  pending,
  inProgress,
  completed,
  onHold,
  cancelled
}

enum ManufacturingPriority {
  low,
  normal,
  high,
  urgent
}

class ManufacturingOrder extends Equatable {
  final String id;
  final String productId;
  final int quantity;
  final ManufacturingStatus status;
  final DateTime scheduledDate;
  final String assignedTo;
  final Map<String, String> specifications;
  final List<String> qualityCheckpoints;
  final String? notes;
  final bool isDelayed;
  final ManufacturingPriority priority;

  const ManufacturingOrder({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.status,
    required this.scheduledDate,
    required this.assignedTo,
    required this.specifications,
    required this.qualityCheckpoints,
    this.notes,
    this.isDelayed = false,
    this.priority = ManufacturingPriority.normal,
  });

  @override
  List<Object?> get props => [
        id,
        productId,
        quantity,
        status,
        scheduledDate,
        assignedTo,
        specifications,
        qualityCheckpoints,
        notes,
        isDelayed,
        priority,
      ];
}

