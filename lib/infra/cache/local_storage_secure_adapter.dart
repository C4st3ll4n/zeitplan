import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/infra/infra.dart';

class LocalStorageSecureAdapter
    implements
        SaveSecureCacheStorage,
        FetchSecureCacheStorage,
        DeleteSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageSecureAdapter(this.secureStorage);

  @override
  Future<void> save({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<String> load({required String key}) async {
    final value = await secureStorage.read(key: key);
    return value!;
  }

  @override
  Future<void> remove({required String key}) async =>
      await secureStorage.delete(key: key);
}
