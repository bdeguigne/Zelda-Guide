import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:injectable/injectable.dart';

import 'package:zelda_guide/domain/hyrule_compendium/i_hyrule_compendium_facade.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/creatures.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';

@injectable
class MonstersController extends GetxController {
  final IHyruleCompendiumFacade _hyruleCompendiumFacade;

  MonstersController(
    this._hyruleCompendiumFacade,
  );

  RxList<Monster> monsters = List<Monster>.empty().obs;
  RxList<Creature> creatures = List<Creature>.empty().obs;
  TabController? tabController;

  _getMonster() async {
    monsters.value = await _hyruleCompendiumFacade.getMonsters();
  }

  _getCreatures() async {
    creatures.value = await _hyruleCompendiumFacade.getCreature();
  }

  @override
  void onInit() {
    _getMonster();
    _getCreatures();
    super.onInit();
  }
}
