import 'package:equatable/equatable.dart';

class NetworkError extends Equatable {
  final String message;
  final String code;
  final dynamic data;

  const NetworkError({
    required this.message,
    required this.code,
    this.data,
  });

  @override
  List<Object?> get props => [message, code, data];

  @override
  String toString() => 'NetworkError(message: $message, code: $code)';
} 