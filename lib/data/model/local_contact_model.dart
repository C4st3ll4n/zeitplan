import 'package:equatable/equatable.dart';
import 'package:zeitplan/data/model/local_phone_model.dart';
import 'package:zeitplan/domain/entity/entity.dart';

import 'remote_contact_model.dart' show kCPF, kEmail, kName, kPhone;

class LocalContactModel extends Equatable {
  final String? firstName, lastName, cpf, email, picture;
  final List<PhoneEntity>? phones;

  LocalContactModel({
    required this.firstName,
    required this.cpf,
    this.lastName,
    this.email,
    this.picture,
    this.phones,
  });

  @override
  List<Object?> get props => [firstName, cpf];

  factory LocalContactModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([kName, kEmail, kPhone])) {
      throw Exception("One or more key are missing");
    }

    final String cpf = json[kCPF];
    final String name = json[kName];
    final String email = json[kEmail];

    final firstName = name.split(" ")[0];
    final lastName = name.split(" ")[1];

    return LocalContactModel(
        firstName: firstName, lastName: lastName, email: email, cpf: cpf);
  }

  ContactEntity toEntity() {
    return ContactEntity(firstName: firstName, cpf: cpf);
  }

  factory LocalContactModel.fromEntity(ContactEntity entity) {
    return LocalContactModel(
        firstName: entity.firstName,
        cpf: entity.cpf,
        lastName: entity.lastName,
        email: entity.email,
        picture: entity.picture,
        phones: entity.phones);
  }

  Map toJson() => {
        kName: "${this.firstName} ${this.lastName}",
        kEmail: this.email ?? "",
        kCPF: this.cpf!,
        kPhone: this
            .phones
            ?.map((e) => LocalPhoneModel.fromEntity(e).toJson())
            .toList(),
      };
}
