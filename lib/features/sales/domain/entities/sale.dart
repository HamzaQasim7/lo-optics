import 'package:equatable/equatable.dart';

enum PaymentMethod {
  cash,
  card,
  bankTransfer,
  other
}

class Sale extends Equatable {
  final String id;
  final String orderId;
  final String customerId;
  final double amount;
  final double tax;
  final double totalAmount;
  final PaymentMethod paymentMethod;
  final DateTime saleDate;
  final String? invoiceNumber;
  final bool isPaid;
  final List<SaleItem> items;
  final Map<String, dynamic>? additionalCharges;
  final String? notes;

  const Sale({
    required this.id,
    required this.orderId,
    required this.customerId,
    required this.amount,
    required this.tax,
    required this.totalAmount,
    required this.paymentMethod,
    required this.saleDate,
    required this.items,
    this.invoiceNumber,
    this.isPaid = false,
    this.additionalCharges,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        orderId,
        customerId,
        amount,
        tax,
        totalAmount,
        paymentMethod,
        saleDate,
        invoiceNumber,
        isPaid,
        items,
        additionalCharges,
        notes,
      ];
}

class SaleItem extends Equatable {
  final String productId;
  final String productName;
  final int quantity;
  final double unitPrice;
  final double totalPrice;
  final Map<String, dynamic>? customization;

  const SaleItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.customization,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        quantity,
        unitPrice,
        totalPrice,
        customization,
      ];
} 