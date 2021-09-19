import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/register_controller.dart';
import 'package:zelda_guide/injection.dart';

class RegisterPageBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => getIt<RegisterController>());
  }
}
