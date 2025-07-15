import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey7 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for FirstNameTextField widget.
  FocusNode? firstNameTextFieldFocusNode;
  TextEditingController? firstNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameTextFieldTextControllerValidator;
  String? _firstNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3mq9xfe6' /* Field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z]{3,20}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6l4hi57r' /* Solo letras, sin espacios */,
      );
    }
    return null;
  }

  // State field(s) for LastNameTextField widget.
  FocusNode? lastNameTextFieldFocusNode;
  TextEditingController? lastNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      lastNameTextFieldTextControllerValidator;
  String? _lastNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g517s1l8' /* Field is required */,
      );
    }

    if (!RegExp('^[a-zA-Z]{3,20}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6hnqzjx2' /* solo letras, sin espacios */,
      );
    }
    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qvyivhkh' /* email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'tho6534o' /* Se necesita un gmail valido */,
      );
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wt7zvajq' /* password is required */,
      );
    }

    if (!RegExp('^.{7,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'hvzt9e2e' /* Al menos 7 caracteres */,
      );
    }
    return null;
  }

  // State field(s) for ConfirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode;
  TextEditingController? confirmPasswordTextFieldTextController;
  late bool confirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextControllerValidator;
  String? _confirmPasswordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3qx1g3vo' /* confirm password is required */,
      );
    }

    return null;
  }

  // State field(s) for BirthdatetextField widget.
  FocusNode? birthdatetextFieldFocusNode;
  TextEditingController? birthdatetextFieldTextController;
  late MaskTextInputFormatter birthdatetextFieldMask;
  String? Function(BuildContext, String?)?
      birthdatetextFieldTextControllerValidator;
  String? _birthdatetextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xcwjl3bn' /* mm/dd/yyyy is required */,
      );
    }

    return null;
  }

  // State field(s) for WeeklyTextField widget.
  FocusNode? weeklyTextFieldFocusNode;
  TextEditingController? weeklyTextFieldTextController;
  String? Function(BuildContext, String?)?
      weeklyTextFieldTextControllerValidator;
  String? _weeklyTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4qvbzs6l' /* Ingrese un limite valido  */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - parseDate] action in Button widget.
  DateTime? birthdate;
  // Stores action output result for [Custom Action - encryptText] action in Button widget.
  String? password;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersRecord? result;

  @override
  void initState(BuildContext context) {
    firstNameTextFieldTextControllerValidator =
        _firstNameTextFieldTextControllerValidator;
    lastNameTextFieldTextControllerValidator =
        _lastNameTextFieldTextControllerValidator;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    confirmPasswordTextFieldVisibility = false;
    confirmPasswordTextFieldTextControllerValidator =
        _confirmPasswordTextFieldTextControllerValidator;
    birthdatetextFieldTextControllerValidator =
        _birthdatetextFieldTextControllerValidator;
    weeklyTextFieldTextControllerValidator =
        _weeklyTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameTextFieldFocusNode?.dispose();
    firstNameTextFieldTextController?.dispose();

    lastNameTextFieldFocusNode?.dispose();
    lastNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    confirmPasswordTextFieldFocusNode?.dispose();
    confirmPasswordTextFieldTextController?.dispose();

    birthdatetextFieldFocusNode?.dispose();
    birthdatetextFieldTextController?.dispose();

    weeklyTextFieldFocusNode?.dispose();
    weeklyTextFieldTextController?.dispose();
  }
}
