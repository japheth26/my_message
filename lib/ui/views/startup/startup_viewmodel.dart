import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/repositories/auth_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:my_message/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();

  Future runStartupLogic() async {
    final result = await _authRepository.getLoggedInUser();

    if (result is Ok<User?> && result.value == null) {
      _navigationService.replaceWithLoginView();
      return;
    }

    if (result is Ok<User?> && result.value != null) {
      _navigationService.replaceWithHomeView();
      return;
    }

    _navigationService.replaceWithLoginView();
  }
}
