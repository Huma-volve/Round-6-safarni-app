import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

   @override
  Future<UserEntity> getUserProfile(String id) async {
    final model = await remoteDataSource.getUser(id);
    return model.toEntity();
  }
}
