import '../entities/profile_entity.dart';
import '../repositories/user_repository.dart';

class GetUserProfile {
  final UserRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call(String id) {
    return repository.getUserProfile(id);
  }
}
