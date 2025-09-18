import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_constants.dart';
import 'package:safarni/features/destinations/data/model/activite_model.dart';
import 'package:safarni/features/destinations/data/model/destantion_model.dart';
import 'package:safarni/features/destinations/data/model/reviwe_model.dart';

abstract class BaseDestantionRemoteDataSource {
  Future<DestantionModel> getDestantion(int id);
  Future<List<ReviweModel>> getAllReviwes(int tourId);
  Future<List<ActiviteModel>> getAllActivities();
}

class DestantionRemoteDataSource implements BaseDestantionRemoteDataSource {
  final Dio dio;
  DestantionRemoteDataSource({required this.dio});
  @override
  Future<DestantionModel> getDestantion(int id) async {
    final response = await dio.get(
      ApiConstants.destantion(id),
      options: Options(
        headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
      ),
    );
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
    final response = await dio.get(
      ApiConstants.activities,
      options: Options(
        headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
      ),
    );
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
    final response = await dio.get(
      ApiConstants.reviwes(tourId),
      options: Options(
        headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
      ),
    );
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
