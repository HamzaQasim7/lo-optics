import 'package:dartz/dartz.dart';
import 'package:lo_wearglass/core/error/failures.dart';
import 'package:lo_wearglass/features/customers/data/datasources/customer_remote_data_source.dart';
import 'package:lo_wearglass/features/customers/data/models/customer_model.dart';
import 'package:lo_wearglass/features/customers/domain/entities/customer.dart';
import 'package:lo_wearglass/features/customers/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Customer>>> getCustomers() async {
    try {
      final customers = await remoteDataSource.getCustomers();
      return Right(customers);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> getCustomer(String id) async {
    try {
      final customer = await remoteDataSource.getCustomer(id);
      return Right(customer);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> createCustomer(Customer customer) async {
    try {
      final createdCustomer =
          await remoteDataSource.createCustomer(customer as CustomerModel);
      return Right(createdCustomer);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> updateCustomer(Customer customer) async {
    try {
      final updatedCustomer =
          await remoteDataSource.updateCustomer(customer as CustomerModel);
      return Right(updatedCustomer);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(String id) async {
    try {
      await remoteDataSource.deleteCustomer(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
