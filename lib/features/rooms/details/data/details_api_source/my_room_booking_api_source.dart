import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';

class MyRoomBookingApiSource {
  Future<String?> _getToken() async {
    final userJson = await sl<CacheHelper>().getData('user');
    return userJson != null ? jsonDecode(userJson)['token'] : null;
  }

  Future<Dio> createDio() async {
    final token = await _getToken();
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {if (token != null) 'Authorization': 'Bearer $token'},
      ),
    );
  }

  String baseUrl = 'http://round5-safarnia.huma-volve.com/api/';

  Future<Map<String, dynamic>> postRoom({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final dio = await createDio();
    final response = await dio.post(endPoint, data: data);
    return response.data as Map<String, dynamic>;
  }
}
