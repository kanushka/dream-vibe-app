import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'demo_data_gen_widget.dart' show DemoDataGenWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DemoDataGenModel extends FlutterFlowModel<DemoDataGenWidget> {
  ///  Local state fields for this page.

  bool isDataGenerating = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  StepsRecord? lastStepRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  HeartRateRecord? lastHeartRateRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ActiveEnergyRecord? lastActiveEnergyRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ExercisesRecord? lastExerciseRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  DistanceRecord? lastDistanceRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  SleepRecord? lastSleepRecord;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<StepsRecord>? userStepsList;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<DistanceRecord>? userDistanceList;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ActiveEnergyRecord>? userCaloryList;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<SleepRecord>? userSleepList;
  // Stores action output result for [Custom Action - predictSleepScoreAction] action in IconButton widget.
  double? userSleepScore;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
