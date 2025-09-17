import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_urls.dart';
import 'package:safarni/core/network/dio_client.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/auth/data/models/login_req_model.dart';
import 'package:safarni/features/auth/data/models/otp_req_model.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/data/models/set_new_password_req_password.dart';

abstract class AuthApiService {
  Future<Either> register(RegisterReqModel registerReq);
  Future<Either> login(LoginReqModel loginReq);
  Future<Either> forgetPassword(String email);
  Future<Either> otp(OtpReqModel otpReq);
  Future<Either> setNewPassword(
    SetNewPasswordReqPasswordModel setNewPassword,
    String token,
  );
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> register(RegisterReqModel registerReq) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrls.register,
        data: registerReq.toFormData(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> login(LoginReqModel loginReq) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrls.login,
        data: loginReq.toFormData(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> forgetPassword(String email) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrls.forgotPassword,
        data: FormData.fromMap({'email': email}),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> otp(OtpReqModel otpReq) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrls.otp,
        data: otpReq.toFormData(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> setNewPassword(
    SetNewPasswordReqPasswordModel setNewPassword,
    String token,
  ) async {
    try {
      final response = await sl<DioClient>().post(
        ApiUrls.resetPassword,
        data: setNewPassword.toFormData(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
