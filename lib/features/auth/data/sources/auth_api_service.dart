import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_urls.dart';
import 'package:safarni/core/network/dio_client.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';

abstract class AuthApiService {
  Future<Either> register(RegisterReqModel registerReq);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> register(RegisterReqModel registerReq) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: registerReq.toFormData(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
