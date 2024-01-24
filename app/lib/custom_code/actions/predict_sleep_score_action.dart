// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<double> predictSleepScoreAction(
  List<StepsRecord>? stepList,
  List<DistanceRecord>? distanceList,
  List<ActiveEnergyRecord>? caloryList,
  List<SleepRecord>? sleepList,
  DateTime now,
) async {
  final todayStart = DateTime(now.year, now.month, now.day);
  final todayEnd = todayStart.add(Duration(days: 1));

  // total steps
  final todayStepRecords = stepList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalSteps = todayStepRecords?.fold<int>(
          0, (previousValue, record) => previousValue + record.steps) ??
      0;

  // total distance
  final todayDistanceRecords = distanceList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalDistance = todayDistanceRecords?.fold<double>(
          0, (previousValue, record) => previousValue + record.distance) ??
      0;

  // total calory
  final todayCaloryRecords = caloryList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalCalories = todayCaloryRecords?.fold<int>(
          0, (previousValue, record) => previousValue + record.calories) ??
      0;

  // average sleep bed in time
  final todaySleepRecords = sleepList
      ?.where((record) =>
          record.createdTime!.isAfter(todayStart) &&
          record.createdTime!.isBefore(todayEnd))
      .toList();
  final totalBedInTime = todaySleepRecords?.fold<int>(
          0, (previousValue, record) => previousValue + record.inBed) ??
      0;

  // Calculate average sleep in bed, handling division by zero
  final avgBedInTime = todaySleepRecords != null && todaySleepRecords.isNotEmpty
      ? totalBedInTime / todaySleepRecords.length
      : 0;

  // TODO: use machine learning model to predict value
  // HACK: create fake value for testing
  final score = ((totalSteps / 10000) * 0.1 +
      (totalCalories / 400) * 0.2 +
      (totalDistance / 5000) * 0.1 +
      (avgBedInTime / 420) * 0.4);

  return score > 10 ? score / 100 : 0;
}
