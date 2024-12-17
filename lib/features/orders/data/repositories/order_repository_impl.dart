import '../models/order_model.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<dartz.Either<Failure, List<Order>>> getOrders() async {
    try {
      final result = await remoteDataSource.getOrders();
      return dartz.Right(result);
    } catch (e) {
      return dartz.Left(ServerFailure());
    }
  }

  @override
  Future<dartz.Either<Failure, Order>> createOrder(Order order) async {
    try {
      final result = await remoteDataSource.createOrder(order as OrderModel);
      return dartz.Right(result);
    } catch (e) {
      return dartz.Left(ServerFailure());
    }
  }

  @override
  Future<dartz.Either<Failure, Order>> updateOrder(Order order) async {
    try {
      final result = await remoteDataSource.updateOrder(order as OrderModel);
      return dartz.Right(result);
    } catch (e) {
      return dartz.Left(ServerFailure());
    }
  }
} 