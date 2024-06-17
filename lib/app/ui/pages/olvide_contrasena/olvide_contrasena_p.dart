import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/ui/pages/olvide_contrasena/widgets/codigo_otp.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/app_bar_login_widget.dart';
import '../../../../components/navbar_login.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import 'olvide_contrasena_c.dart';

class OlvideContrasenaPage extends StatefulWidget {
  const OlvideContrasenaPage({super.key});

  @override
  State<OlvideContrasenaPage> createState() => _OlvideContrasenaPageState();
}

class _OlvideContrasenaPageState extends State<OlvideContrasenaPage> {
  final Color colorProfesional = const Color(0xFF46EF98);
  final Color colorUsuario = Colores.usuario.primary;
  OlvideContrasenaController self = Get.find();
  // Definimos la animacion que viene directamente del controllador
  get anim => animVibrate(vsync: self);

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
      backgroundColor: LightModeTheme().primaryText,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [LightModeTheme().tertiary, LightModeTheme().accent4],
              stops: const [0, 1],
              begin: const AlignmentDirectional(0, -1),
              end: const AlignmentDirectional(0, 1),
            ),
          ),
          child: ResponsiveWeb(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBarLoginWidget(),
                    SizedBox(
                      height: 450,
                      child: PageView(
                        controller: self.pageViewController,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          buildForm(),
                          buildFormOTP(),
                          buildFormContrasena()
                        ],
                      ),
                    )
                  ],
                ),
                const NavBarLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Column(
      children: [
        10.0.sh,
        Text(
          'Recuperar Contraseña',
          style: LightModeTheme().headlineLarge.copyWith(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
              'Por favor, ingresa tu correo para iniciar el proceso de restablecimiento. ',
              style: LightModeTheme().bodyLarge.copyWith(fontSize: 15)),
        ),
        10.0.sh,
        Form(key: self.formKey0, child: _buildInput()),
        10.0.sh,
        Obx(mostrarText),
        Obx(buildBotones),
      ],
    );
  }

  Widget mostrarText() {
    return Visible(
      isVisible: self.stateEmail.value,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          '''Le enviaremos un email para restablecer la contraseña.
    Por favor si pasado unos minutos no lo recibe, revise la carpeta de spam de su correo.
              ''',
          textAlign: TextAlign.center,
          style: LightModeTheme()
              .bodyMedium
              .copyWith(fontStyle: FontStyle.italic, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: TextFormField(
        controller: self.emailController,
        obscureText: false,
        maxLength: 40,
        decoration: InputDecoration(
          counterText: '',
          errorStyle:
              const TextStyle(fontSize: 0, decoration: TextDecoration.none),
          labelText: 'Email',
          hintText: 'Ingresa tu email aquí...',
          hintStyle: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: const Color(0xFF95A1AC),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: self.lineColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: self.focusedColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightModeTheme().error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LightModeTheme().error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: LightModeTheme().secondaryBackground,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          prefixIcon: const Icon(
            Icons.person,
          ),
          prefixIconColor: self.lineColor,
        ),
        style: LightModeTheme().bodyMedium,
        validator: self.validatorEmail,
      ),
    );
  }

  Widget buildBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnAccederRegistrar(
          onPressed: self.resendSendEmail,
          color: self.lineColor,
          borderColor: self.stateEmail.value ? Colors.black : self.lineColor,
          textButton: self.stateEmail.value ? 'Siguiente' : 'Recuperar',
        ),
        BtnAccederRegistrar(
          onPressed: Get.back,
          color: self.lineColor,
          borderColor: Colors.transparent,
          textButton: 'Cancelar',
        )
      ].map<Widget>((e) => buildBtn(e)).toList(),
    );
  }

  Widget buildBtn(BtnAccederRegistrar e) {
    return BtnIcon(
      onPressed: e.onPressed,
      icon: Text(e.textButton,
          style: LightModeTheme().bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: LightModeTheme().tertiary,
              fontSize: 16)),
      height: 45,
      padding:
          EdgeInsets.symmetric(horizontal: context.w < 350.0 ? 20.0 : 40.0),
      fillColor: e.color,
      borderColor: e.borderColor,
      borderWidth: 3,
      borderRadius: 12.0,
    );
  }

  Widget buildFormOTP() {
    return Column(
      children: [
        10.0.sh,
        Text(
          'Verificar Código',
          style: LightModeTheme().headlineLarge.copyWith(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Por favor, ingresa tu código de verificación. ',
              style: LightModeTheme().bodyLarge.copyWith(fontSize: 15)),
        ),
        10.0.sh,
        Form(key: self.formKeyOTP, child: const CodigoOTP()),
        10.0.sh,
        Obx(buildMessageError),
        20.0.sh,
        buildBotonesOTP(),
      ],
    );
  }

  Widget buildFormContrasena() {
    return Form(
      key: self.formKeyContrasena,
      child: Column(
        children: [
          10.0.sh,
          Text(
            'Restablecer Contraseña',
            style: LightModeTheme().headlineLarge.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
                'Por favor, ingresa tu nueva contraseña a continuación para completar el proceso de restablecimiento. ',
                style: LightModeTheme().bodyLarge.copyWith(fontSize: 15)),
          ),
          10.0.sh,
          ...buildListContrasena(),
          20.0.sh,
          buildBotonesContrasena(),
        ],
      ),
    );
  }

  Widget buildMessageError() {
    return Visible(
      isVisible: self.validateOTP,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Lo siento, el código de verificación que ingresaste no es válido. Por favor, verifica que has introducido el código correctamente',
          style: LightModeTheme()
              .bodyLarge
              .copyWith(color: Colores.rojo, fontSize: 18),
        ),
      ),
    );
  }

  /// Contruir los inputs de contrasena
  List<Widget> buildListContrasena() {
    return [
      buildInputContrasena(
          anim: self.animContrasena,
          labelText: 'Contraseña',
          textEditingController: self.tcContrasena,
          visibility: self.contrasenaVisibility,
          validator: self.validateTextFieldContrasena),
      buildInputContrasena(
          anim: self.animContrasenaComprobar,
          labelText: 'Comprobar Contraseña',
          textEditingController: self.tcContrasenaComprobar,
          visibility: self.comprobarContrasenaVisibility,
          validator: self.validateTextFieldContrasenaComprobar),
    ];
  }

  Widget buildInputContrasena(
      {required String labelText,
      required AnimationController anim,
      required RxBool visibility,
      required TextEditingController textEditingController,
      required String? Function(AnimationController, FocusNode) validator}) {
    return Obx(() => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
        child: VibratingWidget(
          controller: anim,
          child: TextFormField(
              controller: textEditingController,
              maxLength: 15,
              obscureText: !visibility.value,
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 12),
                prefixIcon: Icon(
                  visibility.value ? Icons.lock_open : Icons.lock,
                ),
                suffixIcon: InkWell(
                  onTap: visibility.toggle,
                  child: Icon(
                    visibility.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colores.usuario.primary,
                    size: 22,
                  ),
                ),
                counterText: '',
                labelText: labelText,
                hintText: 'Ingresa tu contraseña aquí...',
                hintStyle: LightModeTheme().bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: const Color(0xFF95A1AC),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: self.lineColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: self.focusedColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: LightModeTheme().error,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: LightModeTheme().error,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: LightModeTheme().secondaryBackground,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                prefixIconColor: self.lineColor,
              ),
              style: LightModeTheme().bodyMedium,
              validator: (val) => validator(anim, FocusNode())),
        )));
  }

  Widget buildBotonesOTP() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnAccederRegistrar(
          onPressed: Get.back,
          color: self.lineColor,
          borderColor: Colors.transparent,
          textButton: 'Cancelar',
        )
      ].map<Widget>((e) => buildBtn(e)).toList(),
    );
  }

  Widget buildBotonesCambiarContrasena() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnAccederRegistrar(
          onPressed: self.cambiarContrasena,
          color: self.lineColor,
          borderColor: Colors.transparent,
          textButton: 'Verificar',
        ),
        BtnAccederRegistrar(
          onPressed: Get.back,
          color: self.lineColor,
          borderColor: Colors.transparent,
          textButton: 'Cancelar',
        )
      ].map<Widget>((e) => buildBtn(e)).toList(),
    );
  }

  Widget buildBotonesContrasena() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnAccederRegistrar(
          onPressed: self.cambiarContrasena,
          color: self.lineColor,
          borderColor: Colors.transparent,
          textButton: 'Confirmar',
        ),
        BtnAccederRegistrar(
          onPressed: Get.back,
          color: self.lineColor,
          borderColor: Colors.transparent,
          textButton: 'Cancelar',
        )
      ].map<Widget>((e) => buildBtn(e)).toList(),
    );
  }
}

class BtnAccederRegistrar {
  final void Function()? onPressed;
  final String textButton;
  final Color color;
  final Color borderColor;
  BtnAccederRegistrar(
      {this.onPressed,
      required this.textButton,
      required this.color,
      required this.borderColor});
}
