import 'dart:convert';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/widgets/alert_eliminar_cuenta_p.dart';
import 'package:reservatu_pista/backend/server_node/usuario_node.dart';
import 'package:reservatu_pista/utils/dialog/change_dialog_general.dart';
import 'package:reservatu_pista/utils/dialog/general_dialog.dart';
import '../../../../backend/server_node/proveedor_node.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../../../routes/models/proveedor_model.dart';
import '../../../routes/models/usuario_model.dart';

class EliminarCuentaController extends GetxController
    with GetTickerProviderStateMixin {
  /// Obtener la pagina 0 Usuario, 1 Proveedor
  int? initialPage = Get.arguments;
  PageController pageViewController = PageController(
      initialPage: Get.arguments == null ? 0 : Get.arguments as int);
  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode emailUsuarioFocusNode = FocusNode();
  TextEditingController emailUsuarioController = TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordUsuarioFocusNode = FocusNode();
  TextEditingController passwordUsuarioController = TextEditingController();
  // State field(s) for email widget.
  FocusNode emailProveedorFocusNode = FocusNode();
  TextEditingController emailProveedorController = TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordProveedorFocusNode = FocusNode();
  TextEditingController passwordProveedorController = TextEditingController();
  // Keys para el formulario de usuario y de proveedor
  GlobalKey<FormState> formUsuarioKey = GlobalKey<FormState>();
  GlobalKey<FormState> formProveedorKey = GlobalKey<FormState>();

  // Controlador para ver el password
  RxBool passwordProveedorVisibility = false.obs;
  RxBool passwordVisibility = false.obs;
  String? Function(BuildContext, String?)? passwordProveedorControllerValidator;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxEliminarCuenta = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosProveedor = false.obs;

  // Validar los terminos y condiciones.
  RxBool validateTerminosUsuario = false.obs;
  RxBool validateTerminosProveedor = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;

  /// Animations
  late AnimationController animUsuario;
  late AnimationController animContrasena;
  late AnimationController animTerminosUsuario;
  late AnimationController animTerminosProveedor;

  String id = '';
  String token = '';

  /// Obtener los parametros de la url

  // Obtener los parámetros de la URL
  Map<String, String> queryParams = Uri.base.queryParameters;

  @override
  void onInit() async {
    super.onInit();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminosUsuario = animVibrate(vsync: this);
    animTerminosProveedor = animVibrate(vsync: this);

    // onInitForm();
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (queryParams['id'] != null &&
        queryParams['user'] != null &&
        queryParams['token'] != null &&
        queryParams['email'] != null) {
      //Example id=1&user=4&token=32434dassa&email=jfdbsi233#53fjsdf
      token = queryParams['token']!;
      id = queryParams['id']!;
      Get.dialog(AlertEliminarCuentaWidget(
          user: int.parse(queryParams['user']!), email: queryParams['email']!));
    }
  }

  // Pruebas para la app
  void onInitForm() {
    emailUsuarioController.text = 'app@reservatupista.com';
    emailProveedorController.text = 'app@reservatupista.com';
    passwordUsuarioController.text = '12345678';
  }

  void onEliminarUser(int user) async {
    // Usuario 0, Proveedor 1
    // Llamar a la api de reservatupista
    final result = await UsuarioNode()
        .delete(id, token, user == 0 ? 'usuario' : 'proveedor');
    if (result is MessageError) {
      if (result.code == 2000) {
        Get.dialog(ChangeDialogGeneral(
          alertTitle: richTitle("Eliminar Cuenta"),
          alertSubtitle: richSubtitle(result.messageError()),
          textButton: "Cerrar",
          alertType: TypeGeneralDialog.SUCCESS,
          onPressed: () => Get.offAllNamed(Routes.LOGIN_USUARIO),
        ));
      } else {
        Get.dialog(ChangeDialogGeneral(
          alertTitle: richTitle("Eliminar Cuenta"),
          alertSubtitle: richSubtitle(result.messageError()),
          textButton: "Cerrar",
          alertType: TypeGeneralDialog.WARNING,
          onPressed: () => {Get.back(), Get.back(), Get.back()},
        ));
      }
    }
  }

  // Iniciar Sesion Usuario
  void onPressedUsuario() async {
    if (formUsuarioKey.currentState!.validate()) {
      bool isUserPrueba =
          emailUsuarioController.text == 'app@reservatupista.com' &&
              passwordUsuarioController.text == '12345678';
      if (isUserPrueba) {
        Get.dialog(ChangeDialogGeneral(
          alertTitle: richTitle("Login Proveedor"),
          alertSubtitle:
              richSubtitle('No es posible eliminar una cuenta privada.'),
          textButton: "Cerrar",
          alertType: TypeGeneralDialog.WARNING,
          onPressed: () => Get.back(),
        ));
        return;
      }
      if (!checkboxValueTerminosUsuario.value && !isUserPrueba) {
        validateTerminosUsuario.value = true;
        animTerminosUsuario.forward();
      } else {
        // Encriptar contrasena
        List<int> bytes = utf8.encode(passwordUsuarioController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        // Llamar a la api de reservatupista
        final result = await UsuarioNode().iniciarSesion([
          emailUsuarioController.text,
          emailUsuarioController.text,
          hashConstrasena
        ]);
        if (result is UsuarioModel) {
          id = result.idUsuario.toString();
          token = result.token;
          Get.dialog(AlertEliminarCuentaWidget(
            user: 0,
            email: emailUsuarioController.text,
          ));
        } else if (result is MessageError) {
          Get.dialog(ChangeDialogGeneral(
            alertTitle: richTitle("Login Usuario"),
            alertSubtitle: richSubtitle(result.messageError()),
            textButton: "Cerrar",
            alertType: TypeGeneralDialog.WARNING,
            onPressed: () => Get.back(),
          ));
        }
      }
      isValidateForms = true;
    }
  }

  // Iniciar sesion P
  void onPressedProveedor() async {
    if (formProveedorKey.currentState!.validate()) {
      bool isUserPrueba =
          emailProveedorController.text == 'app@reservatupista.com' &&
              passwordProveedorController.text == '12345678';
      if (isUserPrueba) {
        Get.dialog(ChangeDialogGeneral(
          alertTitle: richTitle("Login Proveedor"),
          alertSubtitle:
              richSubtitle('No es posible eliminar una cuenta privada.'),
          textButton: "Cerrar",
          alertType: TypeGeneralDialog.WARNING,
          onPressed: () => Get.back(),
        ));
        return;
      }
      if (!checkboxValueTerminosProveedor.value && !isUserPrueba) {
        validateTerminosProveedor.value = true;
        animTerminosProveedor.forward();
      } else {
        List<int> bytes = utf8.encode(passwordProveedorController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final result = await ProveedorNode()
            .iniciarSesion([emailProveedorController.text, hashConstrasena]);
        if (result is ProveedorModel) {
          id = result.idProveedor.toString();
          token = result.token;
          Get.dialog(AlertEliminarCuentaWidget(
            user: 1,
            email: emailProveedorController.text,
          ));
        } else if (result is MessageError) {
          Get.dialog(ChangeDialogGeneral(
            alertTitle: richTitle("Login Proveedor"),
            alertSubtitle: richSubtitle(result.messageError()),
            textButton: "Cerrar",
            alertType: TypeGeneralDialog.WARNING,
            onPressed: () => Get.back(),
          ));
        }
      }
      isValidateForms = true;
    }
  }

  String? validateTextField(String? text, AnimationController anim) {
    if (text!.isEmpty) {
      anim.forward();
      return '';
    }
    return null;
  }

  void onChangeTextField(String text) {
    if (isValidateForms && text.isNotEmpty) {
      isValidateForms = false;
      // !formKey.currentState!.validate();
    }
  }

  @override
  void dispose() {
    // Limpiar y liberar recursos
    unfocusNode.dispose();
    emailUsuarioFocusNode.dispose();
    emailUsuarioController.dispose();
    passwordUsuarioFocusNode.dispose();
    passwordUsuarioController.dispose();
    emailProveedorFocusNode.dispose();
    emailProveedorController.dispose();
    passwordProveedorFocusNode.dispose();
    passwordProveedorController.dispose();
    super.dispose();
  }
}
