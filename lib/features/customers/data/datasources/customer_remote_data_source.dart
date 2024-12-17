import 'package:lo_wearglass/core/network/api_client.dart';
import 'package:lo_wearglass/features/customers/data/models/customer_model.dart';

abstract class CustomerRemoteDataSource {
  Future<List<CustomerModel>> getCustomers();
  Future<CustomerModel> getCustomer(String id);
  Future<CustomerModel> createCustomer(CustomerModel customer);
  Future<CustomerModel> updateCustomer(CustomerModel customer);
  Future<void> deleteCustomer(String id);
}

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final ApiClient client;

  CustomerRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CustomerModel>> getCustomers() async {
    final response = await client.get('/wc/v3/customers');
    return (response.data as List)
        .map((json) => CustomerModel.fromJson(json))
        .toList();
  }

  @override
  Future<CustomerModel> getCustomer(String id) async {
    final response = await client.get('/wc/v3/customers/$id');
    return CustomerModel.fromJson(response.data);
  }

  @override
  Future<CustomerModel> createCustomer(CustomerModel customer) async {
    final response =
        await client.post('/wc/v3/customers', data: customer.toJson());
    return CustomerModel.fromJson(response.data);
  }

  @override
  Future<CustomerModel> updateCustomer(CustomerModel customer) async {
    final response = await client.put('/wc/v3/customers/${customer.id}',
        data: customer.toJson());
    return CustomerModel.fromJson(response.data);
  }

  @override
  Future<void> deleteCustomer(String id) async {
    await client.delete('/wc/v3/customers/$id');
  }
}
