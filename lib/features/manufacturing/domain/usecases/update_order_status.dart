import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/manufacturing_order.dart';
import '../repositories/manufacturing_repository.dart';

class UpdateOrderStatus implements UseCase<ManufacturingOrder, UpdateOrderStatusParams> {
  final ManufacturingRepository repository;

  UpdateOrderStatus(this.repository);

  @override
  Future<Either<Failure, ManufacturingOrder>> call(UpdateOrderStatusParams params) async {
    return await repository.updateOrderStatus(
      params.orderId,
      params.newStatus,
      params.notes,
    );
  }
}

class UpdateOrderStatusParams extends Equatable {
  final String orderId;
  final ManufacturingStatus newStatus;
  final String? notes;

  const UpdateOrderStatusParams({
    required this.orderId,
    required this.newStatus,
    this.notes,
  });

  @override
  List<Object?> get props => [orderId, newStatus, notes];
} 