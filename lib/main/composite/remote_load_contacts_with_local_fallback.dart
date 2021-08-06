import 'package:zeitplan/data/usecase/load_contacts/local_load_contacts.dart';
import 'package:zeitplan/data/usecase/load_contacts/remote_load_contacts.dart';
import 'package:zeitplan/domain/entity/entity.dart';
import 'package:zeitplan/domain/helper/domain_error.dart';
import 'package:zeitplan/domain/usecase/usecase.dart';

class RemoteLoadContactsWithLocalFallback implements LoadContacts {
  final RemoteLoadContacts remote;
  final LocalLoadContacts local;
  RemoteLoadContactsWithLocalFallback(
      {required this.local, required this.remote});
  @override
  Future<List<ContactEntity>> load() async {
    try {
      final data = await remote.load();
      await local.save(data);
      return data;
    } catch (err) {
      if (err == DomainError.accessDenied) {
        rethrow;
      }

      await local.validate();
      return local.load();
    }
  }
}
