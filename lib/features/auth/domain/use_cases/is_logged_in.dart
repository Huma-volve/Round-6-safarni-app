import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/useCases/usecase.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) async {
    return await sl<AuthRepo>().isLoggedIn();
  }
}
