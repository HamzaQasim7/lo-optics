import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../entities/sale.dart';

abstract class SaleRepository {
  Future<dartz.Either<Failure, List<Sale>>> getSales(
    DateTime startDate,
    DateTime endDate,
  );
  Future<dartz.Either<Failure, Sale>> createSale(Sale sale);
} 