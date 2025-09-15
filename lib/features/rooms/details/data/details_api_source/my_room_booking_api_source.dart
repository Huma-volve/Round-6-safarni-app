import 'package:dio/dio.dart';

class MyRoomBookingApiSource {
  final Dio dio;
  String baseUrl = 'http://round5-safarnia.huma-volve.com/api/';
  MyRoomBookingApiSource({required this.dio});
  Future<Map<String, dynamic>> postRoom({
    required String endPoint,
    required Map<String, dynamic> data,
    required String token,
  }) async {
    final response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data as Map<String, dynamic>;
  }
}
