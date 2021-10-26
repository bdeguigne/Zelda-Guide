import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:latlong2/latlong.dart';
import 'package:zelda_guide/application/auth/home_page_controller.dart';
import 'dart:math';

import 'package:zelda_guide/constants.dart';

class HyruleMapView extends GetView<HomePageController> {
  const HyruleMapView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => FlutterMap(
          options: MapOptions(
            center:
                LatLng(controller.latitude.value, controller.longitude.value),
            zoom: 18.0,
            minZoom: 15.0,
            maxZoom: 18.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: List.generate(
                10,
                (index) => Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(
                      controller.latitude.value +
                          controller.doubleInRange(Random(), 0.01, -0.01),
                      controller.longitude.value +
                          controller.doubleInRange(Random(), 0.01, -0.01)),
                  builder: (ctx) => InkWell(
                    onTap: () => Get.toNamed(Routes.camera),
                    child: Container(
                      child: Image.asset("assets/icons/cranemarker.png")
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

