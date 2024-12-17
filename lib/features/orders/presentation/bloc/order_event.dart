part of 'order_bloc.dart';


abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrders extends OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  final Order order;

  const CreateOrderEvent(this.order);

  @override
  List<Object?> get props => [order];
} 