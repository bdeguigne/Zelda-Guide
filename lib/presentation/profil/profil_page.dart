import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/image_picker_controller.dart';
import 'package:zelda_guide/presentation/core/app_theme.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';

class ProfilPage extends GetView<ImagePickerController> {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.pickImage(),
        tooltip: "Pick image",
        child: const Icon(Icons.add_a_photo),
      ),
      body: Center(
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
            const Text(
              "Pierre Nicolas",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
