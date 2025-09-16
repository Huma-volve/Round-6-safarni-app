import 'package:dartz/dartz.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/features/auth/data/models/set_new_password_req_password.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class SetNewPasswordUseCase
    extends UseCase<Either, SetNewPasswordReqPasswordModel> {
  @override
  Future<Either> call({SetNewPasswordReqPasswordModel? param}) async {
    return await sl<AuthRepo>().setNewPassword(param!);
  }
}
