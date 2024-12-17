// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevenueData _$RevenueDataFromJson(Map<String, dynamic> json) => RevenueData(
      date: DateTime.parse(json['date'] as String),
      revenue: (json['revenue'] as num).toDouble(),
      orders: (json['orders'] as num).toInt(),
    );

Map<String, dynamic> _$RevenueDataToJson(RevenueData instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'revenue': instance.revenue,
      'orders': instance.orders,
    };
