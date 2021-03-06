import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/image_picker_controller.dart';
import 'package:zelda_guide/application/auth/user_controller.dart';
import 'package:zelda_guide/presentation/core/app_theme.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';

class ProfilPage extends GetView<ImagePickerController> {
  ProfilPage({Key? key}) : super(key: key);

  final UserController _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.pickImage(),
        tooltip: "Pick image",
        child: const Icon(Icons.add_a_photo),
      ),
      body: _userController.user != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 150,
                    child: Obx(
                      () => controller.pickedImage.value != null
                          ? ClipOval(child: controller.pickedImage.value!)
                          : Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: SvgPicture.asset(
                                "assets/icons/user.svg",
                                color: AppTheme.glow,
                                width: 400,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _userController.user!.username.getOrCrash(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text("No user"),
            ),
    );
  }
}
