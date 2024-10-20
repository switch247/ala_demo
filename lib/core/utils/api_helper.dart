import 'dart:convert';
import 'package:aladia/core/secrets/app_secrets.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static const String _baseUrl = AppSecrets.api_url;

  static Future<http.Response> get(
      String endpoint, Map<String, dynamic>? queries) async {
    var url = Uri.parse('$_baseUrl$endpoint');
    // print(url);
    var queryParameters =
        queries?.map((key, value) => MapEntry(key, value.toString())) ?? {};
    url = url.replace(queryParameters: queryParameters);
    var x = await http.get(url);
    // print(x.body);
    return x;
  }

  static Future<http.Response> post(String endpoint, dynamic data) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    // print('URL: $url');
    // print('Data: ${jsonEncode(data)}');

    final response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    return response;
  }

  static Future<http.Response> put(String endpoint, dynamic data) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    // print('URL: $url');
    // print('Data: ${jsonEncode(data)}');

    final response = await http.put(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    return response;
  }

  static Future<http.Response> delete(String endpoint, dynamic data) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    // print('URL: $url');
    // print('Data: ${jsonEncode(data)}');

    final response = await http.delete(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    return response;
  }
}
