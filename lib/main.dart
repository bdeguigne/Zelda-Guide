import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/injection.dart';
import 'package:zelda_guide/presentation/home_page/home_page_bind.dart';
import 'package:zelda_guide/presentation/home_page/home_page_view.dart';
import 'package:zelda_guide/presentation/hyrule_map/hyrule_map_bind.dart';
import 'package:zelda_guide/presentation/monsters/monsters_bind.dart';
import 'package:zelda_guide/presentation/monsters/monsters_view.dart';
import 'package:zelda_guide/presentation/hyrule_map/hyrule_map_view.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  runApp(
    DevicePreview(
      // TODO Disable on prod env
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        GetMaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          initialRoute: '/',
          getPages: [
            GetPage(
              name: Routes.home,
              page: () => const HomePageView(),
              binding: HomePageBind(),
            ),
            // GetPage(
            //   name: Routes.main,
            //   page: () => const MonstersView(),
            //   binding: MonstersBind(),
            // )
            GetPage(
              name: Routes.main,
              page: () => const HyruleMapView(),
              binding: MapBind()
            )
          ],
          theme: ThemeData(
            fontFamily: "Montserrat",
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          ),
        ),
      ],
    );
  }
}
