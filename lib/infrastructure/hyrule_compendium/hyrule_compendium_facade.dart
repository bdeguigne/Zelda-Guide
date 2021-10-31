import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/domain/hyrule_compendium/i_hyrule_compendium_facade.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/entity.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/equipment.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/treasure.dart';

@LazySingleton(as: IHyruleCompendiumFacade)
class HyruleCompendiumFacade extends IHyruleCompendiumFacade {
  @override
  Future<List<Monster>> getMonsters() async {
    try {
      Response response = await Dio().get(
        "https://botw-compendium.herokuapp.com/api/v2/category/monsters",
      );
      List<Monster> monster = (response.data["data"] as List)
          .map((element) => Monster.fromMap(element))
          .toList();

      return monster;
    } on DioError {
      return List.empty();
    }
  }

  @override
  Future<List<Entity>> getCreatures() async {
    try {
      Response response = await Dio().get(
        "https://botw-compendium.herokuapp.com/api/v2/category/creatures",
      );
      List<Entity> entities = (response.data["data"]["food"] as List)
          .map((element) => Entity.fromMap(element))
          .toList();

      return entities;
    } on DioError {
      return List.empty();
    }
  }

  @override
  Future<List<Entity>> getMaterials() async {
    try {
      Response response = await Dio().get(
        "https://botw-compendium.herokuapp.com/api/v2/category/materials",
      );
      List<Entity> materials = (response.data["data"] as List)
          .map((element) => Entity.fromMap(element))
          .toList();

      return materials;
    } on DioError {
      return List.empty();
    }
  }

  @override
  Future<List<Equipment>> getEquipments() async {
    try {
      Response response = await Dio().get(
        "https://botw-compendium.herokuapp.com/api/v2/category/equipment",
      );
      List<Equipment> equipments =
          (response.data["data"] as List).map((element) {
        return Equipment.fromMap(element);
      }).toList();

      return equipments;
    } on DioError {
      return List.empty();
    }
  }

  @override
  Future<List<Treasure>> getTreasures() async {
    try {
      Response response = await Dio().get(
        "https://botw-compendium.herokuapp.com/api/v2/category/treasure",
      );
      List<Treasure> treasures = (response.data["data"] as List).map((element) {
        return Treasure.fromMap(element);
      }).toList();
      return treasures;
    } on DioError {
      return List.empty();
    }
  }
}
