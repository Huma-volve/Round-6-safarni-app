import 'package:dio/dio.dart';

class LoginReqModel {
  String email;
  String password;
  LoginReqModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }

  FormData toFormData() {
    return FormData.fromMap(toMap());
  }
}
