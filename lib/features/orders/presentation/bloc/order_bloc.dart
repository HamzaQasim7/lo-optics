import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lo_wearglass/features/orders/domain/entities/order.dart';

import '../../domain/usecases/get_orders.dart';
import '../../domain/usecases/create_order.dart';
import '../../domain/usecases/update_order.dart';
import '../../../../core/usecases/usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrders getOrders;
  final CreateOrder createOrder;
  final UpdateOrder updateOrder;

  OrderBloc({
    required this.getOrders,
    required this.createOrder,
    required this.updateOrder,
  }) : super(OrderInitial()) {
    on<LoadOrders>((event, emit) async {
      emit(OrderLoading());
      final result = await getOrders(NoParams());
      result.fold(
        (failure) => emit(OrderError(message: 'Failed to load orders')),
        (orders) => emit(OrderLoaded(orders)),
      );
    });
  }
} 