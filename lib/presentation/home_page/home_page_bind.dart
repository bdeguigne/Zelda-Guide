import 'package:get/get.dart';
import 'package:zelda_guide/application/auth/home_page_controller.dart';
import 'package:zelda_guide/injection.dart';

class HomePageBind extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(getIt<HomePageController>());
  }
}
