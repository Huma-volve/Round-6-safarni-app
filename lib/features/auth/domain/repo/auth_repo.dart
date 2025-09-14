import 'package:dartz/dartz.dart';
import 'package:safarni/features/auth/data/models/login_req_model.dart';
import 'package:safarni/features/auth/data/models/otp_req_model.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/data/models/set_new_password_req_password.dart';

abstract class AuthRepo {
  Future<Either> register(RegisterReqModel registerReq);
  Future<Either> login(LoginReqModel loginReq);
  Future<Either> forgetPassword(String email);
  Future<Either> otp(OtpReqModel otpReq);
  Future<Either> setNewPassword(SetNewPasswordReqPasswordModel setNewPassword);
  // Future<Either> otp(OtpReqModel otpReq);
  // Future<Either> setNewPassword(SetNewPasswordReqPasswordModel setNewPassword);
}
