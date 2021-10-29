import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/image_picker_controller.dart';

class ProfileBind extends Bindings {
  @override
  void dependencies() {
    Get.put<ImagePickerController>(ImagePickerController());
  }
}
