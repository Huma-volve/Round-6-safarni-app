import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/auth/data/models/login_req_model.dart';
import 'package:safarni/features/auth/data/models/otp_req_model.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/data/models/set_new_password_req_password.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either> register(RegisterReqModel registerReq) async {
    Either result = await sl<AuthApiService>().register(registerReq);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        sl<CacheHelper>().saveData('user', jsonEncode(response.data['data']));
        return Right(response);
      },
    );
  }

  @override
  Future<Either> login(LoginReqModel loginReq) async {
    var result = await sl<AuthApiService>().login(loginReq);

    if (result.isLeft()) {
      return result;
    } else {
      Response response = (result as Right).value;

      sl<CacheHelper>().saveData('user', jsonEncode(response.data['data']));

      return Right(response);
    }
  }

  @override
  Future<Either> forgetPassword(String email) async {
    var result = await sl<AuthApiService>().forgetPassword(email);
    if (result.isLeft()) {
      return result;
    } else {
      var response = (result as Right).value;

      return Right(response);
    }
  }

  @override
  Future<Either> otp(OtpReqModel otpReq) async {
    var result = await sl<AuthApiService>().otp(otpReq);
    if (result.isLeft()) {
      return result;
    } else {
      var response = (result as Right).value;

      return Right(response);
    }
  }

  @override
  Future<Either> setNewPassword(
    SetNewPasswordReqPasswordModel setNewPassword,
  ) async {
    var result = await sl<AuthApiService>().setNewPassword(setNewPassword);
    if (result.isLeft()) {
      return result;
    } else {
      var response = (result as Right).value;

      return Right(response);
    }
  }
}
