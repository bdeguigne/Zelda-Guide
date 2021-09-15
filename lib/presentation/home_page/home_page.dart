import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page_controller.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final MyHomePageController controller = Get.put(MyHomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
