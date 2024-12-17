import 'package:flutter/material.dart';

class InventoryListPage extends StatelessWidget {
  const InventoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: const Center(child: Text('Inventory List Page')),
    );
  }
} 