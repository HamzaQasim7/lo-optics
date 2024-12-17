part of 'manufacturing_bloc.dart';

abstract class ManufacturingEvent extends Equatable {
  const ManufacturingEvent();

  @override
  List<Object?> get props => [];
}

class LoadManufacturingOrder extends ManufacturingEvent {
  final String orderId;

  const LoadManufacturingOrder(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class UpdateManufacturingStatusEvent extends ManufacturingEvent {
  final String orderId;
  final ManufacturingStatus newStatus;

  const UpdateManufacturingStatusEvent({
    required this.orderId,
    required this.newStatus,
  });

  @override
  List<Object?> get props => [orderId, newStatus];
}
