import 'dart:convert';

import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProfileEntity> getUserProfile(String id) async {
    final model = await remoteDataSource.getUser(id);
    return model.toEntity();
  }

  @override
  Future<void> deleteAccount() async {
    final userJson = await sl<CacheHelper>().getData('user');
    final token = userJson != null ? jsonDecode(userJson)['token'] : null;
    print('Retrieved token: $token');
    if (token != null) {
      await remoteDataSource.deleteAccount(token);
      await sl<CacheHelper>().removeData('user');
    }
  }

  @override
  Future<void> logout() async {
    final userJson = await sl<CacheHelper>().getData('user');
    final token = userJson != null ? jsonDecode(userJson)['token'] : null;

    if (token != null) {
      await remoteDataSource.logout(token);
      await sl<CacheHelper>().removeData('user');
    }
  }
}
