import 'dart:convert';

import 'package:dio/dio.dart';

class RegisterReqModel {
  String name;
  String email;
  String password;
  RegisterReqModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  FormData toFormData() {
    return FormData.fromMap(toMap());
  }
}
