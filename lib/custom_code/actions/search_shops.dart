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
) async {
  if (searchWord.contains('#初心者')) {
    return allShops
        .where((MochmatchDataRecord shop) =>
            calculateShoshinsha(shop.friendlinessOfStaffs) == searchWord)
        .toList();
  } else if (searchWord.contains('#集中')) {
    return allShops
        .where((MochmatchDataRecord shop) =>
            calculateShuchu(shop.noisiness, shop.softnessOfChair) == searchWord)
        .toList();
  } else if (searchWord.contains('#ダラダラ')) {
    return allShops
        .where((MochmatchDataRecord shop) =>
            calculateDaradara(shop.softnessOfChair) == searchWord)
        .toList();
  } else if (searchWord.contains('#まったり')) {
    return allShops
        .where((MochmatchDataRecord shop) =>
            calculateMattari(shop.noisiness, shop.bgm, shop.brightness) ==
            searchWord)
        .toList();
  } else if (searchWord.contains('#ワイワイ')) {
    return allShops
        .where((MochmatchDataRecord shop) =>
            calculateWaiwai(
                shop.friendlinessOfStaffs, shop.noisiness, shop.bgm) ==
            searchWord)
        .toList();
  } else {
    return allShops
        .where((MochmatchDataRecord shop) => shop.name.contains(searchWord))
        .toList();
  }
}
