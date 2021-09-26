import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/application/core/snackbar_controller.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';
import 'package:zelda_guide/domain/auth/models/user.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';

@injectable
class RegisterController extends GetxController {
  final IAuthFacade _authFacade;
  final SnackbarController _snackbarController = Get.find<SnackbarController>();

  RegisterController(this._authFacade);

  Username _username = Username('');
  Password _password = Password('');
  Password _confirmPassword = Password('');

  RxBool isSubmitting = false.obs;
  RxBool showErrorMessage = false.obs;

  usernameChanged(String value) => _username = Username(value);
  usernameValidated() => _username.value.fold(
        (failure) => failure.maybeMap(
          invalidUsername: (_) => "Please enter a value",
          orElse: () => null,
        ),
        (success) => null,
      );

  passwordChanged(String value) => _password = Password(value);
  passwordValidated() => _password.value.fold(
        (failure) => failure.maybeMap(
          invalidPassword: (_) => "Invalid password",
          orElse: () => null,
        ),
        (success) => null,
      );

  confirmPasswordChanged(String value) => _confirmPassword = Password(value);
  confirmPasswordValidated() => _confirmPassword.value.fold(
        (failure) => failure.maybeMap(
          invalidPassword: (_) => "Invalid password",
          orElse: () => null,
        ),
        (success) => null,
      );

  signedUp(void Function(User) onSuccess) async {
    final isUsernameValid = _username.isValid();
    final isPasswordValid = _password.isValid();
    final isConfirmPasswordValid = _confirmPassword.isValid();

    if (isUsernameValid && isPasswordValid && isConfirmPasswordValid) {
      isSubmitting.value = true;

      final failureOrSuccess = await _authFacade.register(
        username: _username,
        password: _password,
        confirmPassword: _confirmPassword,
      );

      failureOrSuccess.fold(
        (failure) => _snackbarController.showFailure(failure),
        (user) => onSuccess(user),
      );
    } else {
      showErrorMessage.value = true;
    }
    isSubmitting.value = false;
  }
}
