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
            MarkerLayerOptions(markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(controller.currentLatitude.value,
                    controller.currentLongitude.value),
                builder: (ctx) => InkWell(
                  child: Image.asset("assets/icons/playercurrent.png"),
                ),
              ),
              ...controller.coords.map((element) 
                 {
                  return Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(element.lat, element.long),
                    builder: (ctx) => InkWell(
                      onTap: () {
                        final currentlat = controller.currentLatitude.value;
                        final currentlong = controller.currentLongitude.value;
                        final distance = controller.calculateDistance(currentlat, currentlong, element.lat, element.long);
                          
                          if (distance <= 45) {
                            print("moins de 300M");
                          }
                          else{
                            Get.snackbar("Too far away", "${(distance-45).round()} meters away");
                          }
                          print("distance ==> $distance");
                          print("poistion marker ${element.lat} ${element.long}" );
                          print("postion nous : $currentlat    ,    $currentlong");
                        
                      },
                      child: Container(
                          child: Image.asset("assets/icons/cranemarker.png")),
                    ),
                  );
                },
              ).toList(),
            ])
          ],
        ),
      ),
    );
  }
}
