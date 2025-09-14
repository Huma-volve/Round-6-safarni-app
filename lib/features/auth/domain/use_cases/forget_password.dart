import 'package:dartz/dartz.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class ForgetPasswordUseCse extends UseCase<Either, String> {
  @override
  Future<Either> call({String? param}) async {
    return await sl<AuthRepo>().forgetPassword(param!);
  }
}
