// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DocumentReference>> sortDistancebyShops(
  List<MochmatchDataRecord> allShops,
  LatLng currentLocation,
) async {
  List<DocumentReference> sortedShops = [];

  allShops.sort((a, b) {
    // 修正点: locationがnullでない場合にのみ比較を行う
    if (a.location != null && b.location != null) {
      return calculateDistanceAsDouble(a.location!, currentLocation)
          .compareTo(calculateDistanceAsDouble(b.location!, currentLocation));
    } else if (a.location == null && b.location == null) {
      // 両方のlocationがnullの場合は等しいとして扱う
      return 0;
    } else if (a.location == null) {
      // aのlocationがnullの場合はaを後ろにする
      return 1;
    } else {
      // bのlocationがnullの場合はbを後ろにする
      return -1;
    }
  });

  // 修正点: locationがnullでないもののみsortedShopsに追加する
  for (var shop in allShops) {
    if (shop.location != null) {
      sortedShops.add(shop.reference);
    }
  }

  return sortedShops;
}
