import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingresar_gasto_model.dart';
export 'ingresar_gasto_model.dart';

class IngresarGastoWidget extends StatefulWidget {
  const IngresarGastoWidget({super.key});

  static String routeName = 'ingresarGasto';
  static String routePath = '/ingresarGasto';

  @override
  State<IngresarGastoWidget> createState() => _IngresarGastoWidgetState();
}

class _IngresarGastoWidgetState extends State<IngresarGastoWidget> {
  late IngresarGastoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IngresarGastoModel());

    _model.compraFieldTextController ??= TextEditingController();
    _model.compraFieldFocusNode ??= FocusNode();

    _model.descripcionTextFieldTextController ??= TextEditingController();
    _model.descripcionTextFieldFocusNode ??= FocusNode();

    _model.costoFieldTextController ??= TextEditingController();
    _model.costoFieldFocusNode ??= FocusNode();

    _model.comentarioFieldTextController ??= TextEditingController();
    _model.comentarioFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFDFDFC),
        appBar: AppBar(
          backgroundColor: Color(0xFFFDFAFA),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF15161E),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();

              context.pushNamed(HomePageWidget.routeName);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(PersonalInformationWidget.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/blank-profile-picture-973460_640.webp',
                    width: 40.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ic81wd5c' /* Ingresar Gasto */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2.0,
                    endIndent: 100.0,
                    color: Color(0xFF000204),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'w8vnkp0s' /* Nombre de compra realizada:  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF020202),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.compraFieldTextController,
                        focusNode: _model.compraFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.compraFieldTextController',
                          Duration(milliseconds: 0),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: FFLocalizations.of(context).getText(
                            'd13irgol' /* compra */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF090303),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.compraFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/94180.jpg',
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/pngtree-vector-shopping-bag-icon-png-image_4869075.jpg',
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/istockphoto-1339064835-612x612.jpg',
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/heart-health-icon-ideal-for-medical-and-wellness-themes-vector.jpg',
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/pngtree-crossed-spoon-and-fork-restaurant-and-food-logo-design-png-image_1716397.jpg',
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/istockphoto-688550958-170667a.jpg',
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'z8e771bv' /* Categoría:  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF020202),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.descripcionTextFieldTextController,
                        focusNode: _model.descripcionTextFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.descripcionTextFieldTextController',
                          Duration(milliseconds: 0),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: FFLocalizations.of(context).getText(
                            'g7d83wfx' /* descripcion */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF090707),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model
                            .descripcionTextFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vxnueb8m' /* Costo: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF020202),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.costoFieldTextController,
                          focusNode: _model.costoFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.costoFieldTextController',
                            Duration(milliseconds: 0),
                            () => safeSetState(() {}),
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: FFLocalizations.of(context).getText(
                              '04nwp0u5' /* costo */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0B0909),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 20.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.costoFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'b3yy7nm7' /* Comentario adicional: */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF020202),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.comentarioFieldTextController,
                        focusNode: _model.comentarioFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.comentarioFieldTextController',
                          Duration(milliseconds: 0),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: FFLocalizations.of(context).getText(
                            'iaxxto9m' /* comentario */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF0D0A0A),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.comentarioFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }

                    var gastoRealizadoRecordReference =
                        GastoRealizadoRecord.collection.doc();
                    await gastoRealizadoRecordReference.set({
                      ...createGastoRealizadoRecordData(
                        compra: _model.compraFieldTextController.text,
                        descripcion:
                            _model.descripcionTextFieldTextController.text,
                        costo: _model.costoFieldTextController.text,
                        owner: functions.parseUserDocument(currentUserUid),
                        comentario: _model.comentarioFieldTextController.text,
                      ),
                      ...mapToFirestore(
                        {
                          'dueDate': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                    _model.backend = GastoRealizadoRecord.getDocumentFromData({
                      ...createGastoRealizadoRecordData(
                        compra: _model.compraFieldTextController.text,
                        descripcion:
                            _model.descripcionTextFieldTextController.text,
                        costo: _model.costoFieldTextController.text,
                        owner: functions.parseUserDocument(currentUserUid),
                        comentario: _model.comentarioFieldTextController.text,
                      ),
                      ...mapToFirestore(
                        {
                          'dueDate': DateTime.now(),
                        },
                      ),
                    }, gastoRealizadoRecordReference);
                    if (_model.backend?.reference != null) {
                      context.pushNamed(HomePageWidget.routeName);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Gasto ingresado correctamente ',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'No se realizo correctamente',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'ly2qmp43' /* Ingresar Gasto */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF57DA01),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0xFF0D0808),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
