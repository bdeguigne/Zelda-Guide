import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';

class HyruleMapView extends StatelessWidget {
  const HyruleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 4.0,
        ),
        layers: [
          TileLayerOptions(
            tms: true,
            tileProvider: const AssetTileProvider(),
            urlTemplate: "assets/tiles/{z}/{x}/{y}.png",
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(51.5, -0.09),
                builder: (ctx) => const FlutterLogo(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
