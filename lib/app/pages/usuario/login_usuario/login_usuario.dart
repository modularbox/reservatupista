import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/database.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/auto_size_text/auto_size_text.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/dialog/terminos_condiciones_dialog.dart';
import '../../../../utils/smoth_page/page_view_sliding_indicator.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/text_inputters/inputter_registro.dart';
import './login_usuario_c.dart';
import '../../../../components/navbar_login.dart';
import '/components/app_bar_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import '../../../../constants.dart';

class LoginUsuarioPage extends GetView<LoginUsuarioController> {
  LoginUsuarioPage({super.key});
  LoginUsuarioController get self => controller;
  final Color colorProfesional = const Color(0xFF46EF98);
  final Color colorUsuario = const Color(0xFF2B78DC);

  DatabaseController db = Get.find();
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
    const lineColorUsuario = Color.fromARGB(160, 43, 120, 220);
    final focusedColorUsuario = FlutterFlowTheme.of(context).primary;
    const lineColorProfesional = Color.fromARGB(160, 70, 239, 152);
    final focusedColorProfesional = FlutterFlowTheme.of(context).btnGeneral;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).tertiary,
                FlutterFlowTheme.of(context).accent4
              ],
              stops: const [0, 1],
              begin: const AlignmentDirectional(0, -1),
              end: const AlignmentDirectional(0, 1),
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: AppBarLoginWidget(),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () => Get.toNamed(Routes.PAGO_TPV),
                    splashColor: Colors.blueGrey,
                    child: const Text(
                      'Ir al pago tpv',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * kWidthPercentage,
                    constraints: BoxConstraints(
                      minWidth: 500, // Ajusta este valor según tus necesidades
                    ),
                    child: Column(
                      children: [
                        PageViewSlidingIndicator(
                          widthButtons: (MediaQuery.of(context).size.width >=
                                      640 &&
                                  MediaQuery.of(context).size.width < 740)
                              ? (MediaQuery.of(context).size.width * 0.51) * 0.5
                              : (MediaQuery.of(context).size.width * 0.5) *
                                  0.45,
                          pageCount: self.initialPage,
                          controller: self.pageViewController,
                        ),
                        SizedBox(
                          height: 450,
                          child: PageView(
                            controller: self.pageViewController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildInputsLogin(
                                  context,
                                  formKey: self.formUsuarioKey,
                                  self.emailUsuarioController,
                                  self.passwordUsuarioController,
                                  self.emailUsuarioFocusNode,
                                  self.passwordUsuarioFocusNode,
                                  self.passwordVisibility,
                                  'Usuario',
                                  'Disfruta de todos tus\ndeportes con un click.',
                                  self.checkboxValueRecordarUsuario,
                                  self.checkboxValueTerminosUsuario,
                                  Routes.INICIO,
                                  Routes.REGISTRAR_USUARIO,
                                  self.animTerminosUsuario,
                                  self.validateTerminosUsuario,
                                  lineColor: lineColorUsuario,
                                  focusedColor: focusedColorUsuario,
                                  typeUser: 0,
                                  palomita: Colors.white,
                                  onPressed: self.onPressedUsuario),
                              buildInputsLogin(
                                  context,
                                  formKey: self.formProveedorKey,
                                  self.emailProveedorController,
                                  self.passwordProveedorController,
                                  self.emailProveedorFocusNode,
                                  self.passwordProveedorFocusNode,
                                  self.passwordProveedorVisibility,
                                  'Proveedor',
                                  'Clubs, Ayuntamiento, \nComunidad, Asociación.',
                                  self.checkboxValueRecordarProveedor,
                                  self.checkboxValueTerminosProveedor,
                                  Routes.INICIOPROFESIONAL,
                                  Routes.REGISTRO_PROVEEDOR,
                                  self.animTerminosProveedor,
                                  self.validateTerminosProveedor,
                                  lineColor: lineColorProfesional,
                                  focusedColor: focusedColorProfesional,
                                  typeUser: 1,
                                  palomita: Colors.black,
                                  onPressed: self.onPressedProveedor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              NavBarLogin()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputsLogin(
    BuildContext context,
    TextEditingController email,
    TextEditingController contrasena,
    FocusNode emailFocus,
    FocusNode contrasenaFocus,
    RxBool passwordVisibility,
    String title,
    String subtitle,
    RxBool checkboxRecordar,
    RxBool checkboxTerminos,
    String accederPage,
    String registroPage,
    AnimationController animTerminos,
    RxBool validateTerminos, {
    required Color lineColor,
    required int typeUser,
    required Color focusedColor,
    required Color palomita,
    //required int typeUser,
    required dynamic Function()? onPressed,
    required Key formKey,
  }) {
    //db.getDatosUsuarioMoney();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AutoSizeText(
              subtitle,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 10,
                  ),
              minFontSize: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
            child: VibratingWidget(
              controller: self.animUsuario,
              child: TextFormField(
                controller: email,
                focusNode: emailFocus,
                obscureText: false,
                maxLength: 40,
                decoration: InputDecoration(
                  counterText: '',
                  errorStyle: const TextStyle(
                      fontSize: 0, decoration: TextDecoration.none),
                  labelText: 'Email',
                  hintText: 'Ingresa tu email aquí...',
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF95A1AC),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lineColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: focusedColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  prefixIconColor: focusedColor,
                ),
                inputFormatters: [
                  // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9@.]'))
                  FilterEmailTextInputFormatter(),
                  FilteringTextInputFormatter.deny(RegExp('[^a-zA-Z0-9@.]')),
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
                onChanged: self.onChangeTextField,
                validator: (val) {
                  return self.validateTextField(val, self.animUsuario);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
            child: Obx(() => VibratingWidget(
                  controller: self.animContrasena,
                  child: TextFormField(
                    controller: contrasena,
                    focusNode: contrasenaFocus,
                    maxLength: 15,
                    obscureText: !self.passwordVisibility.value,
                    decoration: InputDecoration(
                      counterText: '',
                      labelText: 'Contraseña',
                      hintText: 'Ingresa tu contraseña aqui...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: const Color(0xFF95A1AC),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: lineColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: focusedColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                      prefixIcon: Icon(
                        passwordVisibility.value ? Icons.lock_open : Icons.lock,
                      ),
                      prefixIconColor: focusedColor,
                      suffixIcon: InkWell(
                        onTap: () => passwordVisibility.value =
                            !passwordVisibility.value,
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          passwordVisibility.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF95A1AC),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    onChanged: self.onChangeTextField,
                    validator: (val) =>
                        self.validateTextField(val, self.animContrasena),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: Obx(() => Checkbox(
                            value: checkboxRecordar.value,
                            onChanged: (newValue) async {
                              checkboxRecordar.value = newValue!;
                            },
                            activeColor: focusedColor,
                            checkColor: palomita,
                          )),
                    ),
                    10.0.sw,
                    Text(
                      'Recordar contraseña',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: BtnIcon(
                    onPressed: () async {
                      Get.toNamed(Routes.OLVIDE_CONTRASENA,
                          arguments: typeUser);
                    },
                    borderRadius: 12,
                    icon: Text(
                      '¿Has olvidado la contraseña?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: onPressed,
                  text: 'Acceder',
                  options: FFButtonOptions(
                    width: (MediaQuery.sizeOf(context).width * 0.4) * 0.5,
                    height: 40,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: focusedColor,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () => Get.toNamed(registroPage),
                  text: 'Registrate',
                  options: FFButtonOptions(
                    width: (MediaQuery.sizeOf(context).width * 0.4) * 0.5,
                    height: 40,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: focusedColor,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
          TerminosCondicionesDialog(
            animTerminos,
            checkboxTerminos,
            focusedColor,
            validateTerminos,
            palomita,
            paddingTop: 20,
          ),
          Divider(
            height: 2,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: FlutterFlowTheme.of(context).lineColor,
          ),
        ],
      ),
    );
  }
}
