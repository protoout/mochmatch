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

String calculateDistance(
  LatLng shishaLocation,
  LatLng currentLocation,
) {
  // Calculate the distance from the longitude and latitude of shishaLocation and currentLocation.
  final double earthRadius = 6371.0;
  final double lat1 = shishaLocation.latitude;
  final double lon1 = shishaLocation.longitude;
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

  return '${distance.toStringAsFixed(2)} km';
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

List<double>? calculateDistanceSort(
  List<LatLng>? shopLocation,
  List<LatLng>? currentLocation,
) {
  // After calculating the distance from the longitude and latitude of two points, sort in ascending
  List<double>? distances = [];

  if (shopLocation == null || currentLocation == null) {
    return null;
  }

  for (int i = 0; i < shopLocation.length; i++) {
    double lat1 = shopLocation[i].latitude;
    double lon1 = shopLocation[i].longitude;
    double lat2 = currentLocation[0].latitude;
    double lon2 = currentLocation[0].longitude;

    double theta = lon1 - lon2;
    double dist = math.sin(lat1 * (math.pi / 180.0)) *
            math.sin(lat2 * (math.pi / 180.0)) +
        math.cos(lat1 * (math.pi / 180.0)) *
            math.cos(lat2 * (math.pi / 180.0)) *
            math.cos(theta * (math.pi / 180.0));
    dist = math.acos(dist);
    dist = dist * (180.0 / math.pi);
    dist = dist * 60 * 1.1515;
    dist = dist * 1.609344;

    distances.add(dist);
  }

  distances.sort();

  return distances;
}
