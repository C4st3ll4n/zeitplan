import '../entity/entity.dart';

abstract class LoadContacts {
  Future<List<ContactEntity>> load();
}
