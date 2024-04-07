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
    if (a.location != null && b.location != null) {
      return calculateDistanceAsDouble(a.location!, currentLocation)
          .compareTo(calculateDistanceAsDouble(b.location!, currentLocation));
    } else {
      return 0;
    }
  });

  return sortedShops;
}
