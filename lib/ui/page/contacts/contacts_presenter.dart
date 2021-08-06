import 'package:zeitplan/domain/entity/entity.dart';

abstract class ContactsPresenter {
  Stream<bool> get isLoadingStream;
  Stream<List<ContactEntity>> get contactsStream;

  Future<void> loadData();
  void goToContactDetail(String id);
  void call(String phone);
}
