import 'package:lo_wearglass/core/network/api_client.dart';
import '../models/analytics_data_model.dart';

abstract class AnalyticsRemoteDataSource {
  Future<AnalyticsDataModel> getSalesAnalytics(DateTime startDate, DateTime endDate);
}

class AnalyticsRemoteDataSourceImpl implements AnalyticsRemoteDataSource {
  final ApiClient client;

  AnalyticsRemoteDataSourceImpl({required this.client});

  @override
  Future<AnalyticsDataModel> getSalesAnalytics(DateTime startDate, DateTime endDate) async {
    final response = await client.get('/analytics/sales', queryParameters: {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    });
    return AnalyticsDataModel.fromJson(response.data);
  }
} 