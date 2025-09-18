import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:safarni/core/constants/app_strings.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/cache_helper.dart';

class HomeServices{

  Future<String?> _getToken() async {
  final userJson = await sl<CacheHelper>().getData('user');
  return userJson != null ? jsonDecode(userJson)['token']:null;
  }
  late final token= _getToken();



late  final Dio dio=Dio(BaseOptions(baseUrl: AppStrings.homeBaseUrl,receiveTimeout: Duration(seconds: 10),sendTimeout: Duration(seconds: 10),
      headers: {
        'Authorization':'Bearer $token'
  }));

 Future<List<dynamic>> getAllRecommendedTours()async{
    try{
      final response = await dio.get('recommendedtour');
      return response.data['data'];
    }catch(e){
      Future.error(e.toString());
      return [];
    }
  }
  
  Future<List<dynamic>> getAvailableTours()async{
  try{
    final response =await dio.get('most-viewed-tours');
    return response.data['data'];
  }catch(e){
    Future.error(e.toString());
    return [];
  }
  }
  Future<List<dynamic>> getResultsOfSearchTours()async{
    try{
      final response =await dio.get('most-viewed-tours');
      return response.data['data'];
    }catch(e){
      Future.error(e.toString());
      return [];
    }
  }
  

}