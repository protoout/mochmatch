import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _shishaLocation;
  LatLng? get shishaLocation => _shishaLocation;
  set shishaLocation(LatLng? value) {
    _shishaLocation = value;
  }

  List<String> _shishaLocationList = [];
  List<String> get shishaLocationList => _shishaLocationList;
  set shishaLocationList(List<String> value) {
    _shishaLocationList = value;
  }

  void addToShishaLocationList(String value) {
    _shishaLocationList.add(value);
  }

  void removeFromShishaLocationList(String value) {
    _shishaLocationList.remove(value);
  }

  void removeAtIndexFromShishaLocationList(int index) {
    _shishaLocationList.removeAt(index);
  }

  void updateShishaLocationListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _shishaLocationList[index] = updateFn(_shishaLocationList[index]);
  }

  void insertAtIndexInShishaLocationList(int index, String value) {
    _shishaLocationList.insert(index, value);
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? value) {
    _currentLocation = value;
  }

  String _mochmatchvalue = '';
  String get mochmatchvalue => _mochmatchvalue;
  set mochmatchvalue(String value) {
    _mochmatchvalue = value;
  }

  String _searchWords = '';
  String get searchWords => _searchWords;
  set searchWords(String value) {
    _searchWords = value;
  }

  bool _disableDaradaraSearch = true;
  bool get disableDaradaraSearch => _disableDaradaraSearch;
  set disableDaradaraSearch(bool value) {
    _disableDaradaraSearch = value;
  }

  bool _disableWaiwaiSearch = true;
  bool get disableWaiwaiSearch => _disableWaiwaiSearch;
  set disableWaiwaiSearch(bool value) {
    _disableWaiwaiSearch = value;
  }

  bool _disableMattariSearch = true;
  bool get disableMattariSearch => _disableMattariSearch;
  set disableMattariSearch(bool value) {
    _disableMattariSearch = value;
  }

  bool _disableShuchuSearch = true;
  bool get disableShuchuSearch => _disableShuchuSearch;
  set disableShuchuSearch(bool value) {
    _disableShuchuSearch = value;
  }

  bool _disableShoshinshaSearch = true;
  bool get disableShoshinshaSearch => _disableShoshinshaSearch;
  set disableShoshinshaSearch(bool value) {
    _disableShoshinshaSearch = value;
  }
}
