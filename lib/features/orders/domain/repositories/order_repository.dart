// lib/features/orders/domain/repositories/order_repository.dart
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../entities/order.dart';

abstract class OrderRepository {
  Future<dartz.Either<Failure, List<Order>>> getOrders();
  Future<dartz.Either<Failure, Order>> createOrder(Order order);
  Future<dartz.Either<Failure, Order>> updateOrder(Order order);
}