import '../entity/entity.dart';

abstract class LoadContact {
  Future<ContactEntity> load({required String contactId});
}
