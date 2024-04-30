import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/dialog/link_dialog.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../backend/server_node/proveedor_node.dart';
import '../../../../utils/loader/color_loader_3.dart';
import '../../../../utils/server/image_server.dart';
import '../../../widgets/seleccion_imagen_widget.dart';
import './datos_proveedor_c.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/btn_icon.dart';
import '../../../widgets/appbar_general.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'widgets/codigo_iban.dart';
import 'widgets/input_registrar.dart';

class DatosProveedorPage extends GetView<DatosProveedorController> {
  DatosProveedorPage({super.key});
  DatosProveedorController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final focusedColor = const Color(0xFF46EF98);
  final lineColor = const Color.fromARGB(160, 70, 239, 152);
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
    final datosFacturacion = self.datosFacturacion().listProperty();
    final datosPago = self.datosPago().listProperty();
    final datosContacto = self.datosContacto();
    final datosUbicacion = self.datosUbicacion();
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              const AppbarGeneral(
                isTitleBack: true,
                title: 'Datos Proveedor',
              ),
              self.apiDatosProveedor.obx(
                  (state) => Form(
                        key: self.formKey,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                seleccionarImage(),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos de facturación',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosFacturacion.length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField:
                                            datosFacturacion[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos de pago/cobro',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosPago.length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField: datosPago[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos de contacto',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosContacto.listProperty().length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField: datosContacto
                                            .listProperty()[index])),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 12.0, 5.0, 0.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 80,
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosContacto.lada)),
                                      Flexible(
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosContacto.movil))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos ubicación',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                ...List<Widget>.generate(
                                    datosUbicacion.length,
                                    (index) => buildInput(
                                        context: context,
                                        propertiesTextField:
                                            datosUbicacion[index])),
                              ],
                            ),
                          ),
                        ),
                      ),
                  onLoading: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ColorLoader3(),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FFButtonWidget(
                  onPressed: self.onOpenDialogEliminarCuenta,
                  text: 'Eliminar Cuenta',
                  options: FFButtonOptions(
                    width: 40.0.w,
                    height: 40,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Colores().rojo,
                    textStyle: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: LightModeTheme().tertiary,
                        ),
                    elevation: 2,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget seleccionarImage() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(Get.context!).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Selecciona tu foto de perfil',
                  style: FlutterFlowTheme.of(Get.context!)
                      .labelLarge
                      .copyWith(color: Colors.black),
                ),
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Colores().usuario.primary69)),
                    shape: BoxShape.circle,
                  ),
                  child: BtnIcon(
                    onPressed: mostrarImagen,
                    borderRadius: 50,
                    padding: const EdgeInsets.all(0),
                    fillColor: Colors.transparent,
                    hoverColor: const Color.fromARGB(68, 255, 255, 255),
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: SizedBox(
                        width: 200,
                        child: ImageServer(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void mostrarImagen() {
    Get.dialog(
      GestureDetector(
        onTap: () => Get.back(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageServer(
              width: null,
              height: null,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FFButtonWidget(
                onPressed: () => {
                  Get.dialog(SeleccionImagenWidget(
                    onPressed: self.selectImage,
                    isProveedor: true,
                  )),
                },
                text: 'Editar foto',
                icon: const Icon(
                  Icons.edit,
                  size: 25,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: FlutterFlowTheme.of(Get.context!).primaryBackground,
                  textStyle: FlutterFlowTheme.of(Get.context!).bodyLarge,
                  elevation: 2,
                  splashColor: const Color.fromARGB(65, 0, 0, 0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput({
    required BuildContext context,
    EdgeInsetsGeometry? padding,
    required PropertiesTextField propertiesTextField,
  }) {
    if (propertiesTextField.labelText == 'Número de cuenta') {
      return const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
        child: CodigoIban(),
      );
    }
    return VibratingWidget(
        controller: propertiesTextField.anim,
        child: Padding(
            padding: padding ??
                const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: propertiesTextField.isSelect
                ? LayoutBuilder(builder: (context, boxContrains) {
                    return TextFormField(
                      controller: propertiesTextField.controller,
                      focusNode: propertiesTextField.focusNode,
                      maxLength: propertiesTextField.maxLength,
                      keyboardType: propertiesTextField.keyboardType,
                      decoration: InputDecoration(
                        counterText: '',
                        errorStyle: const TextStyle(fontSize: 0),
                        labelText: propertiesTextField.labelText,
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF95A1AC),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colores().proveedor.primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colores().proveedor.primary69,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: focusedColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: propertiesTextField.validateTextField,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      readOnly: true,
                      enabled: false,
                      onTap: () => SelectInputRegistrar(
                        context: context,
                        itemsDD: propertiesTextField.listSelect,
                        paddingDialogLeft: 5,
                        paddingSelect:
                            const EdgeInsets.only(left: 10.0, top: 0),
                        onChanged: (val) =>
                            propertiesTextField.controller.text = val,
                      ).handleTap(),
                      enableInteractiveSelection: propertiesTextField.isSelect,
                    );
                  })
                : (propertiesTextField.labelText == 'Certificado de Cuenta'
                    ? buildUploadImage(
                        context: context,
                        propertiesTextField: propertiesTextField)
                    : TextFormField(
                        controller: propertiesTextField.controller,
                        focusNode: propertiesTextField.focusNode,
                        maxLength: propertiesTextField.maxLength,
                        keyboardType: propertiesTextField.keyboardType,
                        decoration: InputDecoration(
                          counterText: '',
                          errorStyle: const TextStyle(fontSize: 0),
                          labelText: propertiesTextField.labelText,
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF95A1AC),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: lineColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colores().proveedor.primary69,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: focusedColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: propertiesTextField.suffixIcon,
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        inputFormatters: propertiesTextField.inputFormatters,
                        enabled: false,
                        onChanged: propertiesTextField.onChange,
                        validator: propertiesTextField.validateTextField))));
  }

  TextFormField buildUploadImage({
    required BuildContext context,
    required PropertiesTextField propertiesTextField,
  }) {
    return TextFormField(
      controller: propertiesTextField.controller,
      focusNode: propertiesTextField.focusNode,
      maxLength: propertiesTextField.maxLength,
      keyboardType: propertiesTextField.keyboardType,
      decoration: InputDecoration(
        counterText: '',
        errorStyle: const TextStyle(fontSize: 0),
        labelText: propertiesTextField.labelText,
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: const Color(0xFF95A1AC),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colores().proveedor.primary69,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colores().proveedor.primary69,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.edit_square, color: focusedColor, size: 30)),
        suffixIcon: Obx(() => self.imageFileCertificado.value != null
            ? BtnIcon(
                onPressed: () {
                  Get.dialog(
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(
                          ProveedorNode()
                              .getImageNode(self.imageFileCertificado.value!),
                          width: 250.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  );
                },
                borderRadius: 30,
                padding: const EdgeInsets.all(0),
                fillColor: Colors.transparent,
                hoverColor: const Color.fromARGB(68, 255, 255, 255),
                icon: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    ProveedorNode()
                        .getImageNode(self.imageFileCertificado.value!),
                  ),
                ))
            : const SizedBox.shrink()),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        contentPadding:
            const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      readOnly: true,
      enableInteractiveSelection: false,
      validator: self.imageFileCertificado.value == null
          ? propertiesTextField.validateTextField
          : (val) => null,
    );
  }
}
