import 'package:lo_wearglass/core/network/api_client.dart';
import 'package:lo_wearglass/features/manufacturing/data/models/manufacturing_order_model.dart';
import 'package:lo_wearglass/features/manufacturing/domain/entities/manufacturing_order.dart'; 

abstract class ManufacturingRemoteDataSource {
  Future<List<ManufacturingOrderModel>> getManufacturingOrders();
  Future<ManufacturingOrderModel> getManufacturingOrder(String orderId);
  Future<ManufacturingOrderModel> updateOrderStatus(String orderId, ManufacturingStatus newStatus, String? notes);
}

class ManufacturingRemoteDataSourceImpl implements ManufacturingRemoteDataSource {
  final ApiClient client;

  ManufacturingRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ManufacturingOrderModel>> getManufacturingOrders() async {
    // Implement API call to fetch manufacturing orders
    final response = await client.get(
      '/manufacturing/orders',
    );
    final List<ManufacturingOrderModel> orders = response.data.map((json) => ManufacturingOrderModel.fromJson(json)).toList();
    return orders;
  }

  @override
  Future<ManufacturingOrderModel> getManufacturingOrder(String orderId) async {
    // Implement API call to fetch a specific manufacturing order
    final response = await client.get(
      '/manufacturing/orders/$orderId',
    );
    return ManufacturingOrderModel.fromJson(response.data);
  }

  @override
  Future<ManufacturingOrderModel> updateOrderStatus(String orderId, ManufacturingStatus newStatus, String? notes) async {
    // Implement API call to update the status of a manufacturing order
    final response = await client.put(
      '/manufacturing/orders/$orderId',
      data: {
        'status': newStatus.name,
        'notes': notes,
      },
    );
    return response.data;
  }
}
