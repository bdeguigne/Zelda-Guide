import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:injectable/injectable.dart';

import 'package:zelda_guide/domain/hyrule_compendium/i_hyrule_compendium_facade.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';

@injectable
class MonstersController extends GetxController {
  final IHyruleCompendiumFacade _hyruleCompendiumFacade;

  MonstersController(
    this._hyruleCompendiumFacade,
  );

  RxList<Monster> monsters = List<Monster>.empty().obs;

  _getMonster() async {
    monsters.value = await _hyruleCompendiumFacade.getMonsters();
  }

  @override
  void onInit() {
    _getMonster();
    super.onInit();
  }
}
