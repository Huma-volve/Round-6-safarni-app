import 'dart:convert';

import 'package:dio/dio.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
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
