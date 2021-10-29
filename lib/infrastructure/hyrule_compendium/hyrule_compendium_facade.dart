import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/domain/hyrule_compendium/i_hyrule_compendium_facade.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/creatures.dart';
import 'package:zelda_guide/domain/hyrule_compendium/models/monster.dart';

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
    } on DioError catch (e) {
      return List.empty();
    }
  }

  @override
  Future<List<Creature>> getCreature() async {
    try {
      Response response = await Dio().get(
        "https://botw-compendium.herokuapp.com/api/v2/category/creatures",
      );
      List<Creature> creatures = (response.data["data"]["food"] as List)
          .map((element) => Creature.fromMap(element))
          .toList();

      return creatures;
    } on DioError catch (e) {
      return List.empty();
    }
  }
}
