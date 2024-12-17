import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/sale.dart';

part 'sale_item_model.g.dart';

@JsonSerializable()
class SaleItemModel extends SaleItem {
  const SaleItemModel({
    required String productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    Map<String, dynamic>? customization,
  }) : super(
          productId: productId,
          productName: productName,
          quantity: quantity,
          unitPrice: unitPrice,
          totalPrice: totalPrice,
          customization: customization,
        );

  factory SaleItemModel.fromJson(Map<String, dynamic> json) => _$SaleItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$SaleItemModelToJson(this);

  static SaleItemModel fromEntity(SaleItem item) {
    return SaleItemModel(
      productId: item.productId,
      productName: item.productName,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      totalPrice: item.totalPrice,
      customization: item.customization,
    );
  }
} 