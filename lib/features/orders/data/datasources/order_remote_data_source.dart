import '../../../../core/network/api_client.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> createOrder(OrderModel order);
  Future<OrderModel> updateOrder(OrderModel order);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiClient client;

  OrderRemoteDataSourceImpl({required this.client});

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await client.get('/orders');
    return (response as List).map((item) => OrderModel.fromJson(item)).toList();
  }

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    final response = await client.post('/orders', data: order.toJson());
    return OrderModel.fromJson(response.data);
  }

  @override
  Future<OrderModel> updateOrder(OrderModel order) async {
    final response = await client.put('/orders/${order.id}', data: order.toJson());
    return OrderModel.fromJson(response.data);
  }
} 