part of 'inventory_bloc.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object?> get props => [];
}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryLoaded extends InventoryState {
  final List<Product> inventory;

  const InventoryLoaded(this.inventory);

  @override
  List<Object?> get props => [inventory];
}

class InventoryError extends InventoryState {
  final String message;

  const InventoryError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProductAdded extends InventoryState {
  final Product product;

  const ProductAdded(this.product);

  @override
  List<Object?> get props => [product];
} 