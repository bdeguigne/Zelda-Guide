import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/domain/hyrule_compendium/i_hyrule_compendium_facade.dart';
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
      if (e.response != null) {
        print("GET MONSTERS ERROR");
        print(e.response?.data);
        print(e.response?.headers);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.message);
      }
      return List.empty();
    }
  }
}
