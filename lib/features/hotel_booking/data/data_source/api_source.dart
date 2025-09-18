import 'package:dio/dio.dart';

class HotelApiSource {
  final Dio dio;
  String baseUrl = 'http://round5-safarnia.huma-volve.com/api/';
  HotelApiSource({required this.dio});
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
