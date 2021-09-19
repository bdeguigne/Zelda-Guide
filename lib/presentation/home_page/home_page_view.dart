import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zelda_guide/application/auth/home_page_controller.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/domain/auth/user.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/presentation/register/register_view.dart';
import '../core/widgets/button_label.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  showAuthModalBottomSheet(BuildContext context) {
    showMaterialModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black54,
          child: const RegisterView(),
        );
      },
    );
  }

  verifyAuthentication(BuildContext context) async {
    final Option<User> userOption = await controller.verifyAuthentication();
    userOption.fold(
      // if the user was not authenticated
      () => showAuthModalBottomSheet(context),
      // else
      (user) {
        controller.storeUser(user);
        Get.toNamed(Routes.main);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Padding(
        padding: const EdgeInsets.all(42.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                width: 250,
                image: AssetImage(
                  "assets/images/sheika.png",
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "SHEIKA GUIDE",
                style: TextStyle(
                  fontFamily: "Zelda",
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "This is where your adventure begins...",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Divider(
                  height: 60,
                  color: Colors.blue[100],
                ),
              ),
              ButtonLabel(
                onPressed: () => verifyAuthentication(context),
                label: "Explore Hyrule",
                icon: const Icon(
                  Icons.explore_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
