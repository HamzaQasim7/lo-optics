import 'package:dartz/dartz.dart';
import 'package:lo_wearglass/core/error/failures.dart';
import 'package:lo_wearglass/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lo_wearglass/features/auth/domain/entities/user.dart';
import 'package:lo_wearglass/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      final user = await remoteDataSource.login(username, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
