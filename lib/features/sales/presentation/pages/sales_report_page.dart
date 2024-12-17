import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lo_wearglass/features/sales/presentation/bloc/sales_bloc.dart';
import 'package:lo_wearglass/features/sales/presentation/widgets/sales_chart.dart';
import 'package:lo_wearglass/features/sales/presentation/widgets/sales_summary.dart';
import '../../domain/entities/sale.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({Key? key}) : super(key: key);

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  DateTimeRange _dateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 30)),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Report'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDateRange(context),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterOptions(context),
          ),
        ],
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
                  const SizedBox(height: 24),
                  _buildSalesList(state.sales),
                ],
              ),
            );
          } else if (state is SalesError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }

  Widget _buildSalesList(List<Sale> sales) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sales.length,
        itemBuilder: (context, index) {
          final sale = sales[index];
          return ListTile(
            title: Text('Invoice: ${sale.invoiceNumber ?? 'N/A'}'),
            subtitle: Text('Amount: \$${sale.totalAmount.toStringAsFixed(2)}'),
            trailing: Text(sale.saleDate.toString().split(' ')[0]),
            onTap: () => _showSaleDetails(context, sale),
          );
        },
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? newRange = await showDateRangePicker(
      context: context,
      initialDateRange: _dateRange,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (newRange != null) {
      setState(() => _dateRange = newRange);
      context.read<SalesBloc>().add(
            LoadSales(
              startDate: newRange.start,
              endDate: newRange.end,
            ),
          );
    }
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('All Sales'),
            onTap: () {
              Navigator.pop(context);
              context.read<SalesBloc>().add(
                    LoadSales(
                      startDate: _dateRange.start,
                      endDate: _dateRange.end,
                    ),
                  );
            },
          ),
          ListTile(
            title: const Text('Paid Only'),
            onTap: () {
              Navigator.pop(context);
              context.read<SalesBloc>().add(
                    LoadSales(
                      startDate: _dateRange.start,
                      endDate: _dateRange.end,
                      paidOnly: true,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  void _showSaleDetails(BuildContext context, Sale sale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sale Details - ${sale.invoiceNumber ?? 'N/A'}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${sale.saleDate.toString().split(' ')[0]}'),
              Text('Amount: \$${sale.amount.toStringAsFixed(2)}'),
              Text('Tax: \$${sale.tax.toStringAsFixed(2)}'),
              Text('Total: \$${sale.totalAmount.toStringAsFixed(2)}'),
              Text('Payment Method: ${sale.paymentMethod.toString().split('.').last}'),
              Text('Status: ${sale.isPaid ? 'Paid' : 'Pending'}'),
              const Divider(),
              const Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...sale.items.map((item) => Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                        '${item.productName} x${item.quantity} - \$${item.totalPrice.toStringAsFixed(2)}'),
                  )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
} 