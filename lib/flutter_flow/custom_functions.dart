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

int getTotalStepCount(
  List<StepsRecord>? stepList,
  DateTime now,
) {
  final todayStart = DateTime(now.year, now.month, now.day);
  final todayEnd = todayStart.add(Duration(days: 1));
  final todayRecords = stepList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalSteps = todayRecords?.fold<int>(
          0, (previousValue, record) => previousValue + record.steps) ??
      0;
  return totalSteps;
}

int newTotalActiveEnergy(
  List<ActiveEnergyRecord>? caloryLIst,
  DateTime now,
) {
  final todayStart = DateTime(now.year, now.month, now.day);
  final todayEnd = todayStart.add(Duration(days: 1));
  final todayRecords = caloryLIst
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalCalories = todayRecords?.fold<int>(
          0, (previousValue, record) => previousValue + record.calories) ??
      0;
  return totalCalories;
}

double getTotalDistance(
  List<DistanceRecord>? distanceList,
  DateTime now,
) {
  final todayStart = DateTime(now.year, now.month, now.day);
  final todayEnd = todayStart.add(Duration(days: 1));
  final todayRecords = distanceList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalDistance = todayRecords?.fold<double>(
          0, (previousValue, record) => previousValue + record.distance) ??
      0;
  return totalDistance / 1000;
}

int getTotalExerciseTime(
  List<ExercisesRecord>? exerciseList,
  DateTime now,
) {
  final todayStart = DateTime(now.year, now.month, now.day);
  final todayEnd = todayStart.add(Duration(days: 1));
  final todayRecords = exerciseList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalTime = todayRecords?.fold<int>(
          0, (previousValue, record) => previousValue + record.totalTime) ??
      0;
  return totalTime;
}
