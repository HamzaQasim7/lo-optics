import 'package:get_it/get_it.dart';
import 'package:lo_wearglass/core/network/api_client.dart';
import 'package:lo_wearglass/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lo_wearglass/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lo_wearglass/features/auth/domain/repositories/auth_repository.dart';
import 'package:lo_wearglass/features/auth/domain/usecases/login.dart';
import 'package:lo_wearglass/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lo_wearglass/features/customers/data/datasources/customer_remote_data_source.dart';
import 'package:lo_wearglass/features/customers/data/repositories/customer_repository_impl.dart';
import 'package:lo_wearglass/features/customers/domain/repositories/customer_repository.dart';
import 'package:lo_wearglass/features/manufacturing/data/datasource/manufacturing_remote_data_source.dart';
import 'package:lo_wearglass/features/manufacturing/data/repositories/manufacturing_repository_impl.dart';
import 'package:lo_wearglass/features/manufacturing/domain/repositories/manufacturing_repository.dart';
import 'package:lo_wearglass/features/orders/data/datasources/order_remote_data_source.dart';
import 'package:lo_wearglass/features/sales/data/datasources/sales_remote_data_source.dart';
import 'package:lo_wearglass/features/sales/data/repositories/sale_repository_impl.dart';
import 'package:lo_wearglass/features/sales/domain/repositories/sale_repository.dart';

import '../../features/analytics/presentation/bloc/analytics_bloc.dart';
import '../../features/customers/domain/usecases/get_customers.dart';
import '../../features/customers/presentation/bloc/customer_bloc.dart';
import '../../features/inventory/data/datasources/inventory_remote_data_source.dart';
import '../../features/inventory/data/repositories/inventory_repository_impl.dart';
import '../../features/inventory/domain/repositories/inventory_repository.dart';
import '../../features/inventory/domain/usecases/get_inventory.dart';
import '../../features/inventory/domain/usecases/update_stock.dart';
import '../../features/inventory/presentation/bloc/inventory_bloc.dart';
import '../../features/manufacturing/presentation/bloc/manufacturing_bloc.dart';
import '../../features/orders/data/repositories/order_repository_impl.dart';
import '../../features/orders/domain/repositories/order_repository.dart';
import '../../features/orders/domain/usecases/create_order.dart';
import '../../features/orders/domain/usecases/get_orders.dart';
import '../../features/orders/domain/usecases/update_order.dart';
import '../../features/orders/presentation/bloc/order_bloc.dart';
import '../../features/sales/presentation/bloc/sales_bloc.dart';
import '../../features/analytics/data/datasources/analytics_remote_data_source.dart';
import '../../features/analytics/data/repositories/analytics_repository_impl.dart';
import '../../features/analytics/domain/repositories/analytics_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => ApiClient());

  // Features - Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerFactory(() => AuthBloc(login: sl()));

  // Features - Customers
  sl.registerLazySingleton<CustomerRemoteDataSource>(
    () => CustomerRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetCustomers(sl()));
  sl.registerFactory(() => CustomerBloc(getCustomers: sl()));

  // Features - Inventory
  sl.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetInventory(sl()));
  sl.registerLazySingleton(() => UpdateStock(sl()));
  sl.registerFactory(() => InventoryBloc(
        getInventory: sl(),
        updateStock: sl(),
      ));

  // Features - Orders
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetOrders(sl()));
  sl.registerLazySingleton(() => CreateOrder(sl()));
  sl.registerLazySingleton(() => UpdateOrder(sl()));
  sl.registerFactory(() => OrderBloc(
        getOrders: sl(),
        createOrder: sl(),
        updateOrder: sl(),
      ));

  sl.registerFactory(() => AnalyticsBloc(getAnalytics: sl()
      // Pass required dependencies here
      // For example:
      // analyticsUseCase: sl(),
      ));

  // Features - Manufacturing
  // Add registrations for Manufacturing dependencies
  sl.registerFactory(() => ManufacturingBloc(
        getOrder: sl(), // Make sure to register the required use cases
        updateStatus: sl(),
      ));
  sl.registerLazySingleton<ManufacturingRemoteDataSource>(
    () => ManufacturingRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ManufacturingRepository>(
    () => ManufacturingRepositoryImpl(remoteDataSource: sl()),
  );
  // Features - Sales
  // Add registrations for Sales dependencies
  sl.registerFactory(() => SalesBloc(getSales: sl()));

  sl.registerLazySingleton<SalesRemoteDataSource>(
    () => SalesRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<SaleRepository>(
    () => SaleRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AnalyticsRemoteDataSource>(
    () => AnalyticsRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<AnalyticsRepository>(
    () => AnalyticsRepositoryImpl(remoteDataSource: sl()),
  );
}
