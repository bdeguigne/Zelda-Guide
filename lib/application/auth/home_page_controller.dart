import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/application/auth/user_controller.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';
import 'package:zelda_guide/domain/auth/user.dart';

@injectable
class HomePageController extends GetxController {
  final IAuthFacade _authFacade;

  HomePageController(this._authFacade);

  RxBool isSubmitting = false.obs;
  RxBool showErrorMessage = false.obs;

  Future<Option<User>> verifyAuthentication() async {
    isSubmitting.value = true;
    return _authFacade.getSignedInUser();
  }

  void storeUser(User user) {
    final UserController userController = Get.find<UserController>();
    userController.user = user;
  }
}
