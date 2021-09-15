import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/register_controller.dart';

class RegisterPageBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
