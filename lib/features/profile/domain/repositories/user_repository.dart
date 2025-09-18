import 'package:safarni/features/profile/domain/entities/profile_entity.dart';

abstract class UserRepository {
  Future<ProfileEntity> getUserProfile(String id);
  Future<void> deleteAccount();
  Future<void> logout();
}

