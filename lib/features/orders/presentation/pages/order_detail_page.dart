import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final String id;

  const OrderDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order $id')),
      body: Center(child: Text('Order Detail Page for ID: $id')),
    );
  }
} 