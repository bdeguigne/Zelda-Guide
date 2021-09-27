import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/hyrule_compendium/monsters_controller.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';
import 'package:zelda_guide/presentation/core/widgets/hyrule_item.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_tab_bar.dart';

class MonstersView extends GetView<MonstersController> {
  const MonstersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Obx(
        () => controller.monsters.isNotEmpty
            ? Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SheikaTabBar(
                      tabs: [
                        SheikaTab(
                          name: "Creatures",
                          assetName: "assets/icons/horse.svg",
                          width: 35,
                          semanticLabel: 'Creatures logo',
                        ),
                        SheikaTab(
                          name: "Monsters",
                          assetName: "assets/icons/skull.svg",
                          width: 35,
                          semanticLabel: 'Monster logo',
                        ),
                        SheikaTab(
                          name: "Materials",
                          assetName: "assets/icons/apple.svg",
                          width: 25,
                          semanticLabel: 'Material logo',
                        ),
                        SheikaTab(
                          name: "Equipments",
                          assetName: "assets/icons/sword.svg",
                          width: 25,
                          semanticLabel: 'Equipment logo',
                        ),
                        SheikaTab(
                          name: "Treasures",
                          assetName: "assets/icons/chest.svg",
                          width: 35,
                          semanticLabel: 'Treasure logo',
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: GridView.count(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 32,
                  //       vertical: 16,
                  //     ),
                  //     crossAxisCount: 3,
                  //     children: controller.monsters
                  //         .map(
                  //           (monster) => HyruleItem(
                  //             imageUrl: monster.image,
                  //           ),
                  //         )
                  //         .toList(),
                  //   ),
                  // ),
                  SheikaBox(
                    child: Image(
                      width: 150,
                      image: NetworkImage(
                        controller.monsters.elementAt(0).image,
                      ),
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
