import 'dart:async';

import 'package:zeitplan/data/infra/infra.dart';
import 'package:zeitplan/data/model/model.dart';
import 'package:zeitplan/domain/entity/contact_entity.dart';
import 'package:zeitplan/domain/helper/domain_error.dart';
import 'package:zeitplan/domain/usecase/usecase.dart';

class RemoteLoadContacts implements LoadContacts {
  final String placeHolderUrl;
  final String cpfUrl;
  final HttpClient client;

  RemoteLoadContacts(
      {required this.placeHolderUrl,
      required this.cpfUrl,
      required this.client});

  @override
  Future<List<ContactEntity>> load() async {
    try {
      final response = await client.request(url: placeHolderUrl, method: "get");

      List<ContactEntity> contacts = await _mapEntity(response);
      print(contacts);
      return contacts;
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }

  Future<List<ContactEntity>> _mapEntity(var response) async {
    List<ContactEntity> contatos = [];

    for (var json in response) {
      final String cpf = await _generateCPF();

      final Map<String, dynamic> _contact = _mapContactJson(cpf, json);

      final contactModel = RemoteContactModel.fromJson(_contact).toEntity();
      contatos.add(contactModel);
    }

    return contatos;
  }

  Map<String, dynamic> _mapContactJson(String cpf, var json) {
    return {
      'cpf': cpf,
      'name': json['name'],
      'email': json['email'],
      'phone': json['phone'],
    };
  }

  Future<String> _generateCPF() async {
    return await client.request(
        url: cpfUrl,
        method: "post",
        body: {"acao": "gerar_cpf"},
        headers: {"content-type": "application/x-www-form-urlencoded"});
  }
}
