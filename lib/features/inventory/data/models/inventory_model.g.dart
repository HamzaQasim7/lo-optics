// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) =>
    InventoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sku: json['sku'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      category: $enumDecode(_$ProductCategoryEnumMap, json['category']),
      specifications: json['specifications'] as Map<String, dynamic>?,
      brand: json['brand'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      reorderPoint: (json['reorderPoint'] as num?)?.toDouble(),
      supplierInfo: json['supplierInfo'] as String?,
    );

Map<String, dynamic> _$InventoryModelToJson(InventoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'description': instance.description,
      'price': instance.price,
      'stockQuantity': instance.stockQuantity,
      'category': _$ProductCategoryEnumMap[instance.category]!,
      'specifications': instance.specifications,
      'brand': instance.brand,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'reorderPoint': instance.reorderPoint,
      'supplierInfo': instance.supplierInfo,
    };

const _$ProductCategoryEnumMap = {
  ProductCategory.frames: 'frames',
  ProductCategory.lenses: 'lenses',
  ProductCategory.contactLenses: 'contactLenses',
  ProductCategory.accessories: 'accessories',
  ProductCategory.others: 'others',
};
