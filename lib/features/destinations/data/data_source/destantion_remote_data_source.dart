import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_constants.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/destinations/data/model/activite_model.dart';
import 'package:safarni/features/destinations/data/model/destantion_model.dart';
import 'package:safarni/features/destinations/data/model/reviwe_model.dart';

abstract class BaseDestantionRemoteDataSource {
  Future<DestantionModel> getDestantion(int id);
  Future<List<ReviweModel>> getAllReviwes(int tourId);
  Future<List<ActiviteModel>> getAllActivities();
}

class DestantionRemoteDataSource implements BaseDestantionRemoteDataSource {
  DestantionRemoteDataSource();

  Future<String?> _getToken() async {
    final userJson = await sl<CacheHelper>().getData('user');
    return userJson != null ? jsonDecode(userJson)['token'] : null;
  }

  Future<Dio> createDio() async {
    final token = await _getToken();
    return Dio(
      BaseOptions(
        headers: {if (token != null) 'Authorization': 'Bearer $token'},
      ),
    );
  }

  @override
  Future<DestantionModel> getDestantion(int id) async {
    final dio = await createDio();
    final response = await dio.get(ApiConstants.destantion(id));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return DestantionModel.fromJson(response.data['data']);
    } else {
      throw Exception(
        'Status Code: ${response.statusCode}, Body: ${response.data}',
      );
    }
  }

  @override
  Future<List<ActiviteModel>> getAllActivities() async {
    final dio = await createDio();
    final response = await dio.get(ApiConstants.activities);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<ActiviteModel>.from(
        (response.data['data'] as List).map((e) => ActiviteModel.fromJson(e)),
      );
    } else {
      throw Exception(
        'Status Code: ${response.statusCode}, Body: ${response.data}',
      );
    }
  }

  @override
  Future<List<ReviweModel>> getAllReviwes(int tourId) async {
    final dio = await createDio();
    final response = await dio.get(ApiConstants.reviwes(tourId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<ReviweModel>.from(
        (response.data['data']['reviews'] as List).map(
          (e) => ReviweModel.fromJson(e),
        ),
      );
    } else {
      throw Exception(
        'Status Code: ${response.statusCode}, Body: ${response.data}',
      );
    }
  }
}
