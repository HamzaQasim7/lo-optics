import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/sale.dart';
import '../repositories/sale_repository.dart';

class GetSales implements UseCase<List<Sale>, GetSalesParams> {
  final SaleRepository repository;

  GetSales(this.repository);

  @override
  Future<dartz.Either<Failure, List<Sale>>> call(GetSalesParams params) async {
    return await repository.getSales(params.startDate, params.endDate);
  }
}

class GetSalesParams {
  final DateTime startDate;
  final DateTime endDate;

  GetSalesParams({required this.startDate, required this.endDate});
} 