import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/sale.dart';
import 'sale_item_model.dart';

part 'sale_model.g.dart';

@JsonSerializable()
class SaleModel extends Sale {
  const SaleModel({
    required String id,
    required String orderId,
    required String customerId,
    required double amount,
    required double tax,
    required double totalAmount,
    required PaymentMethod paymentMethod,
    required DateTime saleDate,
    List<SaleItemModel>? items,
    String? invoiceNumber,
    bool isPaid = false,
    Map<String, dynamic>? additionalCharges,
    String? notes,
  }) : super(
          id: id,
          orderId: orderId,
          customerId: customerId,
          amount: amount,
          tax: tax,
          totalAmount: totalAmount,
          paymentMethod: paymentMethod,
          saleDate: saleDate,
          items: items ?? [],
          invoiceNumber: invoiceNumber,
          isPaid: isPaid,
          additionalCharges: additionalCharges,
          notes: notes,
        );

  factory SaleModel.fromJson(Map<String, dynamic> json) => _$SaleModelFromJson(json);
  Map<String, dynamic> toJson() => _$SaleModelToJson(this);

  static SaleModel fromEntity(Sale sale) {
    return SaleModel(
      id: sale.id,
      orderId: sale.orderId,
      customerId: sale.customerId,
      amount: sale.amount,
      tax: sale.tax,
      totalAmount: sale.totalAmount,
      paymentMethod: sale.paymentMethod,
      saleDate: sale.saleDate,
      items: sale.items,
      invoiceNumber: sale.invoiceNumber,
      isPaid: sale.isPaid,
      additionalCharges: sale.additionalCharges,
      notes: sale.notes,
    );
  }
} 