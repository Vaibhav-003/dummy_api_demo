import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
import 'api_config.dart';

/// A utility class for handling HTTP network requests.
///
/// This class provides methods for performing GET, POST, PUT, PATCH, and DELETE requests
/// using the `http` package. It handles common network errors and response parsing.
class HttpNetwork {
  /// The base URL for the API.
  final String baseUrl;

  /// The default headers to be included in every request (e.g. Content-Type).
  final Map<String, String> defaultHeaders;

  /// Creates an instance of [HttpNetwork].
  ///
  /// [baseUrl] is required and sets the root URL for all requests.
  /// [defaultHeaders] can be overridden, defaults to JSON content type.
  HttpNetwork({
    required this.baseUrl,
    this.defaultHeaders = const {'Content-Type': 'application/json'},
  });

  // GET
  Future<dynamic> get(ApiConfig config, {Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + config.url),
        headers: headers ?? defaultHeaders,
      );
      responseJson = _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // POST
  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(body),
        headers: headers ?? defaultHeaders,
      );
      responseJson = _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // PUT
  Future<dynamic> put(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(body),
        headers: headers ?? defaultHeaders,
      );
      responseJson = _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // PATCH
  Future<dynamic> patch(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.patch(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(body),
        headers: headers ?? defaultHeaders,
      );
      responseJson = _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // DELETE
  Future<dynamic> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(baseUrl + endpoint),
        headers: headers ?? defaultHeaders,
      );
      responseJson = _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
