import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'revenue_data.g.dart';

@JsonSerializable()
class RevenueData extends Equatable {
  final DateTime date;
  final double revenue;
  final int orders;

  const RevenueData({
    required this.date,
    required this.revenue,
    required this.orders,
  });

  factory RevenueData.fromJson(Map<String, dynamic> json) => _$RevenueDataFromJson(json);
  Map<String, dynamic> toJson() => _$RevenueDataToJson(this);

  @override
  List<Object?> get props => [date, revenue, orders];
} 