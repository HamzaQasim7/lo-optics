import 'package:json_annotation/json_annotation.dart';
import 'package:lo_wearglass/features/customers/domain/entities/customer.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel extends Customer {
  const CustomerModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
