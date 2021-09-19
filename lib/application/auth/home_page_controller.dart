import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';

@injectable
class HomePageController extends GetxController {
  final IAuthFacade _authFacade;

  HomePageController(this._authFacade);

  @override
  void onInit() async {
    print("WOW");
    await _authFacade.getSignedInUser();
    super.onInit();
  }
}
