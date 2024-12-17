import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/manufacturing_order.dart';
import '../repositories/manufacturing_repository.dart';

class UpdateManufacturingStatus implements UseCase<ManufacturingOrder, UpdateManufacturingStatusParams> {
  final ManufacturingRepository repository;

  UpdateManufacturingStatus(this.repository);

  @override
  Future<dartz.Either<Failure, ManufacturingOrder>> call(UpdateManufacturingStatusParams params) async {
    return await repository.updateOrderStatus(params.orderId, params.newStatus,params.notes);
  }
}

class UpdateManufacturingStatusParams {
  final String orderId;
  final ManufacturingStatus newStatus;
  final String? notes;

  UpdateManufacturingStatusParams({
    required this.orderId,
    required this.newStatus,
    this.notes,
  });
}
