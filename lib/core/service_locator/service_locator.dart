import 'package:get_it/get_it.dart';
import 'package:safarni/core/network/dio_client.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/auth/data/repo/auth_repo_imp.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';
import 'package:safarni/features/auth/domain/use_cases/forget_password.dart';
import 'package:safarni/features/auth/domain/use_cases/login.dart';
import 'package:safarni/features/auth/domain/use_cases/register.dart';

var sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthRepo>(AuthRepoImp());
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<ForgetPasswordUseCse>(ForgetPasswordUseCse());
  sl.registerSingleton<CacheHelper>(CacheHelper());
}
