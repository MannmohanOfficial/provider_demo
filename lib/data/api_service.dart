import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_demo/data/api_endpoint.dart';

class ApiService {

  static ApiService get instance => ApiService();

  // GET request
  Future<AppResponse> get(String endpoint) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}$endpoint');
    try {
      final response = await http.get(url);
      return _processResponse(response);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  // POST request
  Future<AppResponse> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  // PUT request
  Future<AppResponse> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}$endpoint');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }

  // DELETE request
  Future<AppResponse> delete(String endpoint) async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}$endpoint');
    try {
      final response = await http.delete(url);
      return _processResponse(response);
    } catch (e) {
      throw Exception('Failed to delete data: $e');
    }
  }

  // Handle response and errors
  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return AppResponse(
        message: "success",
        responseBody: response.body,
        responseCode: response.statusCode
      );
    } else {
      // throw Exception('Error: ${response.statusCode}, ${response.body}');
      return AppResponse(
        message: "failed",
        errorMessage: jsonDecode(response.body)["error"],
        responseCode: response.statusCode,
      );
    }
  }
}

class AppResponse {
  String? message;
  String? errorMessage;
  dynamic responseBody;
  int? responseCode;

  AppResponse({this.message, this.errorMessage, this.responseBody, this.responseCode});
}