import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';

abstract class TourRepository {
  Future<List<Tour>> fetchTours();
}
