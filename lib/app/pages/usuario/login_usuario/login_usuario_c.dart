import 'dart:convert';

import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import 'package:reservatu_pista/backend/server_node.dart/usuario_node.dart';
import 'package:reservatu_pista/utils/dialog/general_dialog.dart';
import '../../../../backend/server_node.dart/proveedor_node.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/database.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../../../routes/models/proveedor_model.dart';
import '../../../routes/models/usuario_model.dart';

class LoginUsuarioController extends GetxController
    with SingleGetTickerProviderMixin {
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
  RxBool checkboxValueRecordarUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueProveedor = false.obs;
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

  // Controller datos locales
  DatabaseController db = Get.find();

  @override
  void onInit() {
    super.onInit();
    // onInitForm();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminosUsuario = animVibrate(vsync: this);
    animTerminosProveedor = animVibrate(vsync: this);
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  void onInitForm() {
    emailUsuarioController.text = 'email@ficticio.com';
    emailProveedorController.text = 'email@ficticio.com';
    passwordProveedorController.text = '55r452df#';
    passwordUsuarioController.text = '55r452df#';
  }

  // Iniciar Sesion Usuario
  void onPressedUsuario() async {
    if (formUsuarioKey.currentState!.validate()) {
      bool isUserPrueba = emailUsuarioController.text == 'email@ficticio.com' &&
          passwordUsuarioController.text == '55r452df#';
      if (!checkboxValueTerminosUsuario.value && !isUserPrueba) {
        validateTerminosUsuario.value = true;
        animTerminosUsuario.forward();
      } else {
        List<int> bytes = utf8.encode(passwordUsuarioController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final result = await UsuarioNode().iniciarSesion([
          emailUsuarioController.text,
          emailUsuarioController.text,
          hashConstrasena
        ]);
        if (result is UsuarioModel) {
          db.setDatosUsuario(result);
          Get.toNamed(Routes.INICIO);
        } else if (result is MessageError) {
          Get.dialog(GeneralDialog(
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

  void onPressedProveedor() async {
    if (formProveedorKey.currentState!.validate()) {
      bool isUserPrueba =
          emailProveedorController.text == 'email@ficticio.com' &&
              passwordProveedorController.text == '55r452df#';
      if (!checkboxValueTerminosProveedor.value && !isUserPrueba) {
        validateTerminosProveedor.value = true;
        animTerminosProveedor.forward();
      } else {
        List<int> bytes = utf8.encode(passwordProveedorController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final result = await ProveedorNode()
            .iniciarSesion([emailProveedorController.text, hashConstrasena]);
        if (result is ProveedorModel) {
          db.setDatosProveedor(result);
          Get.toNamed(Routes.INICIOPROFESIONAL);
        } else if (result is MessageError) {
          Get.dialog(GeneralDialog(
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
    // Get.offAllNamed(Routes.INICIOProveedor);
    // if (formProveedorKey.currentState!.validate()) {
    //   print("Si esta validado");
    //   return;
    // }
    // if (emailUsuarioController.text == "prueba@modularbox.com" &&
    //     passwordProfesionalController.text == "2424mb9021") {
    //   if (await db.getDatosProveedor()) {
    //     Get.offAllNamed(Routes.INICIOPROFESIONAL);
    //   } else {
    //     print("No se puede iniciar Proveedor");
    //   }
    // }
    // if (!checkboxValueTerminosProveedor.value) {
    //   validateTerminosProveedor.value = true;
    //   animTerminosProveedor.forward();
    // } else {
    //   if (await db.getDatosProveedor()) {
    //     Get.offAllNamed(Routes.INICIOPROFESIONAL);
    //   } else {
    //     print("No se puede iniciar Proveedor");
    //   }
    // }
    // isValidateForms = true;
    // chec
    // !formKey.currentState!.validate();
    // Get.offAllNamed(Routes.INICIO);
    // ButtonsPage.acceder();
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
      !formKey.currentState!.validate();
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
