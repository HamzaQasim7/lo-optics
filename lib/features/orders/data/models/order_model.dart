// lib/features/orders/data/models/order_model.dart
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/order.dart';
import 'order_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends Order {
  const OrderModel({
    required String id,
    required String customerId,
    required DateTime orderDate,
    required OrderStatus status,
    required List<OrderItemModel> items,
    required double totalAmount,
    String? notes,
  }) : super(
          id: id,
          customerId: customerId,
          orderDate: orderDate,
          status: status,
          items: items,
          totalAmount: totalAmount,
          notes: notes,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromEntity(Order order) {
    return OrderModel(
      id: order.id,
      customerId: order.customerId,
      orderDate: order.orderDate,
      status: order.status,
      items: order.items.map((item) => OrderItemModel.fromEntity(item)).toList(),
      totalAmount: order.totalAmount,
      notes: order.notes,
    );
  }
}
