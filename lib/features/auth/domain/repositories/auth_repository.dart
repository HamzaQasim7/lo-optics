import 'package:dartz/dartz.dart';
import 'package:lo_wearglass/core/error/failures.dart';
import 'package:lo_wearglass/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String username, String password);
}
