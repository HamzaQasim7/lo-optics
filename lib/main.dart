import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lo_wearglass/core/di/injection_container.dart' as di;
import 'package:lo_wearglass/core/routes/app_router.dart';
import 'package:lo_wearglass/features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:lo_wearglass/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lo_wearglass/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:lo_wearglass/core/storage/local_storage.dart';
import 'package:lo_wearglass/core/theme/app_theme.dart';
import 'package:lo_wearglass/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:lo_wearglass/features/manufacturing/presentation/bloc/manufacturing_bloc.dart';
import 'package:lo_wearglass/features/orders/presentation/bloc/order_bloc.dart';
import 'package:lo_wearglass/features/sales/presentation/bloc/sales_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),
        BlocProvider<CustomerBloc>(create: (context) => di.sl<CustomerBloc>()),
        BlocProvider<OrderBloc>(create: (context) => di.sl<OrderBloc>()),
        BlocProvider<InventoryBloc>(
            create: (context) => di.sl<InventoryBloc>()),
        BlocProvider<ManufacturingBloc>(
            create: (context) => di.sl<ManufacturingBloc>()),
        BlocProvider<SalesBloc>(create: (context) => di.sl<SalesBloc>()),
        BlocProvider<AnalyticsBloc>(
            create: (context) => di.sl<AnalyticsBloc>()),
      ],
      child: MaterialApp.router(
        title: 'LO Optics',
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
