import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/injection.dart';
import 'package:zelda_guide/application/auth/home_page_controller.dart';


class MapBind extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(getIt<HomePageController>());
  }
}
