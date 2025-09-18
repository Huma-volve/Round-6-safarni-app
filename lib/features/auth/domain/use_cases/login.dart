import 'package:dartz/dartz.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/features/auth/data/models/login_req_model.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase extends UseCase<Either, LoginReqModel> {
  @override
  Future<Either> call({LoginReqModel? param}) async {
    return await sl<AuthRepo>().login(param!);
  }
}
