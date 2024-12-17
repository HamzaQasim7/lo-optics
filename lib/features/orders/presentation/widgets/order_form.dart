import 'package:flutter/material.dart';
import '../../domain/entities/order.dart';

class OrderForm extends StatefulWidget {
  final Function(Order) onSubmit;

  const OrderForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  // Add form fields and controllers here

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Add form fields here
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Create and submit order
              }
            },
            child: const Text('Create Order'),
          ),
        ],
      ),
    );
  }
} 