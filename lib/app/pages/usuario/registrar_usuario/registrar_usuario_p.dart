import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/colores.dart';
import '../../../widgets/appbar_general.dart';
import './registrar_usuario_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'widgets/inputs_datos_registro_usuario.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';

class RegistrarUsuarioPage extends GetView<RegistrarUsuarioController> {
  RegistrarUsuarioPage({super.key});
  RegistrarUsuarioController get self => controller;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
            top: true,
            child: Form(
                key: self.formKey,
                child: Column(
                  children: [
                    const AppbarGeneral(
                      isTitleBack: true,
                      title: 'Registro Usuario',
                    ),
                    Get.width > 640 ? buildSelectImage() : 0.0.empty,
                    Expanded(
                      child: SingleChildScrollView(
                        child: ResponsiveWeb(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Get.width <= 640 ? buildSelectImage() : 0.0.empty,
                              const InputsDatosRegistroUsuario(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: FFButtonWidget(
                                  onPressed: self.onPressedRegistrar,
                                  text: 'Registrate',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 40,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    color: LightModeTheme().primary,
                                    textStyle:
                                        LightModeTheme().bodyMedium.override(
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
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  Widget buildSelectImage() {
    return ResponsiveWeb(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
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
                  style:
                      LightModeTheme().labelLarge.copyWith(color: Colors.black),
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 90,
                      child: TextFormField(
                        focusNode: self.tc.fotoFocusNode,
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(fontSize: 0),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: LightModeTheme().error,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colores.usuario.primary),
                                borderRadius: BorderRadius.circular(50)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(width: 3),
                                borderRadius: BorderRadius.circular(50)),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 34)),
                        enableInteractiveSelection: false,
                        readOnly: true,
                        validator: self.image.validatorImage,
                      ),
                    ),
                    Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: BtnIcon(
                        onPressed: self.image.dialogSeleccionarImage,
                        borderRadius: 50,
                        padding: const EdgeInsets.all(0),
                        fillColor: Colors.transparent,
                        hoverColor: const Color.fromARGB(68, 255, 255, 255),
                        icon: Obx(self.image.getImageWidget),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
