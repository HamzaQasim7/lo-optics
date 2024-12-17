// lib/features/orders/domain/entities/order.dart
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'order_item.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Equatable {
  final String id;
  final String customerId;
  final DateTime orderDate;
  final OrderStatus status;
  final List<OrderItem> items;
  final double totalAmount;
  final String? notes;

  const Order({
    required this.id,
    required this.customerId,
    required this.orderDate,
    required this.status,
    required this.items,
    required this.totalAmount,
    this.notes,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object?> get props => [
        id,
        customerId,
        orderDate,
        status,
        items,
        totalAmount,
        notes,
      ];
}

enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled
}