import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zelda_guide/application/hyrule_compendium/monsters_controller.dart';
import 'package:zelda_guide/presentation/core/widgets/default_scaffold.dart';
import 'package:zelda_guide/presentation/core/widgets/hyrule_item.dart';
import 'package:zelda_guide/presentation/core/widgets/responsive_grid_view.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_ui/sheika_tab_bar.dart';

class MonstersView extends GetView<MonstersController> {
  const MonstersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sheikaTabBarKey = GlobalKey<SheikaTabBarState>();
    double _statusBarHeight = MediaQuery.of(context).padding.top;

    return DefaultTabController(
      length: 2,
      child: DefaultScaffold(
        body: Obx(
          () => controller.monsters.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(height: _statusBarHeight),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SheikaTabBar(
                        key: _sheikaTabBarKey,
                        tabs: const [
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
                          // SheikaTab(
                          //   name: "Materials",
                          //   assetName: "assets/icons/apple.svg",
                          //   width: 25,
                          //   semanticLabel: 'Material logo',
                          // ),
                          // SheikaTab(
                          //   name: "Equipments",
                          //   assetName: "assets/icons/sword.svg",
                          //   width: 25,
                          //   semanticLabel: 'Equipment logo',
                          // ),
                          // SheikaTab(
                          //   name: "Treasures",
                          //   assetName: "assets/icons/chest.svg",
                          //   width: 35,
                          //   semanticLabel: 'Treasure logo',
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Row(
                            children: [
                              Text("LEFT"),
                              Expanded(
                                child: ResponsiveGridView(
                                  children: controller.monsters
                                      .map(
                                        (monster) => HyruleItem(
                                          imageUrl: monster.image,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  DefaultTabController.of(context)!.index;
                                },
                                child: const Text("RIGHT"),
                              ),
                            ],
                          ),
                          const Center(
                            child: Text("Helo"),
                          )
                        ],
                      ),
                    ),
                    // if (_sheikaTabBarKey.currentState != null)
                    //   TabBarView(
                    //     controller: _sheikaTabBarKey.currentState!.tabController,
                    //     children: [

                    //       const Center(
                    //         child: Text("Hello"),
                    //       ),
                    //       const Center(
                    //         child: Text("TEST"),
                    //       ),
                    //     ],
                    //   ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
