import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/sales_bloc.dart';
import '../widgets/sales_summary.dart';
import '../widgets/sales_chart.dart';

class SalesDashboardPage extends StatelessWidget {
  const SalesDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Dashboard'),
      ),
      body: BlocBuilder<SalesBloc, SalesState>(
        builder: (context, state) {
          if (state is SalesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SalesLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SalesSummary(sales: state.sales),
                  const SizedBox(height: 24),
                  SalesChart(sales: state.sales),
                ],
              ),
            );
          } else if (state is SalesError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Select a date range to view sales'));
        },
      ),
    );
  }
} 