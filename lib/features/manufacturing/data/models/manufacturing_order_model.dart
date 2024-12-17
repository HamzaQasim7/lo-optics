import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/manufacturing_order.dart';

part 'manufacturing_order_model.g.dart';

@JsonSerializable()
class ManufacturingOrderModel extends ManufacturingOrder {
  const ManufacturingOrderModel({
    required String id,
    required String productId,
    required int quantity,
    required ManufacturingStatus status,
    required DateTime scheduledDate,
    required String assignedTo,
    required Map<String, String> specifications,
    required List<String> qualityCheckpoints,
    String? notes,
    bool isDelayed = false,
    ManufacturingPriority priority = ManufacturingPriority.normal,
  }) : super(
          id: id,
          productId: productId,
          quantity: quantity,
          status: status,
          scheduledDate: scheduledDate,
          assignedTo: assignedTo,
          specifications: specifications,
          qualityCheckpoints: qualityCheckpoints,
          notes: notes,
          isDelayed: isDelayed,
          priority: priority,
        );

  factory ManufacturingOrderModel.fromJson(Map<String, dynamic> json) =>
      _$ManufacturingOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturingOrderModelToJson(this);
}
