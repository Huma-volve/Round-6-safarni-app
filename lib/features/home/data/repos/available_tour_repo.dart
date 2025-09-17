import 'package:safarni/features/home/data/models/available_tour_model.dart';
import 'package:safarni/features/home/data/services/home_services.dart';

class AvailableTourRepo{
  
  HomeServices homeServices=HomeServices();


  Future<List<AvailableTourModel>> getAvailableTours()async{
  try{
    final List<dynamic> tours=await homeServices.getAvailableTours();
   return tours.map((tour)=> AvailableTourModel.fromJson(tour)).toList(); // tour is map
  }catch(e){
    Future.error(e.toString());
    return [];
  }
  }
  
}