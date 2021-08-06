import 'package:localstorage/localstorage.dart';
import 'package:zeitplan/data/infra/infra.dart';
import 'package:zeitplan/infra/cache/cache.dart';

CacheStorage makeLocalStorageAdapter() =>
    LocalStorageAdapter(LocalStorage("zeitplan"));
