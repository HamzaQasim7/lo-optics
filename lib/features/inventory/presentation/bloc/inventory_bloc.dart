import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lo_wearglass/core/usecases/usecase.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_inventory.dart';
import '../../domain/usecases/update_stock.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetInventory getInventory;
  final UpdateStock updateStock;

  InventoryBloc({
    required this.getInventory,
    required this.updateStock,
  }) : super(InventoryInitial()) {
    on<LoadInventory>((event, emit) async {
      emit(InventoryLoading());
      final result = await getInventory(NoParams());
      result.fold(
        (failure) => emit(InventoryError(message: 'Failed to load inventory')),
        (inventory) => emit(InventoryLoaded(inventory)),
      );
    });

    on<UpdateStockEvent>((event, emit) async {
      emit(InventoryLoading());
      final result = await updateStock(
        UpdateStockParams(
          productId: event.productId,
          newQuantity: event.newQuantity,
          reason: event.reason,
        ),
      );
      result.fold(
        (failure) => emit(InventoryError(message: 'Failed to update stock')),
        (product) => emit(InventoryLoaded([product])),
      );
    });
  }
} 