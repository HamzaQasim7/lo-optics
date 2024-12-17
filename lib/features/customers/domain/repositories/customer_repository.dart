import 'package:dartz/dartz.dart';
import 'package:lo_wearglass/core/error/failures.dart';
import 'package:lo_wearglass/features/customers/domain/entities/customer.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getCustomers();
  Future<Either<Failure, Customer>> getCustomer(String id);
  Future<Either<Failure, Customer>> createCustomer(Customer customer);
  Future<Either<Failure, Customer>> updateCustomer(Customer customer);
  Future<Either<Failure, void>> deleteCustomer(String id);
}

