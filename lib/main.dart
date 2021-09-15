import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/injection.dart';
import 'package:zelda_guide/presentation/home_page/home_page_view.dart';
import 'package:zelda_guide/presentation/register_page/register_page_bindings.dart';
import 'package:zelda_guide/presentation/register_page/register_page_view.dart';

void main() {
  configureDependencies();
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
              name: '/',
              page: () => const HomePageView(),
            ),
            GetPage(
              name: '/register',
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
