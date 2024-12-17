import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';

abstract class InventoryRepository {
  Future<Either<Failure, List<Product>>> getInventory();
  Future<Either<Failure, Product>> updateStock(String productId, int newQuantity, String reason);
} 