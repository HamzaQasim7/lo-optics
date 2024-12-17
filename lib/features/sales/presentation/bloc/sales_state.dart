part of 'sales_bloc.dart';

abstract class SalesState extends Equatable {
  const SalesState();

  @override
  List<Object?> get props => [];
}

class SalesInitial extends SalesState {}

class SalesLoading extends SalesState {}

class SalesLoaded extends SalesState {
  final List<Sale> sales;

  const SalesLoaded({required this.sales});

  @override
  List<Object?> get props => [sales];
}

class SalesError extends SalesState {
  final String message;

  const SalesError({required this.message});

  @override
  List<Object?> get props => [message];
} 