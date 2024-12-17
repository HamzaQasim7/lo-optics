part of 'manufacturing_bloc.dart';

abstract class ManufacturingState extends Equatable {
  const ManufacturingState();

  @override
  List<Object?> get props => [];
}

class ManufacturingInitial extends ManufacturingState {}

class ManufacturingLoading extends ManufacturingState {}

class ManufacturingOrderLoaded extends ManufacturingState {
  final ManufacturingOrder order;

  const ManufacturingOrderLoaded(this.order);

  @override
  List<Object?> get props => [order];
}

class ManufacturingQueueLoaded extends ManufacturingState {
  final List<ManufacturingOrder> queue;

  const ManufacturingQueueLoaded(this.queue);

  @override
  List<Object?> get props => [queue];
}

class ManufacturingError extends ManufacturingState {
  final String message;

  const ManufacturingError({required this.message});

  @override
  List<Object?> get props => [message];
} 