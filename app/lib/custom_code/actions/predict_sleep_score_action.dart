import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

// Function to load the personalized model
Future<String?> loadPersonalizedModel() async {
  return await Tflite.loadModel(
    model: "assets/tfl_models/single_user_rf_model.tflite",
  );
}

// Function to load the generalized model
Future<String?> loadGeneralizedModel() async {
  return await Tflite.loadModel(
    model: "assets/tfl_models/multi_user_rf_model.tflite",
  );
}

// Function to run inference
Future<dynamic> runInference(List<double> inputList) async {
  var inputBytes = Float32List.fromList(inputList).buffer.asUint8List();
  var output = await Tflite.runModelOnBinary(binary: inputBytes);
  return output;
}

// Calculate the weights based on the R^2 scores
List<double> calculateWeights(double r2General, double r2Personal) {
  double wg = r2General / (r2General + r2Personal);
  double wp = r2Personal / (r2General + r2Personal);
  return [wg, wp];
}

// Calculate the unified sleep quality score
double calculateUnifiedScore(double sGeneral, double sPersonal, double wg, double wp) {
  double sUnified = wg * sGeneral + wp * sPersonal;
  return sUnified;
}

// Unified score calculation utility function
Future<double> calculateUnifiedScoreFromFeatures(List<double> inputFeatures) async {
  // Load and run inference on the personalized model
  await loadPersonalizedModel();
  var predictionPersonalizedModel = await runInference(inputFeatures);
  Tflite.close();

  // Load and run inference on the generalized model
  await loadGeneralizedModel();
  var predictionGeneralizedModel = await runInference(inputFeatures);
  Tflite.close();

  //  R² scores 
  double r2General = 0.948;
  double r2Personal = 0.986;

  // Calculate the weights based on the R² scores
  List<double> weights = calculateWeights(r2General, r2Personal);
  double wg = weights[0];
  double wp = weights[1];

  // Calculate the unified sleep quality score
  double sUnified = calculateUnifiedScore(predictionGeneralizedModel, predictionPersonalizedModel, wg, wp);

  return sUnified;
}

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

  List<double> inputList = [
    totalSteps.toDouble(),
    totalCalories.toDouble(),
    totalDistance.toDouble(),
    avgBedInTime.toDouble()
  ]; 

  // Calculate unified score from features
  double unifiedScore = await calculateUnifiedScoreFromFeatures(inputList);

  return unifiedScore;
}
