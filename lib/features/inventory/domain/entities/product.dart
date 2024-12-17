import 'package:equatable/equatable.dart';

enum ProductCategory {
  frames,
  lenses,
  contactLenses,
  accessories,
  others
}

class Product extends Equatable {
  final String id;
  final String name;
  final String sku;
  final String description;
  final double price;
  final int stockQuantity;
  final ProductCategory category;
  final Map<String, dynamic>? specifications;
  final String? brand;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final double? reorderPoint;
  final String? supplierInfo;

  const Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.category,
    this.specifications,
    this.brand,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
    this.reorderPoint,
    this.supplierInfo,
  });

  bool get needsRestock => 
      reorderPoint != null && stockQuantity <= reorderPoint!;

  @override
  List<Object?> get props => [
        id,
        name,
        sku,
        description,
        price,
        stockQuantity,
        category,
        specifications,
        brand,
        isActive,
        createdAt,
        updatedAt,
        reorderPoint,
        supplierInfo,
      ];
} 