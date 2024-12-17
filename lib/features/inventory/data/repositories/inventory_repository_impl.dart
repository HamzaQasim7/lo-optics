import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasources/inventory_remote_data_source.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource remoteDataSource;

  InventoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getInventory() async {
    try {
      final result = await remoteDataSource.getInventory();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateStock(String productId, int newQuantity, String reason) async {
    try {
      final result = await remoteDataSource.updateStock(productId, newQuantity, reason);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
} 