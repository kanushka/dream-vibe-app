import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'goals_settings_widget.dart' show GoalsSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoalsSettingsModel extends FlutterFlowModel<GoalsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for stepGoal widget.
  FocusNode? stepGoalFocusNode;
  TextEditingController? stepGoalController;
  String? Function(BuildContext, String?)? stepGoalControllerValidator;
  // State field(s) for sleepHours widget.
  FocusNode? sleepHoursFocusNode;
  TextEditingController? sleepHoursController;
  String? Function(BuildContext, String?)? sleepHoursControllerValidator;
  // State field(s) for exerciseMinutes widget.
  FocusNode? exerciseMinutesFocusNode;
  TextEditingController? exerciseMinutesController;
  String? Function(BuildContext, String?)? exerciseMinutesControllerValidator;
  // State field(s) for calories widget.
  FocusNode? caloriesFocusNode;
  TextEditingController? caloriesController;
  String? Function(BuildContext, String?)? caloriesControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    stepGoalFocusNode?.dispose();
    stepGoalController?.dispose();

    sleepHoursFocusNode?.dispose();
    sleepHoursController?.dispose();

    exerciseMinutesFocusNode?.dispose();
    exerciseMinutesController?.dispose();

    caloriesFocusNode?.dispose();
    caloriesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
