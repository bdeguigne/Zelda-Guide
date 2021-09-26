import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/hyrule_compendium/monsters_controller.dart';
import 'package:zelda_guide/injection.dart';

class MonstersBind extends Bindings {
  @override
  void dependencies() {
    Get.put<MonstersController>(getIt<MonstersController>());
  }
}
