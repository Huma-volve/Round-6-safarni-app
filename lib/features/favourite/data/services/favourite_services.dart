import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:safarni/core/constants/app_strings.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/cache_helper.dart';

class FavouriteServices{

  Future<String?> _getToken() async {
    final userJson = await sl<CacheHelper>().getData('user');
    return userJson != null ? jsonDecode(userJson)['token'] : null;
  }

  Future<Dio> createDio() async {
    final token = await _getToken();
    return Dio(
      BaseOptions(
        baseUrl: AppStrings.homeBaseUrl,
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );

  }


  Future< List<dynamic>> getAllFavourites()async{
    try {
      final dio = await createDio();
      final response=await dio.get('favorites');
      return response.data['data'];
    } on DioException catch (e) {
      Future.error(e.toString());
      print("Error status: ${e.response?.statusCode}");
      print("Error data: ${e.response?.data}");

      return[];
    }
  }

  Future<void> addToFavourites(int tourId) async {
    try {
      final dio = await createDio();
      await dio.post('favorites/add/$tourId');
    } on DioException catch (e) {
      Future.error(e.toString());
    }
  }

  Future<void> removeFromFavourites(int tourId) async {
    try {
      final dio = await createDio();
      final response = await dio.delete('favorites/remove/$tourId');
      print('Remove response: ${response.data}');
    } on DioException catch (e) {
      Future.error(e.toString());
    }
  }

}