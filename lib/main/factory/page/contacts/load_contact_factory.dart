import 'package:zeitplan/data/usecase/usecase.dart';
import 'package:zeitplan/domain/usecase/usecase.dart';
import 'package:zeitplan/main/composite/remote_load_contacts_with_local_fallback.dart';
import 'package:zeitplan/main/factory/infra/infra.dart';

LocalLoadContacts makeLocalLoadContacts() =>
    LocalLoadContacts(storage: makeLocalStorageAdapter());

RemoteLoadContacts makeRemoteLoadContacts() => RemoteLoadContacts(
    placeHolderUrl: makeJsonPlaceholderAPI("users"),
    cpfUrl: make4DevAPI("ferramentas_online"),
    client: makeHttpDIOClient());

LoadContacts makeRemoteLoadContactsWithLocalFallback() =>
    RemoteLoadContactsWithLocalFallback(
        local: makeLocalLoadContacts(), remote: makeRemoteLoadContacts());
