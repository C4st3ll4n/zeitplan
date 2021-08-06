import 'package:get/get.dart';
import 'package:zeitplan/data/phone_call/phone_call.dart';
import 'package:zeitplan/domain/entity/contact_entity.dart';
import 'package:zeitplan/domain/helper/helper.dart';
import 'package:zeitplan/domain/usecase/usecase.dart';

import '../ui/page/contacts/contacts.dart' show ContactsPresenter;

class GetXContactsPresenter extends GetxController
    implements ContactsPresenter {
  final LoadContacts loadContacts;
  final LaunchPhoneCall phoneCaller;

  GetXContactsPresenter(
      {required this.loadContacts, required this.phoneCaller});

  var _dataStream = RxList<ContactEntity>();

  var _loadingStream = RxBool(false);

  @override
  Stream<List<ContactEntity>> get contactsStream => _dataStream.stream;

  @override
  Stream<bool> get isLoadingStream => _loadingStream.stream;

  @override
  Future<void> loadData() async {
    _loadingStream.value = true;
    try {
      final contacts = await loadContacts.load();
      _dataStream.addAll(contacts);
    } on DomainError catch (e) {
      _dataStream.subject.addError(
          "Algo de errado aconteceu, tente novamente.", StackTrace.empty);
    }
  }

  @override
  void goToContactDetail(String id) {
    // TODO: implement goToContactDetail
  }

  @override
  void call(String phone) => phoneCaller.call(phone);
}
