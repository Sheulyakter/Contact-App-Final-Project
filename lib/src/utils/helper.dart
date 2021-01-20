import 'package:assignment_flutter_intern/src/model/hero.dart';
import 'package:assignment_flutter_intern/src/utils/constraints.dart';

import '../model/hero.dart';
import 'constraints.dart';


class Helper {
  static List<Hero> getAllHeroes() {
    List<Hero> heroList = heroes.values.toList();
    heroList.sort((a, b) => b.id.compareTo(a.id));
    return heroList;
  }

  static Hero getHeroById(int id) {
    return heroes[id];
  }

  static bool createHero(Hero hero) {
    try {
      hero.id = getAllHeroes().first.id + 1;
      if (heroes.containsKey(hero.id)) {
        return false;
      }
      else {
        heroes[hero.id] = hero;
      }
      return true;
    }
    catch (error) {
      return false;
    }
  }

  static bool updateHero(Hero hero) {
    try {
      if (heroes.containsKey(hero.id)) {
        heroes[hero.id] = hero;
        return true;
      }
      else {
        return false;
      }
    }
    catch (error) {
      return false;
    }
  }

  static List<Hero> searchHero(String key) {
    return getAllHeroes().where((hero) => hero.name.toLowerCase().startsWith(key.toLowerCase()) || hero.number.toString()==key.toString()).toList();
  }

  static List<Hero> getFavorite() {
    return getAllHeroes()
        .where((hero) => hero.isFavorite)
        .toList();
  }

  static bool deleteHero(int id) {
    try {
      if (heroes.containsKey(id)) {
        heroes.remove(id);
        return true;
      }
      else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

}
