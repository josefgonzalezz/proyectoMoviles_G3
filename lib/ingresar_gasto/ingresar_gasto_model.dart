import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ingresar_gasto_widget.dart' show IngresarGastoWidget;
import 'package:flutter/material.dart';

class IngresarGastoModel extends FlutterFlowModel<IngresarGastoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CompraField widget.
  FocusNode? compraFieldFocusNode;
  TextEditingController? compraFieldTextController;
  String? Function(BuildContext, String?)? compraFieldTextControllerValidator;
  // State field(s) for DescripcionTextField widget.
  FocusNode? descripcionTextFieldFocusNode;
  TextEditingController? descripcionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descripcionTextFieldTextControllerValidator;
  // State field(s) for CostoField widget.
  FocusNode? costoFieldFocusNode;
  TextEditingController? costoFieldTextController;
  String? Function(BuildContext, String?)? costoFieldTextControllerValidator;
  String? _costoFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bww2i052' /* El costo es requerido */,
      );
    }

    if (!RegExp('^[1-9]\\d*\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ckmej7m4' /* Solo se permite numeros valido... */,
      );
    }
    return null;
  }

  // State field(s) for ComentarioField widget.
  FocusNode? comentarioFieldFocusNode;
  TextEditingController? comentarioFieldTextController;
  String? Function(BuildContext, String?)?
      comentarioFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GastoRealizadoRecord? backend;

  @override
  void initState(BuildContext context) {
    costoFieldTextControllerValidator = _costoFieldTextControllerValidator;
  }

  @override
  void dispose() {
    compraFieldFocusNode?.dispose();
    compraFieldTextController?.dispose();

    descripcionTextFieldFocusNode?.dispose();
    descripcionTextFieldTextController?.dispose();

    costoFieldFocusNode?.dispose();
    costoFieldTextController?.dispose();

    comentarioFieldFocusNode?.dispose();
    comentarioFieldTextController?.dispose();
  }
}
