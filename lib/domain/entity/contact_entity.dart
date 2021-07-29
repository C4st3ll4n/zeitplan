import 'package:equatable/equatable.dart';

import 'phone_entity.dart';

class ContactEntity extends Equatable {
  final String? firstName, lastName, cpf, email, picture;
  final List<PhoneEntity>? phones;

  ContactEntity({
    required this.firstName,
    required this.cpf,
    this.lastName,
    this.email,
    this.picture,
    this.phones,
  });

  @override
  List<Object?> get props => [firstName, cpf];
}
