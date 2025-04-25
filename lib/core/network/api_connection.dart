import 'api_routes.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options.baseUrl = ApiRoutes.baseUrl; // Base API URL
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

  }

  Future<Response> post(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    try {
      final response = await dio.post(endpoint,
          data: data, options: Options(headers: headers));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response Body: ${response.data}');
        return response; // Return the successful response
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      print('Dio error: ${e.message}');
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      // Handle general errors
      print('General error: ${e.toString()}');
      throw Exception('General error: ${e.toString()}');
    }
  }

  Future<Response> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await dio.get(
        endpoint,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        print('Response Body: ${response.data}');
        return response; // Return the successful response
      } else {
        throw Exception('Failed to get data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      print('General error: ${e.toString()}');
      throw Exception('General error: ${e.toString()}');
    }
  }

}