import 'package:zelda_guide/domain/hyrule_compendium/models/entity.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/equipment.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/treasure.dart';

abstract class IHyruleCompendiumFacade {
  Future<List<Monster>> getMonsters();
  Future<List<Entity>> getCreatures();
  Future<List<Entity>> getMaterials();
  Future<List<Equipment>> getEquipments();
  Future<List<Treasure>> getTreasures();
}
