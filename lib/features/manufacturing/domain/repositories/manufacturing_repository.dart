import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../entities/manufacturing_order.dart';

abstract class ManufacturingRepository {
  Future<dartz.Either<Failure, List<ManufacturingOrder>>> getManufacturingOrders();
  Future<dartz.Either<Failure, ManufacturingOrder>> getManufacturingOrder(String orderId);
  Future<dartz.Either<Failure, ManufacturingOrder>> updateOrderStatus(
    String orderId,
    ManufacturingStatus newStatus,
    String? notes,
  );
} 