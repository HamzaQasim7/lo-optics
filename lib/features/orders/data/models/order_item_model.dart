import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/order_item.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required String productId,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
  }) : super(
          productId: productId,
          quantity: quantity,
          unitPrice: unitPrice,
          totalPrice: totalPrice,
        );

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  factory OrderItemModel.fromEntity(OrderItem orderItem) {
    return OrderItemModel(
      productId: orderItem.productId,
      quantity: orderItem.quantity,
      unitPrice: orderItem.unitPrice,
      totalPrice: orderItem.totalPrice,
    );
  }
} 