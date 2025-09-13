import 'package:safarni/features/home/data/models/recommended_tour_model.dart';
import 'package:safarni/features/home/data/services/home_services.dart';

class RecommendToursRepo {

  HomeServices homeServices = HomeServices();

  Future<List<RecommendedTourModel>> getAllRecommendedTours() async {
    try {
      final List<dynamic> tours = await homeServices.getAllRecommendedTours();
      return tours.map((tour) => RecommendedTourModel.fromJson(tour)).toList();
    } catch (e) {
      Future.error(e.toString());
      return [];
    }
  }
}