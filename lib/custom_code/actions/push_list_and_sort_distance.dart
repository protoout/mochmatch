// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> pushListAndSortDistance(String distance) async {
  // Store the return value in a variable of type list, then sort them
  List<String> distanceList = [];

// Push the distance value to the list
  distanceList.add(distance);

// Sort the list in ascending order
  distanceList.sort((a, b) => a.compareTo(b));

// Return the sorted list
  return distanceList;
}
