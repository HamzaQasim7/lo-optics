import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  const ProductModel({
    required String id,
    required String name,
    required String sku,
    required String description,
    required double price,
    required int stockQuantity,
    required ProductCategory category,
    Map<String, dynamic>? specifications,
    String? brand,
    required bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    double? reorderPoint,
    String? supplierInfo,
  }) : super(
          id: id,
          name: name,
          sku: sku,
          description: description,
          price: price,
          stockQuantity: stockQuantity,
          category: category,
          specifications: specifications,
          brand: brand,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
          reorderPoint: reorderPoint,
          supplierInfo: supplierInfo,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
} 