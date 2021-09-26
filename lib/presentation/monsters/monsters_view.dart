import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/hyrule_compendium/monsters_controller.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';
import 'package:zelda_guide/presentation/core/widgets/hyrule_item.dart';

class MonstersView extends GetView<MonstersController> {
  const MonstersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 42, right: 42),
        child: Obx(
          () => controller.monsters.isNotEmpty
              ? GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: controller.monsters
                      .map(
                        (monster) => HyruleItem(
                          imageUrl: monster.image,
                        ),
                      )
                      .toList(),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
