import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/constants/cache_keys.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/auth/data/models/login_req_model.dart';
import 'package:safarni/features/auth/data/models/otp_req_model.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/data/models/set_new_password_req_password.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/data/sources/auth_local_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either> register(RegisterReqModel registerReq) async {
    final Either result = await sl<AuthApiService>().register(registerReq);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final Response response = data;
        sl<CacheHelper>().saveData('user', jsonEncode(response.data['data']));

        sl<CacheHelper>().saveData(
          CacheKeys.user,
          jsonEncode(response.data['data']),
        );
        return Right(response);
      },
    );
  }

  @override
  Future<Either> login(LoginReqModel loginReq) async {
    final result = await sl<AuthApiService>().login(loginReq);

    if (result.isLeft()) {
      return result;
    } else {
      final Response response = (result as Right).value;

      sl<CacheHelper>().saveData(
        CacheKeys.user,
        jsonEncode(response.data['data']),
      );

      return Right(response);
    }
  }

  @override
  Future<Either> forgetPassword(String email) async {
    final result = await sl<AuthApiService>().forgetPassword(email);
    if (result.isLeft()) {
      return result;
    } else {
      final response = (result as Right).value;

      return Right(response);
    }
  }

  @override
  Future<Either> otp(OtpReqModel otpReq) async {
    final result = await sl<AuthApiService>().otp(otpReq);
    if (result.isLeft()) {
      return result;
    } else {
      final response = (result as Right).value;

      sl<CacheHelper>().saveData(
        CacheKeys.resetPasswordToken,
        response.data['data']['token'],
      );

      return Right(response);
    }
  }

  @override
  Future<Either> setNewPassword(
    SetNewPasswordReqPasswordModel setNewPassword,
  ) async {
    final String? token = await sl<CacheHelper>().getData(
      CacheKeys.resetPasswordToken,
    );
    final result = await sl<AuthApiService>().setNewPassword(
      setNewPassword,
      token!,
    );
    if (result.isLeft()) {
      return result;
    } else {
      final response = (result as Right).value;

      return Right(response);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }
}
