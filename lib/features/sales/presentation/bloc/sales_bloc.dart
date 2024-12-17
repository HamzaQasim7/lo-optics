import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/sale.dart';
import '../../domain/usecases/get_sales.dart';

part 'sales_event.dart';
part 'sales_state.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final GetSales getSales;

  SalesBloc({required this.getSales}) : super(SalesInitial()) {
    on<LoadSales>((event, emit) async {
      emit(SalesLoading());
      final result = await getSales(GetSalesParams(
        startDate: event.startDate,
        endDate: event.endDate,
      ));
      result.fold(
        (failure) => emit(SalesError(message: 'Failed to load sales')),
        (sales) => emit(SalesLoaded(sales: sales)),
      );
    });
  }
} 