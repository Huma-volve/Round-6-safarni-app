import 'package:safarni/features/profile/domain/entities/profile_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserProfile(String id);
}