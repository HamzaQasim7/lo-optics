import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/sale.dart';
import '../../domain/repositories/sale_repository.dart';
import '../datasources/sales_remote_data_source.dart';
import '../models/sale_model.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SalesRemoteDataSource remoteDataSource;

  SaleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Sale>>> getSales(DateTime startDate, DateTime endDate) async {
    try {
      final sales = await remoteDataSource.getSales(startDate, endDate);
      return Right(sales); // Return the sales wrapped in Right
    } catch (e) {
      return Left(Failure(message: e.toString())); // Handle the error and return a Failure
    }
  }

  @override
  Future<Either<Failure, Sale>> createSale(Sale sale) async {
    try {
      final saleModel = SaleModel.fromEntity(sale);
      final createdSale = await remoteDataSource.createSale(saleModel);
      return Right(createdSale); // Return the created sale wrapped in Right
    } catch (e) {
      return Left(Failure(message: e.toString())); // Handle the error and return a Failure
    }
  }
} 