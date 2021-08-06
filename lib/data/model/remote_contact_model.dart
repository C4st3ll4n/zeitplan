import 'package:equatable/equatable.dart';
import 'package:zeitplan/domain/entity/entity.dart';

import '../infra/infra.dart';
import 'remote_phone_model.dart';

const String kName = "name";
const String kEmail = "email";
const String kPhone = "phone";
const String kCPF = "cpf";

class RemoteContactModel extends Equatable {
  final String? firstName, lastName, cpf, email, picture;
  final List<RemotePhoneModel>? phones;

  RemoteContactModel({
    required this.firstName,
    required this.cpf,
    this.lastName,
    this.email,
    this.picture,
    this.phones,
  });

  @override
  List<Object?> get props => [firstName, cpf];

  @override
  bool get stringify => true;

  factory RemoteContactModel.fromJson(Map<String, dynamic> contact) {
    if (!contact.keys.toSet().containsAll([kName, kEmail, kPhone])) {
      throw HttpError.invalidData;
    }
    final String fullName = contact[kName];
    final String firstName = fullName.split(" ")[0];
    final String lastName = fullName.split(" ")[0];
    final String email = contact[kEmail];
    final String cpf = contact[kCPF];

    return RemoteContactModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phones: [RemotePhoneModel(number: contact[kPhone], kind: "PHONE")],
        cpf: cpf,
        picture: "https://www.clipartmax.com/png/middle/"
            "34-340027_user-login"
            "-man-human-body-mobile-person-comments-person-icon-png.png");
  }

  ContactEntity toEntity() {
    return ContactEntity(
      firstName: firstName,
      cpf: cpf,
      email: email,
      lastName: lastName,
      picture: picture,
      phones: phones?.map<PhoneEntity>((e) => e.toEntity()).toList(),
    );
  }
}
