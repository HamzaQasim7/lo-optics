import 'package:lo_wearglass/features/inventory/data/models/inventory_model.dart';

import '../../../../core/network/api_client.dart';

abstract class InventoryRemoteDataSource {
  Future<List<InventoryModel>> getInventory();
  Future<InventoryModel> updateStock(String productId, int newQuantity, String reason);
}

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final ApiClient client;

  InventoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<InventoryModel>> getInventory() async {
    final response = await client.get('/inventory');
    return (response as List)
        .map((item) => InventoryModel.fromJson(item))
        .toList();
  }

  @override
  Future<InventoryModel> updateStock(String productId, int newQuantity, String reason) async {
    final response = await client.put(
      '/inventory/$productId',
      data: {
        'quantity': newQuantity,
        'reason': reason
      },
    );
    return InventoryModel.fromJson(response.data);
  }
} 