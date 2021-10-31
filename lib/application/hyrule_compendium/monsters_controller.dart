import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:injectable/injectable.dart';

import 'package:zelda_guide/domain/hyrule_compendium/i_hyrule_compendium_facade.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/entity.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/equipment.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/treasure.dart';

@injectable
class MonstersController extends GetxController {
  final IHyruleCompendiumFacade _hyruleCompendiumFacade;

  MonstersController(
    this._hyruleCompendiumFacade,
  );

  RxList<Monster> monsters = List<Monster>.empty().obs;
  RxList<Entity> creatures = List<Entity>.empty().obs;
  RxList<Entity> materials = List<Entity>.empty().obs;
  RxList<Equipment> equipments = List<Equipment>.empty().obs;
  RxList<Treasure> treasures = List<Treasure>.empty().obs;
  TabController? tabController;

  _getMonster() async {
    monsters.value = await _hyruleCompendiumFacade.getMonsters();
  }

  _getCreatures() async {
    creatures.value = await _hyruleCompendiumFacade.getCreatures();
  }

  _getMaterials() async {
    materials.value = await _hyruleCompendiumFacade.getMaterials();
  }

  _getEquipments() async {
    equipments.value = await _hyruleCompendiumFacade.getEquipments();
  }

  _getTreasures() async {
    treasures.value = await _hyruleCompendiumFacade.getTreasures();
  }

  @override
  void onInit() {
    _getMonster();
    _getCreatures();
    _getMaterials();
    _getEquipments();
    _getTreasures();
    super.onInit();
  }
}
