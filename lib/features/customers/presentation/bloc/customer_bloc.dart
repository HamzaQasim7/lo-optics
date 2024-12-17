import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lo_wearglass/core/usecases/usecase.dart';
import 'package:lo_wearglass/features/customers/domain/entities/customer.dart';
import 'package:lo_wearglass/features/customers/domain/usecases/get_customers.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final GetCustomers getCustomers;

  CustomerBloc({required this.getCustomers}) : super(CustomerInitial()) {
    on<LoadCustomers>((event, emit) async {
      emit(CustomerLoading());
      final result = await getCustomers(NoParams());
      result.fold(
        (failure) => emit(const CustomerError(message: 'Failed to load customers')),
        (customers) => emit(CustomerLoaded(customers: customers)),
      );
    });
  }
}

