// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authsuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

class HidenPassword extends AuthState {
  bool hidenPassword;
  HidenPassword({required this.hidenPassword});
}

class HidenConfirmPassword extends AuthState {
  bool hidenPassword;
  HidenConfirmPassword({required this.hidenPassword});
}

class Rulecorrect extends AuthState {}

class Authorized extends AuthState {}

class UnAuthorized extends AuthState {}
