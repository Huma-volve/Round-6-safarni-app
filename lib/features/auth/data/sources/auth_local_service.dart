import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isLoggedIn() async {
    String? user = await sl<CacheHelper>().getData('user');
    if (user != null) {
      return true;
    } else
      return false;
  }
}
