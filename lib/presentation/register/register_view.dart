import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/register_controller.dart';
import 'package:zelda_guide/domain/auth/user.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key, required this.authSuccess}) : super(key: key);

  final Function(User) authSuccess;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "New Account",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 32),
            Obx(
              () => Form(
                autovalidateMode: controller.showErrorMessage.value
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autocorrect: false,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(),
                        labelText: "Username",
                      ),
                      onChanged: (value) => controller.usernameChanged(value),
                      validator: (_) => controller.usernameValidated(),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                      onChanged: (value) => controller.passwordChanged(value),
                      validator: (_) => controller.passwordValidated(),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        labelText: "Confirm Password",
                      ),
                      onChanged: (value) =>
                          controller.confirmPasswordChanged(value),
                      validator: (_) => controller.confirmPasswordValidated(),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => controller.signedUp(authSuccess),
                      child: const Text("Sign up"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
