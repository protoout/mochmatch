import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? calculateDaradara(int softnessOfChair) {
  String mochmatch_value = '';
  num mochmatch_num = math.pow(softnessOfChair, 2);
  if (mochmatch_num > 8) {
    mochmatch_value = '#ダラダラ';
  }

  return mochmatch_value;
}

String? calculateShoshinsha(int friendlinessOfStaffs) {
  String mochmatch_value = '';
  num mochmatch_num = math.pow(friendlinessOfStaffs, 2);
  if (mochmatch_num > 8) {
    mochmatch_value = '#初心者';
  }

  return mochmatch_value;
}

double calculateDistanceAsDouble(
  LatLng? shishaLocation,
  LatLng currentLocation,
) {
  if (shishaLocation == null) {
    return 10000; // shishaLocationがnullの場合、距離10000を返す
  }

  // Calculate the distance from the longitude and latitude of shishaLocation and currentLocation.
  final double earthRadius = 6371.0;
  final double lat1 = shishaLocation.latitude ?? 0; // Nullの場合は0を代入
  final double lon1 = shishaLocation.longitude ?? 0; // Nullの場合は0を代入
  final double lat2 = currentLocation.latitude;
  final double lon2 = currentLocation.longitude;

  double _toRadians(double degree) {
    return degree * (math.pi / 180.0);
  }

  final double dLat = _toRadians(lat2 - lat1);
  final double dLon = _toRadians(lon2 - lon1);

  final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_toRadians(lat1)) *
          math.cos(_toRadians(lat2)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  final double distance = earthRadius * c;

  return distance;
}

String? calculateMattari(
  int noisiness,
  int bgm,
  int brightness,
) {
  String mochmatch_value = '';
  if (bgm != 2) {
    bgm = 1;
  }
  num mochmatch_num = (3 - noisiness) * (4 - brightness) * bgm;
  if (mochmatch_num > 3) {
    mochmatch_value = '#まったり';
  }

  return mochmatch_value;
}

String? calculateShuchu(
  int noisiness,
  int softnessOfChair,
) {
  String mochmatch_value = '';
  num mochmatch_num = (3 - noisiness) * softnessOfChair;
  if (mochmatch_num > 4) {
    mochmatch_value = '#集中';
  }

  return mochmatch_value;
}

String? calculateWaiwai(
  int friendlinessOfStaffs,
  int noisiness,
  int bgm,
) {
  String mochmatch_value = '';
  num mochmatch_num = friendlinessOfStaffs * noisiness * bgm;
  if (mochmatch_num > 9) {
    mochmatch_value = '#ワイワイ';
  }

  return mochmatch_value;
}

String? calculateMochmatch(
  int softnessOfChair,
  int friendlinessOfStaffs,
  int noisiness,
  int bgm,
  int brightness,
) {
  String mochmatch_value = '';

  num mochmatch_daradara_num = math.pow(softnessOfChair, 2);
  if (mochmatch_daradara_num > 8) {
    mochmatch_value += '#ダラダラ';
  }

  num mochmatch_waiwai_num = friendlinessOfStaffs * noisiness * bgm;
  if (mochmatch_waiwai_num > 9) {
    mochmatch_value += '#ワイワイ';
  }

  int mochmatch_mattari_num = 0;
  if (bgm == 2) {
    mochmatch_mattari_num = (3 - noisiness) * (4 - brightness) * bgm;
  } else {
    mochmatch_mattari_num = (3 - noisiness) * (4 - brightness);
  }

  if (mochmatch_mattari_num > 3) {
    mochmatch_value += '#まったり';
  }

  num mochmatch_shuchu_num = (3 - noisiness) * softnessOfChair;
  if (mochmatch_shuchu_num > 4) {
    mochmatch_value += '#集中';
  }

  num mochmatch_shoshinsha_num = math.pow(friendlinessOfStaffs, 2);
  if (mochmatch_shoshinsha_num > 8) {
    mochmatch_value += '#初心者';
  }

  return mochmatch_value;
}

LatLng convertStringToLatLng(
  String latString,
  String lngString,
) {
  // convert Srting valuable lat and lng to LatLng valuable
  final double lat = double.parse(latString);
  final double lng = double.parse(lngString);
  return LatLng(lat, lng);
}
