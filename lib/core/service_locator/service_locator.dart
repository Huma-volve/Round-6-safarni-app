import 'package:get_it/get_it.dart';
import 'package:safarni/core/network/dio_client.dart';
import 'package:safarni/features/auth/data/repo/auth_repo_imp.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

var sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthRepo>(AuthRepoImp());
}
