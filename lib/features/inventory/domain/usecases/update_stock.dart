import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/inventory_repository.dart';

class UpdateStock implements UseCase<Product, UpdateStockParams> {
  final InventoryRepository repository;

  UpdateStock(this.repository);

  @override
  Future<Either<Failure, Product>> call(UpdateStockParams params) async {
    return await repository.updateStock(
      params.productId,
      params.newQuantity,
      params.reason,
    );
  }
}

class UpdateStockParams extends Equatable {
  final String productId;
  final int newQuantity;
  final String reason;

  const UpdateStockParams({
    required this.productId,
    required this.newQuantity,
    required this.reason,
  });

  @override
  List<Object?> get props => [productId, newQuantity, reason];
} 