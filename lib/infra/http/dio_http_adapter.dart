import 'package:dio/dio.dart';
import 'package:zeitplan/data/infra/infra.dart';

class DioHttpAdapter implements HttpClient {
  DioHttpAdapter(this.dio);

  final Dio dio;

  @override
  Future<dynamic> request(
      {required String url,
      required String method,
      Map? body,
      Map? headers}) async {
    try {
      FormData? data;
      if (body != null) {
        data = FormData.fromMap(body.cast<String, dynamic>());
      }

      if (method == 'post') {
        final response = await dio.post(url,
            data: data ?? FormData(),
            options: Options(
              receiveTimeout: 15000,
              headers: headers?.cast<String, dynamic>() ?? {},
            ));

        return response.data;
      } else if (method == 'get') {
        final response = await dio.get(url,
            options: Options(
              receiveTimeout: 15000,
              headers: headers?.cast<String, dynamic>() ?? {},
            ));

        return response.data;
      } else {
        throw UnimplementedError(
            "Esse verbo $method ainda não fo implementado nesse adapter");
      }
    } catch (err, stck) {
      print(err.toString());
      print(stck.toString());
      throw HttpError.serverError;
    }
  }
}
