import 'package:go_router/go_router.dart';
import 'package:lo_wearglass/features/analytics/presentation/pages/analytics_dashboard_page.dart';
import 'package:lo_wearglass/features/auth/presentation/pages/login_page.dart';
import 'package:lo_wearglass/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:lo_wearglass/features/customers/presentation/pages/customer_list_page.dart';
import 'package:lo_wearglass/features/customers/presentation/pages/customer_detail_page.dart';
import 'package:lo_wearglass/features/manufacturing/presentation/pages/manufacturing_queue_page.dart';
import 'package:lo_wearglass/features/orders/presentation/pages/order_list_page.dart';
import 'package:lo_wearglass/features/orders/presentation/pages/order_detail_page.dart';
import 'package:lo_wearglass/features/inventory/presentation/pages/inventory_list_page.dart';
import 'package:lo_wearglass/features/inventory/presentation/pages/product_detail_page.dart';
import 'package:lo_wearglass/features/sales/presentation/pages/sales_dashboard_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/customers',
        builder: (context, state) => const CustomerListPage(),
      ),
      GoRoute(
        path: '/customers/:id',
        builder: (context, state) =>
            CustomerDetailPage(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderListPage(),
      ),
      GoRoute(
        path: '/orders/:id',
        builder: (context, state) => OrderDetailPage(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/inventory',
        builder: (context, state) => const InventoryListPage(),
      ),
      GoRoute(
        path: '/inventory/:id',
        builder: (context, state) => ProductDetailPage(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/manufacturing',
        builder: (context, state) => const ManufacturingQueuePage(),
      ),
      GoRoute(
        path: '/sales',
        builder: (context, state) => const SalesDashboardPage(),
      ),
      GoRoute(
        path: '/analytics',
        builder: (context, state) => const AnalyticsDashboardPage(),
      ),
    ],
  );
}
