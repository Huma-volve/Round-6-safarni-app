import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_urls.dart';
import '../models/profile_model.dart';

abstract class UserRemoteDataSource {
  Future<ProfileModel> getUser(String userId);
  Future<void> deleteAccount(String token);
  Future<void> logout(String token);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProfileModel> getUser(String userId) async {
    try {
      final response = await dio.get('https://talentflowa.com/api-test/user');

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } on DioException {
      throw Exception('therer was an error');
    }
  }

  @override
  Future<void> deleteAccount(String token) async {
    try {
     final response = await dio.post(
        ApiUrls.deleteAccount,
        data: {
          'password': 'Abdoronaldo@7',
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print('Status: ${response.statusCode}');
      print('Response: ${response.data}');

      print(response);
      if (response.statusCode != 200) {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException message: ${e.message}');
      throw Exception('therer was an error');
    }
  }

  Future<void> logout(String token) async {
     try {
    final response = await dio.post(
      ApiUrls.logOut,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    print('response : ${response}');
    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
     } on DioException catch (e) {
      print('DioException message: ${e.message}');
      throw Exception('therer was an error');
    }
  }
}
