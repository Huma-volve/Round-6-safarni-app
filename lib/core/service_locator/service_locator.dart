import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:safarni/core/network/dio_client.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/auth/data/repo/auth_repo_imp.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/data/sources/auth_local_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';
import 'package:safarni/features/auth/domain/use_cases/forget_password.dart';
import 'package:safarni/features/auth/domain/use_cases/login.dart';
import 'package:safarni/features/auth/domain/use_cases/otp.dart';
import 'package:safarni/features/auth/domain/use_cases/register.dart';

import 'package:safarni/features/auth/domain/use_cases/set_new_password.dart';

import 'package:safarni/features/profile/data/datasources/user_remote_data_source.dart';
import 'package:safarni/features/profile/data/repositories/user_repositry_impl.dart';
import 'package:safarni/features/profile/domain/repositories/user_repository.dart';
import 'package:safarni/features/profile/domain/usecases/delete_account.dart';

var sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthRepo>(AuthRepoImp());
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<ForgetPasswordUseCse>(ForgetPasswordUseCse());
  sl.registerSingleton<CacheHelper>(CacheHelper());
  sl.registerSingleton<OtpUseCase>(OtpUseCase());
  sl.registerSingleton<SetNewPasswordUseCase>(SetNewPasswordUseCase());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<UserRemoteDataSource>()),
  );
  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(sl<UserRepository>()),
  );
}
