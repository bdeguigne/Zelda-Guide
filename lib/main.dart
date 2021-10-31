import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zelda_guide/application/auth/profile_bind.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/injection.dart';
import 'package:zelda_guide/presentation/compendium/compendium_view.dart';
import 'package:zelda_guide/presentation/compendium/monsters_bind.dart';
import 'package:zelda_guide/presentation/home_page/home_page_bind.dart';
import 'package:zelda_guide/presentation/home_page/home_page_view.dart';
import 'package:zelda_guide/presentation/hyrule_map/hyrule_map_bind.dart';
import 'package:zelda_guide/presentation/hyrule_map/hyrule_map_view.dart';
import 'package:zelda_guide/presentation/profil/profil_page.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      initialRoute: Routes.home,
      // initialRoute: Routes.monsters,
      getPages: [
        GetPage(
          name: Routes.home,
          page: () => const HomePageView(),
          binding: HomePageBind(),
        ),
        GetPage(
          name: Routes.main,
          page: () => const HyruleMapView(),
          binding: MapBind(),
        ),
        GetPage(
          name: Routes.compendium,
          page: () => const CompendiumView(),
          binding: MonstersBind(),
        ),
        GetPage(
          name: Routes.profil,
          page: () => ProfilPage(),
          binding: ProfileBind(),
        ),
      ],
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
    );
  }
}
