import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:latlong2/latlong.dart';
import 'package:zelda_guide/application/auth/home_page_controller.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/presentation/core/app_theme.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_ui/glow.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_ui/sheika_hover.dart';

class HyruleMapView extends GetView<HomePageController> {
  const HyruleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FlutterMap(
                    options: MapOptions(
                      center: LatLng(controller.latitude.value,
                          controller.longitude.value),
                      zoom: 18.0,
                      minZoom: 16.0,
                      maxZoom: 18.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(controller.currentLatitude.value,
                              controller.currentLongitude.value),
                          builder: (ctx) => InkWell(
                            child:
                                Image.asset("assets/icons/playercurrent.png"),
                          ),
                        ),
                        ...controller.coords.map(
                          (element) {
                            return Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(element.lat, element.long),
                              builder: (ctx) => InkWell(
                                onTap: () {
                                  double currentlat =
                                      controller.currentLatitude.value;
                                  double currentlong =
                                      controller.currentLongitude.value;
                                  double distance =
                                      controller.calculateDistance(
                                          currentlat,
                                          currentlong,
                                          element.lat,
                                          element.long);

                                  if (distance <= 45) {
                                    Get.snackbar(
                                        "Well Done", "You beat this ennemy",
                                        backgroundColor: Colors.green);
                                    controller.coords.remove(element);
                                    if (controller.coords.isEmpty) {
                                      Get.snackbar(
                                        "Impressive !!!",
                                        "You kill all ennemy",
                                        backgroundColor:
                                            const Color(0xFF3F4549),
                                        boxShadows: [
                                          BoxShadow(
                                            color: AppTheme.glow.withAlpha(100),
                                            blurRadius: 12,
                                            spreadRadius: 8,
                                          ),
                                        ],
                                      );
                                      controller.initListCoord();
                                    }
                                  } else {
                                    Get.snackbar("Too far away",
                                        "${(distance - 45).round()} meters away",
                                        backgroundColor: Colors.red);
                                  }
                                },
                                child:
                                    Image.asset("assets/icons/cranemarker.png"),
                              ),
                            );
                          },
                        ).toList(),
                      ])
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Card(
                elevation: 30,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapIcon(
                      assetPath: "assets/icons/book.svg",
                      onTap: () => Get.toNamed(Routes.compendium),
                    ),
                    const SizedBox(height: 8),
                    MapIcon(
                      assetPath: "assets/icons/user.svg",
                      onTap: () => Get.toNamed(Routes.profil),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapIcon extends StatelessWidget {
  const MapIcon({
    Key? key,
    required this.assetPath,
    required this.onTap,
  }) : super(key: key);

  final String assetPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SheikaHover(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Glow(
                  child: SvgPicture.asset(
                    assetPath,
                    color: AppTheme.blueSheika,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
