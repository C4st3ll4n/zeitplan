import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../infra/cache/cache.dart' show LocalStorageSecureAdapter;

LocalStorageSecureAdapter makeLocalStorageSecureAdapter() {
  return LocalStorageSecureAdapter(FlutterSecureStorage());
}
