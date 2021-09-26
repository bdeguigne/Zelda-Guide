import 'package:dartz/dartz.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zelda_guide/domain/auth/auth_failure.dart';
import 'package:get/get.dart';

class SnackbarController extends GetxController {
  final Rx<Option<AuthFailure>> _authFailure = none<AuthFailure>().obs;

  SnackbarController();

  showFailure(AuthFailure failure) {
    _authFailure.value = some(failure);
  }

  @override
  void onInit() {
    // Every time [authFailure] changes, map through failures and show the appropriate message in a snackbar
    ever<Option<AuthFailure>>(
      _authFailure,
      (option) {
        option.fold(
          () => null,
          (failure) => failure.map(
            serverError: (_) => Get.snackbar("Something went wrong", ""),
            usernameAlreadyInUse: (_) =>
                Get.snackbar("Username already In use", ""),
            passwordNotMatch: (_) => Get.snackbar("Password doesn't match", ""),
          ),
        );
        // Reset the failure for re-triggering the event on the same failure next time.
        _authFailure.value = none();
      },
    );
    super.onInit();
  }
}
