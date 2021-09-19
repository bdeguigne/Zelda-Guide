import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zelda_guide/application/auth/home_page_controller.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/injection.dart';
import 'package:zelda_guide/presentation/home_page/home_page_bind.dart';
import 'package:zelda_guide/presentation/home_page/home_page_view.dart';
import 'package:zelda_guide/presentation/register_page/register_page_bind.dart';
import 'package:zelda_guide/presentation/register_page/register_page_view.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  runApp(const MyApp());
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
          title: 'Flutter Demo',
          initialRoute: '/',
          getPages: [
            GetPage(
              name: Routes.home,
              page: () => const HomePageView(),
              binding: HomePageBind(),
            ),
            GetPage(
              name: Routes.register,
              page: () => const RegisterPageView(),
              binding: RegisterPageBind(),
            ),
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
