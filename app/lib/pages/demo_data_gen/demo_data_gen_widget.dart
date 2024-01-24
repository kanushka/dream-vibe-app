import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'demo_data_gen_model.dart';
export 'demo_data_gen_model.dart';

class DemoDataGenWidget extends StatefulWidget {
  const DemoDataGenWidget({Key? key}) : super(key: key);

  @override
  _DemoDataGenWidgetState createState() => _DemoDataGenWidgetState();
}

class _DemoDataGenWidgetState extends State<DemoDataGenWidget> {
  late DemoDataGenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoDataGenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 8.0),
                child: Text(
                  'Demo Data Generator',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add step data',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.lastStepRecord = await queryStepsRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (stepsRecord) => stepsRecord
                                  .orderBy('created_time', descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await StepsRecord.createDoc(currentUserReference!)
                                .set({
                              ...createStepsRecordData(
                                steps: random_data.randomInteger(100, 1000),
                                startTime: _model.lastStepRecord?.createdTime,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your step data has been updated.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add heart rate data',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.lastHeartRateRecord =
                                await queryHeartRateRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (heartRateRecord) => heartRateRecord
                                  .orderBy('created_time', descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await HeartRateRecord.createDoc(
                                    currentUserReference!)
                                .set({
                              ...createHeartRateRecordData(
                                rate: random_data.randomInteger(60, 120),
                                restingRate: random_data.randomInteger(60, 100),
                                startTime:
                                    _model.lastHeartRateRecord?.createdTime,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your heart rate data has been updated.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add active energey data',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.lastActiveEnergyRecord =
                                await queryActiveEnergyRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (activeEnergyRecord) =>
                                  activeEnergyRecord.orderBy('created_time',
                                      descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await ActiveEnergyRecord.createDoc(
                                    currentUserReference!)
                                .set({
                              ...createActiveEnergyRecordData(
                                calories: random_data.randomInteger(10, 100),
                                startTime:
                                    _model.lastActiveEnergyRecord?.createdTime,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your active energy burned data has been updated.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add exercise data',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.lastExerciseRecord =
                                await queryExercisesRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (exercisesRecord) => exercisesRecord
                                  .orderBy('created_time', descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await ExercisesRecord.createDoc(
                                    currentUserReference!)
                                .set({
                              ...createExercisesRecordData(
                                totalTime: random_data.randomInteger(15, 30),
                                type: 'WALK',
                                startTime:
                                    _model.lastExerciseRecord?.createdTime,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your exercise data has been updated.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add distance data',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.lastDistanceRecord =
                                await queryDistanceRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (distanceRecord) => distanceRecord
                                  .orderBy('created_time', descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await DistanceRecord.createDoc(
                                    currentUserReference!)
                                .set({
                              ...createDistanceRecordData(
                                distance: random_data
                                    .randomInteger(10, 500)
                                    .toDouble(),
                                startTime:
                                    _model.lastDistanceRecord?.createdTime,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your distance data has been updated.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add sleep data',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.lastSleepRecord = await querySleepRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (sleepRecord) => sleepRecord
                                  .orderBy('created_time', descending: true),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await SleepRecord.createDoc(currentUserReference!)
                                .set({
                              ...createSleepRecordData(
                                asleep: random_data.randomInteger(360, 480),
                                awake: random_data.randomInteger(10, 90),
                                deepSleep: random_data.randomInteger(90, 120),
                                rem: random_data.randomInteger(90, 120),
                                inBed: random_data.randomInteger(420, 540),
                                startTime: _model.lastStepRecord?.createdTime,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your sleep data has been updated.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0x00E0E3E7),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Predict sleep quality score',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.auto_fix_high,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            _model.userStepsList = await queryStepsRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (stepsRecord) => stepsRecord
                                  .orderBy('created_time', descending: true),
                            );
                            _model.userDistanceList =
                                await queryDistanceRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (distanceRecord) => distanceRecord
                                  .orderBy('created_time', descending: true),
                            );
                            _model.userCaloryList =
                                await queryActiveEnergyRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (activeEnergyRecord) =>
                                  activeEnergyRecord.orderBy('created_time',
                                      descending: true),
                            );
                            _model.userSleepList = await querySleepRecordOnce(
                              parent: currentUserReference,
                              queryBuilder: (sleepRecord) => sleepRecord
                                  .orderBy('created_time', descending: true),
                            );
                            _model.userSleepScore =
                                await actions.predictSleepScoreAction(
                              _model.userStepsList?.toList(),
                              _model.userDistanceList?.toList(),
                              _model.userCaloryList?.toList(),
                              _model.userSleepList?.toList(),
                              getCurrentTimestamp,
                            );

                            await PredictedScoreRecord.createDoc(
                                    currentUserReference!)
                                .set({
                              ...createPredictedScoreRecordData(
                                score: _model.userSleepScore,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Success! Your sleep score  has been predicted.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
