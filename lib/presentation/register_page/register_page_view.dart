import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';
import 'package:zelda_guide/application/auth/register_controller.dart';

class RegisterPageView extends GetView<RegisterController> {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
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
                          icon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                        onChanged: (value) => controller.emailChanged(value),
                        validator: (_) => controller.emailValidated(),
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
                      ElevatedButton(
                        onPressed: () => controller.signedUp(),
                        child: const Text("Sign up"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
