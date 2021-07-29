import '../entity/entity.dart';

abstract class AddContact {
  Future<void> add(AddContactParams params);
}

class AddContactParams {
  final String? firstName, lastName, cpf, email, picture;
  final List<PhoneEntity>? phones;

  AddContactParams({
    required this.firstName,
    required this.cpf,
    this.lastName,
    this.email,
    this.picture,
    this.phones,
  });
}
