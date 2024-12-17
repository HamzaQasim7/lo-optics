import 'package:dartz/dartz.dart';
import 'package:lo_wearglass/features/manufacturing/data/datasource/manufacturing_remote_data_source.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/manufacturing_order.dart';
import '../../domain/repositories/manufacturing_repository.dart';

class ManufacturingRepositoryImpl implements ManufacturingRepository {
  final ManufacturingRemoteDataSource remoteDataSource;

  ManufacturingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ManufacturingOrder>>> getManufacturingOrders() async {
    try {
      final orders = await remoteDataSource.getManufacturingOrders();
      return Right(orders);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ManufacturingOrder>> getManufacturingOrder(String orderId) async {
    try {
      final order = await remoteDataSource.getManufacturingOrder(orderId);
      return Right(order);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ManufacturingOrder>> updateOrderStatus(String orderId, ManufacturingStatus newStatus, String? notes) async {
    try {
      final updatedOrder = await remoteDataSource.updateOrderStatus(orderId, newStatus, notes);
      return Right(updatedOrder);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
