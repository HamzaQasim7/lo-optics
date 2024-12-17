// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturing_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufacturingOrderModel _$ManufacturingOrderModelFromJson(
        Map<String, dynamic> json) =>
    ManufacturingOrderModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      status: $enumDecode(_$ManufacturingStatusEnumMap, json['status']),
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      assignedTo: json['assignedTo'] as String,
      specifications: Map<String, String>.from(json['specifications'] as Map),
      qualityCheckpoints: (json['qualityCheckpoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
      isDelayed: json['isDelayed'] as bool? ?? false,
      priority: $enumDecodeNullable(
              _$ManufacturingPriorityEnumMap, json['priority']) ??
          ManufacturingPriority.normal,
    );

Map<String, dynamic> _$ManufacturingOrderModelToJson(
        ManufacturingOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'status': _$ManufacturingStatusEnumMap[instance.status]!,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'assignedTo': instance.assignedTo,
      'specifications': instance.specifications,
      'qualityCheckpoints': instance.qualityCheckpoints,
      'notes': instance.notes,
      'isDelayed': instance.isDelayed,
      'priority': _$ManufacturingPriorityEnumMap[instance.priority]!,
    };

const _$ManufacturingStatusEnumMap = {
  ManufacturingStatus.pending: 'pending',
  ManufacturingStatus.inProgress: 'inProgress',
  ManufacturingStatus.completed: 'completed',
  ManufacturingStatus.onHold: 'onHold',
  ManufacturingStatus.cancelled: 'cancelled',
};

const _$ManufacturingPriorityEnumMap = {
  ManufacturingPriority.low: 'low',
  ManufacturingPriority.normal: 'normal',
  ManufacturingPriority.high: 'high',
  ManufacturingPriority.urgent: 'urgent',
};
