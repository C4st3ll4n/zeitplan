import 'dart:developer';

import 'package:zeitplan/data/infra/infra.dart';
import 'package:zeitplan/data/model/model.dart';
import 'package:zeitplan/domain/entity/entity.dart';
import 'package:zeitplan/domain/helper/helper.dart';
import 'package:zeitplan/domain/usecase/usecase.dart';

class LocalLoadContacts implements LoadContacts {
  final CacheStorage storage;

  LocalLoadContacts({required this.storage});

  @override
  Future<List<ContactEntity>> load() async {
    try {
      final response = await storage.fetch("contacts");
      if (response?.isEmpty != false) {
        throw Exception("Cache data is invalid or null");
      }

      return _mapToEntity(response);
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  List<ContactEntity> _mapToEntity(dynamic data) =>
      data.map((e) => LocalContactModel.fromJson(e).toEntity()).toList();

  Future<void> save(List<ContactEntity> contacts) async {
    try {
      await storage.save(key: "contacts", value: _mapToJson(contacts));
    } catch (err) {}
  }

  Future<void> validate() async {
    try {
      final data = await storage.fetch("contacts");
      _mapToEntity(data);
    } catch (e, stck) {
      log("validate::\n\n" + e.toString(), stackTrace: stck);
      await storage.delete("contacts");
    }
  }

  List<Map> _mapToJson(List<ContactEntity> data) => data
      .map(
        (e) => LocalContactModel.fromEntity(e).toJson(),
      )
      .toList();
}
