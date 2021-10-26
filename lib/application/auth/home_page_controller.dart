import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/application/auth/user_controller.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';
import 'package:zelda_guide/domain/auth/models/user.dart';
import 'package:location/location.dart';
import 'dart:math';

@injectable
class HomePageController extends GetxController {
  final IAuthFacade _authFacade;
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble currentLongitude = 0.0.obs;
  RxDouble currentLatitude = 0.0.obs;

  HomePageController(this._authFacade);

  RxBool isSubmitting = false.obs;
  RxBool showErrorMessage = false.obs;

  Rx<CameraDescription?>? camera;

  Future<Option<User>> verifyAuthentication() async {
    isSubmitting.value = true;
    return _authFacade.getSignedInUser();
  }

  initCamera() async {
    final cameras = await availableCameras();
    camera!.value = cameras.first;
  }

  @override
  void onInit() async {
    initCamera();
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;


    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    await location.enableBackgroundMode(enable: true);

   

    _locationData = await location.getLocation();
    print(_locationData);
    if (_locationData.latitude != null && _locationData.longitude != null) {
      latitude.value = _locationData.latitude!;
      longitude.value = _locationData.longitude!;
    }

     location.onLocationChanged.listen((LocationData currentLocation) {
  // Use current location
  currentLongitude.value = currentLocation.longitude!;
  currentLatitude.value = currentLocation.latitude!; 
});

    super.onInit();
  }

  

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  void storeUser(User user) {
    final UserController userController = Get.find<UserController>();
    userController.user = user;
  }
}
