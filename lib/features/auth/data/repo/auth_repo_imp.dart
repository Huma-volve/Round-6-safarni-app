import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('user', response.data['data'].toString());
        return Right(response);
      },
    );
  }
}
