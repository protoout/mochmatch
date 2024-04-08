// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<MochmatchDataRecord>> searchShops(
  List<MochmatchDataRecord> allShops,
  String searchWord,
  LatLng currentLocation,
) async {
  List<String> conditions = [];
  if (searchWord.trim().isNotEmpty &&
      (searchWord.contains(' ') || searchWord.contains('　'))) {
    conditions.addAll(searchWord.split(RegExp(r'\s+')));
  } else {
    conditions.add(searchWord);
  }

  if (searchWord.trim().isEmpty) {
    List<MochmatchDataRecord> filteredShops = [];
    for (MochmatchDataRecord shop in allShops) {
      if (shop.location != null) {
        // ロケーションがnullでない場合にのみ追加する
        filteredShops.add(shop);
      }
    }

    filteredShops.sort((a, b) {
      if (a.location != null && b.location != null) {
        return calculateDistanceAsDouble(a.location!, currentLocation)
            .compareTo(calculateDistanceAsDouble(b.location!, currentLocation));
      } else {
        return 0;
      }
    });

    return filteredShops;
  }

  List<MochmatchDataRecord> filteredShops = [];
  for (MochmatchDataRecord shop in allShops) {
    if (shop.location != null) {
      // ロケーションがnullでない場合にのみ追加する
      bool addToFilteredShops = true;
      for (String condition in conditions) {
        if (condition == '#初心者' &&
            calculateShoshinsha(shop.friendlinessOfStaffs) != '#初心者') {
          addToFilteredShops = false;
          break;
        }
        if (condition == '#集中' &&
            calculateShuchu(shop.noisiness, shop.softnessOfChair) != '#集中') {
          addToFilteredShops = false;
          break;
        }
        if (condition == '#ダラダラ' &&
            calculateDaradara(shop.softnessOfChair) != '#ダラダラ') {
          addToFilteredShops = false;
          break;
        }
        if (condition == '#まったり' &&
            calculateMattari(shop.noisiness, shop.bgm, shop.brightness) !=
                '#まったり') {
          addToFilteredShops = false;
          break;
        }
        if (condition == '#ワイワイ' &&
            calculateWaiwai(
                    shop.friendlinessOfStaffs, shop.noisiness, shop.bgm) !=
                '#ワイワイ') {
          addToFilteredShops = false;
          break;
        }
        if (!condition.startsWith('#') &&
            !shop.name.toLowerCase().contains(condition.toLowerCase())) {
          addToFilteredShops = false;
          break;
        }
      }
      if (addToFilteredShops) {
        filteredShops.add(shop);
      }
    }
  }

  filteredShops.sort((a, b) {
    if (a.location != null && b.location != null) {
      return calculateDistanceAsDouble(a.location!, currentLocation)
          .compareTo(calculateDistanceAsDouble(b.location!, currentLocation));
    } else {
      return 0;
    }
  });

  return filteredShops;
}
