import 'dart:convert';
import 'package:dio/dio.dart';
// import 'package:parkify/Core/utlis/Token_Functions.dart';

class ApiClass {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final Dio _dio;

  ApiClass(this._dio);
  //! Handle Headers
  Map<String, String> _buildHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NDM3YzA1OTRiMTU3ZTc1NTA0MTk3YTg4MTRkOGY3NyIsIm5iZiI6MTc1NjYyNjMxNC4yODgsInN1YiI6IjY4YjNmZDhhYzBmYjRiNjA5YmI0ZjFmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LJ6Z1AJZ9PV_zUHUZvP-jN4U_2Ga7_h3qbT80NKFB30';
    return headers;
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode! < 300) {
      try {
        return response.data;
      } catch (e) {
        print('Error decoding response: ${response.data}');
        throw Exception('Expected JSON response but got something else.');
      }
    } else {
      throw Exception('Error ${response.statusCode}: ${response.data}');
    }
  }

  //! Get Request

  Future<dynamic> get({required String endpoint}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$endpoint',
        options: Options(headers: _buildHeaders()),
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  //! Post Request

  Future<dynamic> post({
    required String endpoint,
    required dynamic body,
    String? token,
  }) async {
    // token ??= await getToken();
    try {
      final response = await _dio.post(
        '$_baseUrl$endpoint',
        data: jsonEncode(body),
        options: Options(headers: _buildHeaders()),
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  //! Put Request

  Future<dynamic> put({
    required String endpoint,
    required dynamic body,
    String? token,
  }) async {
    try {
      // token ??= await getToken();
      final response = await _dio.put(
        '$_baseUrl$endpoint',
        data: jsonEncode(body),
        options: Options(headers: _buildHeaders()),
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  //! Delete Request

  Future<dynamic> delete({required String endpoint, String? token}) async {
    try {
      // token ??= await getToken();
      final response = await _dio.delete(
        '$_baseUrl$endpoint',
        options: Options(headers: _buildHeaders()),
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }
}
