import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:zelda_guide/application/auth/user_controller.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';
import 'package:zelda_guide/domain/auth/models/user.dart';
import 'package:location/location.dart';
import 'dart:math';

class CoordMark {
  final double lat;
  final double long;

  const CoordMark({required this.lat, required this.long});
}

@injectable
class HomePageController extends GetxController {
  final IAuthFacade _authFacade;
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble currentLongitude = 0.0.obs;
  RxDouble currentLatitude = 0.0.obs;
  RxList<CoordMark> coords = <CoordMark>[].obs;
  double defaultZoom = 18.0;
  RxBool loading = true.obs;

  HomePageController(this._authFacade);

  RxBool isSubmitting = false.obs;
  RxBool showErrorMessage = false.obs;

  Rx<CameraDescription?>? camera;

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 1000 * 12742 * asin(sqrt(a));
  }

  initListCoord() {
    for (var i = 0; i < 10; i++) {
      coords.add(CoordMark(
        lat: latitude.value + doubleInRange(Random(), 0.001, -0.001),
        long: longitude.value + doubleInRange(Random(), 0.001, -0.001),
      ));
    }
  }

  Future<Option<User>> verifyAuthentication() async {
    isSubmitting.value = true;
    return _authFacade.getSignedInUser();
  }

  @override
  void onInit() async {
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
    if (!kIsWeb) {
      await location.enableBackgroundMode(enable: true);
    }

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

    initListCoord();

    print("NOUS ${latitude.value}");
    print("NOUS ${longitude.value}");

    loading.toggle();

    super.onInit();
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  void storeUser(User user) {
    final UserController userController = Get.find<UserController>();
    userController.user = user;
  }
}
