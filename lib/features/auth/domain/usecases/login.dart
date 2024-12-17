import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lo_wearglass/core/error/failures.dart';
import 'package:lo_wearglass/core/usecases/usecase.dart';
import 'package:lo_wearglass/features/auth/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.username, params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
