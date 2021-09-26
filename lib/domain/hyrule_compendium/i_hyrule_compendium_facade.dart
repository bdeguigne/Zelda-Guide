import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';

abstract class IHyruleCompendiumFacade {
  Future<List<Monster>> getMonsters();
}
