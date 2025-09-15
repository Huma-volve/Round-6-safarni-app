import 'package:dartz/dartz.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/features/auth/data/models/otp_req_model.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase extends UseCase<Either, OtpReqModel> {
  @override
  Future<Either> call({OtpReqModel? param}) async {
    return await sl<AuthRepo>().otp(param!);
  }
}
