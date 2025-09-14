import 'package:dartz/dartz.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class RegisterUseCase extends UseCase<Either, RegisterReqModel> {
  @override
  Future<Either> call({RegisterReqModel? param}) async {
    return await sl<AuthRepo>().register(param!);
  }
}
