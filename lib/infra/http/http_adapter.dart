import 'dart:convert';

import 'package:http/http.dart';

import '../../data/infra/infra.dart';

class HttpAdapter implements HttpClient {
  HttpAdapter(this.client);

  final Client client;

  @override
  Future<dynamic> request(
      {required String? url,
      required String? method,
      Map? body,
      Map? headers}) async {
    final defaultHeaders = headers == null
        ? {
            'content-type': 'application/json',
            'accept': 'application/json',
          }
        : headers.cast<String, String>()
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });

    var jsonBody = body != null ? jsonEncode(body) : null;
    Response response = Response('', 500);
    try {
      Uri uri = Uri.parse(url!);
      if (method == 'post') {
        response = await client
            .post(
              uri,
              headers: defaultHeaders,
              body: jsonBody,
            )
            .timeout(
              Duration(seconds: 10),
            );
      } else if (method == "get") {
        response = await client
            .get(
              uri,
              headers: defaultHeaders,
            )
            .timeout(
              Duration(seconds: 10),
            );
      } else if (method == "put") {
        response =
            await client.put(uri, headers: defaultHeaders, body: jsonBody);
      }
    } catch (e, stck) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isNotEmpty ? json.decode(response.body) : null;
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
