import 'package:dio/dio.dart';
import 'package:safarni/core/constants/app_strings.dart';

class FavouriteServices{

  final Dio dio=Dio(BaseOptions(baseUrl:AppStrings.homeBaseUrl, ));

  Future< List<dynamic>> getAllFavourites()async{
     try {
       final response=await dio.get('favorites');
       return response.data['data'];
     }  catch (e) {
       Future.error(e.toString());
       return[];
     }
   }


}