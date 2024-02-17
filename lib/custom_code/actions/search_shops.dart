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
  List<String> conditions = searchWord.split(' ');

  // 最初の条件に合致するショップを取得
  List<MochmatchDataRecord> filteredShops = [];
  for (String condition in conditions) {
    if (condition == '#初心者') {
      filteredShops.addAll(allShops.where(
          (shop) => calculateShoshinsha(shop.friendlinessOfStaffs) == '#初心者'));
    }
    if (condition == '#集中') {
      filteredShops.addAll(allShops.where((shop) =>
          calculateShuchu(shop.noisiness, shop.softnessOfChair) == '#集中'));
    }
    if (condition == '#ダラダラ') {
      filteredShops.addAll(allShops
          .where((shop) => calculateDaradara(shop.softnessOfChair) == '#ダラダラ'));
    }
    if (condition == '#まったり') {
      filteredShops.addAll(allShops.where((shop) =>
          calculateMattari(shop.noisiness, shop.bgm, shop.brightness) ==
          '#まったり'));
    }
    if (condition == '#ワイワイ') {
      filteredShops.addAll(allShops.where((shop) =>
          calculateWaiwai(
              shop.friendlinessOfStaffs, shop.noisiness, shop.bgm) ==
          '#ワイワイ'));
    }
  }

  // 各条件を満たすショップのみを抽出
  filteredShops = filteredShops.where((shop) {
    for (String condition in conditions) {
      if (condition == '#初心者') {
        if (calculateShoshinsha(shop.friendlinessOfStaffs) != '#初心者') {
          return false;
        }
      }
      if (condition == '#集中') {
        if (calculateShuchu(shop.noisiness, shop.softnessOfChair) != '#集中') {
          return false;
        }
      }
      if (condition == '#ダラダラ') {
        if (calculateDaradara(shop.softnessOfChair) != '#ダラダラ') {
          return false;
        }
      }
      if (condition == '#まったり') {
        if (calculateMattari(shop.noisiness, shop.bgm, shop.brightness) !=
            '#まったり') {
          return false;
        }
      }
      if (condition == '#ワイワイ') {
        if (calculateWaiwai(
                shop.friendlinessOfStaffs, shop.noisiness, shop.bgm) !=
            '#ワイワイ') {
          return false;
        }
      }
    }
    return true;
  }).toList();

  return filteredShops;
}
