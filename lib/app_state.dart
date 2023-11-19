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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _demoMode = prefs.getBool('ff_demoMode') ?? _demoMode;
    });
    _safeInit(() {
      _autoSyncData = prefs.getBool('ff_autoSyncData') ?? _autoSyncData;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _demoMode = false;
  bool get demoMode => _demoMode;
  set demoMode(bool _value) {
    _demoMode = _value;
    prefs.setBool('ff_demoMode', _value);
  }

  bool _autoSyncData = false;
  bool get autoSyncData => _autoSyncData;
  set autoSyncData(bool _value) {
    _autoSyncData = _value;
    prefs.setBool('ff_autoSyncData', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
