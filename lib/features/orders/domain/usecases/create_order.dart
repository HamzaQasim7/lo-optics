// lib/features/orders/domain/usecases/create_order.dart
import 'package:dartz/dartz.dart' as dartz;
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class CreateOrder implements UseCase<Order, CreateOrderParams> {
  final OrderRepository repository;

  CreateOrder(this.repository);

  @override
  Future<dartz.Either<Failure, Order>> call(CreateOrderParams params) async {
    return await repository.createOrder(params.order);
  }
}

class CreateOrderParams extends Equatable {
  final Order order;

  const CreateOrderParams({required this.order});

  @override
  List<Object?> get props => [order];
}