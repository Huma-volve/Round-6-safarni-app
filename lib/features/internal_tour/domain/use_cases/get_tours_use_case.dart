import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';
import 'package:safarni/features/internal_tour/domain/repo/tour_repo.dart';

class GetTourUseCase {
  final TourRepository repository;

  GetTourUseCase(this.repository);

  Future<List<Tour>> featchTour({String? searchQuery}) async {
    final tours = await repository.fetchTours();
    if (searchQuery == null || searchQuery.isEmpty) return tours;
    return tours
        .where(
          (tour) =>
              tour.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              tour.description.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        )
        .toList();
  }
}
