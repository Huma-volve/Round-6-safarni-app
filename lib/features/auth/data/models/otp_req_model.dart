import 'package:dio/dio.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OtpReqModel {
  String email;
  int otp;
  OtpReqModel({required this.email, required this.otp});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'otp': otp};
  }

  FormData toFormData() {
    return FormData.fromMap(toMap());
  }
}
