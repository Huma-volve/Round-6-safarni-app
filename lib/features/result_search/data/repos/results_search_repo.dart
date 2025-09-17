import 'package:safarni/features/result_search/data/models/result_item_model.dart';

import '../../../home/data/services/home_services.dart';

class ResultsSearchRepo{

  HomeServices homeServices=HomeServices();


  Future<List<ResultItemModel>> getAvailableTours()async{
    try{
      final tours=await homeServices.getResultsOfSearchTours();
      return tours.map((tour)=> ResultItemModel.fromJson(tour)).toList(); // tour is map
    }catch(e){
      Future.error(e.toString());
      return [];
    }
  }

}