import 'package:dartz/dartz.dart';
import 'package:lo_wearglass/core/error/failures.dart';
import 'package:lo_wearglass/core/usecases/usecase.dart';
import 'package:lo_wearglass/features/customers/domain/entities/customer.dart';
import 'package:lo_wearglass/features/customers/domain/repositories/customer_repository.dart';

class GetCustomers implements UseCase<List<Customer>, NoParams> {
  final CustomerRepository repository;

  GetCustomers(this.repository);

  @override
  Future<Either<Failure, List<Customer>>> call(NoParams params) async {
    return await repository.getCustomers();
  }
}

