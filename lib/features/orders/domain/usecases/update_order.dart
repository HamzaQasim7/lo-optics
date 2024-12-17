// lib/features/orders/domain/usecases/update_order.dart
import 'package:dartz/dartz.dart'as dartz;
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class UpdateOrder implements UseCase<Order, UpdateOrderParams> {
  final OrderRepository repository;

  UpdateOrder(this.repository);

  @override
  Future<dartz.Either<Failure, Order>> call(UpdateOrderParams params) async {
    return await repository.updateOrder(params.order);
  }
}

class UpdateOrderParams extends Equatable {
  final Order order;

  const UpdateOrderParams({required this.order});

  @override
  List<Object?> get props => [order];
}