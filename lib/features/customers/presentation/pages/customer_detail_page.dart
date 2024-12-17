import 'package:flutter/material.dart';

class CustomerDetailPage extends StatelessWidget {
  final String id;

  const CustomerDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer $id')),
      body: Center(child: Text('Customer Detail Page for ID: $id')),
    );
  }
} 