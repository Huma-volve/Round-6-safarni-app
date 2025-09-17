import 'package:dio/dio.dart';

class RoomApiSource {
  final Dio dio;
  String baseUrl = 'http://round5-safarnia.huma-volve.com/api/';
  RoomApiSource({required this.dio, required});
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
