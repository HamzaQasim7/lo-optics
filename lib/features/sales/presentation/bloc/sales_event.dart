part of 'sales_bloc.dart';

abstract class SalesEvent extends Equatable {
  const SalesEvent();

  @override
  List<Object?> get props => [];
}

class LoadSales extends SalesEvent {
  final DateTime startDate;
  final DateTime endDate;
  final bool? paidOnly;

  const LoadSales({
    required this.startDate,
    required this.endDate,
    this.paidOnly,
  });

  @override
  List<Object?> get props => [startDate, endDate, paidOnly];
} 