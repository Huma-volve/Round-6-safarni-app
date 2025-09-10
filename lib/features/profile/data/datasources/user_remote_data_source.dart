import 'package:dio/dio.dart';
import '../models/profile_model.dart';

abstract class UserRemoteDataSource {
  Future<ProfileModel> getUser(String userId);
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
        throw Exception("Failed to load user: ${response.statusCode}");
      }
    } on DioError catch (e) {
      throw Exception("therer was an error");
    }
  }
}
