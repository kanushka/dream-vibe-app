import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());
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
              color: FlutterFlowTheme.of(context).primaryText,
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
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: FutureBuilder<List<GoalsRecord>>(
              future: queryGoalsRecordOnce(
                parent: currentUserReference,
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitFadingFour(
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<GoalsRecord> containerGoalsRecordList = snapshot.data!;
                final containerGoalsRecord = containerGoalsRecordList.isNotEmpty
                    ? containerGoalsRecordList.first
                    : null;
                return Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 670.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 32.0, 0.0, 24.0),
                                  child: Text(
                                    'Settings',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium,
                                  ),
                                ),
                                SwitchListTile.adaptive(
                                  value: _model.switchListTileValue1 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() => _model.switchListTileValue1 =
                                        newValue!);
                                    if (newValue!) {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        notification: true,
                                      ));
                                    } else {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        notification: false,
                                      ));
                                    }
                                  },
                                  title: Text(
                                    'Do Not Disturb',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  subtitle: Text(
                                    'Activate \'Do Not Disturb\' to enjoy uninterrupted time. Your notifications will be silenced.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                                SwitchListTile.adaptive(
                                  value: _model.switchListTileValue2 ??=
                                      FFAppState().autoSyncData,
                                  onChanged: (newValue) async {
                                    setState(() => _model.switchListTileValue2 =
                                        newValue!);
                                    if (newValue!) {
                                      FFAppState().update(() {
                                        FFAppState().autoSyncData = true;
                                      });
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().autoSyncData = false;
                                      });
                                    }
                                  },
                                  title: Text(
                                    'Auto-Sync Health Data',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  subtitle: Text(
                                    'Enable this feature for seamless synchronization of your health data from your device\'s Health Kit API',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                                SwitchListTile.adaptive(
                                  value: _model.switchListTileValue3 ??=
                                      FFAppState().demoMode,
                                  onChanged: (newValue) async {
                                    setState(() => _model.switchListTileValue3 =
                                        newValue!);
                                    if (newValue!) {
                                      FFAppState().update(() {
                                        FFAppState().demoMode = true;
                                      });
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().demoMode = false;
                                      });
                                    }
                                  },
                                  title: Text(
                                    'Demo Data Mode',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  subtitle: Text(
                                    'Switch on to populate the app with sample data',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ]
                                  .divide(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 44.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
