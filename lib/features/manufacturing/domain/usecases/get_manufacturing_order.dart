import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/manufacturing_order.dart';
import '../repositories/manufacturing_repository.dart';

class GetManufacturingOrder implements UseCase<ManufacturingOrder, String> {
  final ManufacturingRepository repository;

  GetManufacturingOrder(this.repository);

  @override
  Future<dartz.Either<Failure, ManufacturingOrder>> call(String orderId) async {
    return await repository.getManufacturingOrder(orderId);
  }
} 