import 'package:safarni/features/internal_tour/data/models/internal_model.dart';
import 'package:safarni/features/internal_tour/data/remote_data/api_service.dart';
import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';
import 'package:safarni/features/internal_tour/domain/repo/tour_repo.dart';

class RepoTourImpl implements TourRepository {
  final TourRemoteDataSource tourRemoteDataSource;

  RepoTourImpl(this.tourRemoteDataSource);

  @override
  Future<List<Tour>> fetchTours() async {
    final tourModels = await tourRemoteDataSource.fetchTours();
    return tourModels.map((model) => toEntity(model)).toList();
  }
}
