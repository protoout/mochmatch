// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Add your function code here!

Future<String?> removeDaradaraSearch(
    BuildContext context, String? input) async {
  if (input == null) {
    return null; // もしくは適切な処理を行う
  }

  // 入力文字列に #ダラダラ が含まれているかを確認
  if (input.contains("#ダラダラ")) {
    // #ダラダラ が含まれている場合、それを除いた文字列を返す
    List<String> words = input.split(RegExp(r'[ 　]+'));
    List<String> filteredWords =
        words.where((word) => word != "#ダラダラ").toList();
    return filteredWords.join(" ");
  } else {
    // #ダラダラ が含まれていない場合、入力文字列をそのまま返す
    return input;
  }
}
