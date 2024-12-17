import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(child: Text('Product Detail Page for ID: $id')),
    );
  }
} 