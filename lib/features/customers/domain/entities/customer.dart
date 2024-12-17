import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;

  const Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email, phone];
}

