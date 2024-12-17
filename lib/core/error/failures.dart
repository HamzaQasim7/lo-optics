import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required String message});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {} 