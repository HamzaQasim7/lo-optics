import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          _buildDashboardItem(context, 'Customers', Icons.people, '/customers'),
          _buildDashboardItem(
              context, 'Orders', Icons.shopping_cart, '/orders'),
          _buildDashboardItem(
              context, 'Inventory', Icons.inventory, '/inventory'),
          _buildDashboardItem(context, 'Manufacturing',
              Icons.precision_manufacturing, '/manufacturing'),
          _buildDashboardItem(context, 'Sales', Icons.attach_money, '/sales'),
          _buildDashboardItem(
              context, 'Analytics', Icons.analytics, '/analytics'),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(
      BuildContext context, String title, IconData icon, String route) {
    return InkWell(
      onTap: () => context.push(route),
      child: Card(
        elevation: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0),
            const SizedBox(height: 8.0),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
