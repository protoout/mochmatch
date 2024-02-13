import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  set shishaLocation(LatLng? _value) {
    _shishaLocation = _value;
  }

  List<String> _shishaLocationList = [];
  List<String> get shishaLocationList => _shishaLocationList;
  set shishaLocationList(List<String> _value) {
    _shishaLocationList = _value;
  }

  void addToShishaLocationList(String _value) {
    _shishaLocationList.add(_value);
  }

  void removeFromShishaLocationList(String _value) {
    _shishaLocationList.remove(_value);
  }

  void removeAtIndexFromShishaLocationList(int _index) {
    _shishaLocationList.removeAt(_index);
  }

  void updateShishaLocationListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _shishaLocationList[_index] = updateFn(_shishaLocationList[_index]);
  }

  void insertAtIndexInShishaLocationList(int _index, String _value) {
    _shishaLocationList.insert(_index, _value);
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? _value) {
    _currentLocation = _value;
  }

  String _mochmatchvalue = '';
  String get mochmatchvalue => _mochmatchvalue;
  set mochmatchvalue(String _value) {
    _mochmatchvalue = _value;
  }
}
