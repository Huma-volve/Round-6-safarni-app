import 'package:dio/dio.dart';
import 'package:safarni/core/constants/app_strings.dart';

class FavouriteServices{

  final Dio dio=Dio(BaseOptions(baseUrl:AppStrings.homeBaseUrl,
  headers: {'Authorization':'Bearer 38|fSdtjlVDoNAG630qkSCli05PL06AG64UMkQ7uVmHde778a55'}
  ));


  Future< List<dynamic>> getAllFavourites()async{
    try {
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
      await dio.post('favorites/add/$tourId');
    } on DioException catch (e) {
      Future.error(e.toString());
    }
  }

  Future<void> removeFromFavourites(int tourId) async {
    try {
      final response = await dio.delete('favorites/remove/$tourId');
      print('Remove response: ${response.data}');
    } on DioException catch (e) {
      Future.error(e.toString());
    }
  }

}