import 'package:lo_wearglass/core/network/api_client.dart';
import '../models/sale_model.dart';

abstract class SalesRemoteDataSource {
  Future<List<SaleModel>> getSales(DateTime startDate, DateTime endDate);
  Future<SaleModel> createSale(SaleModel sale);
}

class SalesRemoteDataSourceImpl implements SalesRemoteDataSource {
  final ApiClient client;

  SalesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SaleModel>> getSales(DateTime startDate, DateTime endDate) async {
    final response = await client.get('/sales', queryParameters: {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    });
    return (response.data as List).map((sale) => SaleModel.fromJson(sale)).toList();
  }

  @override
  Future<SaleModel> createSale(SaleModel sale) async {
    final response = await client.post('/sales', data: sale.toJson());
    return SaleModel.fromJson(response.data);
  }
} 