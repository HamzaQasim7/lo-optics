part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadInventory extends InventoryEvent {}

class UpdateStockEvent extends InventoryEvent {
  final String productId;
  final int newQuantity;
  final String reason;

  const UpdateStockEvent({
    required this.productId,
    required this.newQuantity,
    required this.reason,
  });

  @override
  List<Object?> get props => [productId, newQuantity, reason];
}

class AddProduct extends InventoryEvent {
  final String name;
  final String sku;
  final String description;
  final double price;
  final int stockQuantity;
  final ProductCategory category;
  final String brand;
  final double? reorderPoint;

  const AddProduct({
    required this.name,
    required this.sku,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.category,
    required this.brand,
    this.reorderPoint,
  });

  @override
  List<Object?> get props => [name, sku, description, price, stockQuantity, category, brand, reorderPoint];
} 