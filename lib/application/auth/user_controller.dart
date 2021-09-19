import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zelda_guide/domain/auth/user.dart';

class UserController extends GetxController {
  User? user;

  UserController();

  @override
  void onInit() {
    print("ON INIT USER CONTROLLER !!");
    super.onInit();
  }
}
