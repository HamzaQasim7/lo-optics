import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders implements UseCase<List<Order>, NoParams> {
  final OrderRepository repository;

  GetOrders(this.repository);

  @override
  Future<dartz.Either<Failure, List<Order>>> call(NoParams params) async {
    return await repository.getOrders();
  }
} 