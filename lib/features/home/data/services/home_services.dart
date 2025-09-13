import 'package:dio/dio.dart';
import 'package:safarni/core/constants/app_strings.dart';

class HomeServices{
  final Dio dio=Dio(BaseOptions(baseUrl: AppStrings.homeBaseUrl,receiveTimeout: Duration(seconds: 10),sendTimeout: Duration(seconds: 10)));

 Future<List<dynamic>> getAllRecommendedTours()async{
    try{
      final response = await dio.get('recommendedtour');
      return response.data['data'];
    }catch(e){
      Future.error(e.toString());
      return [];
    }
  }

}