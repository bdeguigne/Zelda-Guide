import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';

class RegisterController extends GetxController {
  Username _username = Username('');
  EmailAddress _emailAddress = EmailAddress('');
  Password _password = Password('');
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

  emailChanged(String value) => _emailAddress = EmailAddress(value);
  emailValidated() => _emailAddress.value.fold(
        (failure) => failure.maybeMap(
          invalidEmail: (_) => "Invalid email",
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

  signedUp() {
    // Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = _emailAddress.isValid();
    // final isPasswordValid = _password.isValid();

    if (isEmailValid) {
      isSubmitting.value = true;
    } else {
      isSubmitting.value = false;
      showErrorMessage.value = true;
    }
  }
}
