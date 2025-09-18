import 'package:dio/dio.dart';

class SetNewPasswordReqPasswordModel {
  String password;
  String confirmPassword;
  SetNewPasswordReqPasswordModel({
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }

  FormData toFormData() {
    return FormData.fromMap(toMap());
  }
}
