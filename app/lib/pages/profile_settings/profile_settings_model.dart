import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'profile_settings_widget.dart' show ProfileSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileSettingsModel extends FlutterFlowModel<ProfileSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  final ageMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? ageControllerValidator;
  // State field(s) for gender widget.
  final genderKey = GlobalKey();
  FocusNode? genderFocusNode;
  TextEditingController? genderController;
  String? genderSelectedOption;
  String? Function(BuildContext, String?)? genderControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightController;
  String? Function(BuildContext, String?)? weightControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightController;
  String? Function(BuildContext, String?)? heightControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();

    genderFocusNode?.dispose();

    weightFocusNode?.dispose();
    weightController?.dispose();

    heightFocusNode?.dispose();
    heightController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
