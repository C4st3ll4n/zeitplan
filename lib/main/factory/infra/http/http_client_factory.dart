import 'package:dio/dio.dart';
import 'package:http/http.dart';

import '../../../../data/infra/infra.dart';
import '../../../../infra/http/http.dart';

HttpClient makeHttpClient() => HttpAdapter(Client());
HttpClient makeHttpDIOClient() => DioHttpAdapter(Dio());
