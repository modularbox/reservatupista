import 'dart:convert';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/models/message_error.dart';
import 'package:reservatu_pista/backend/server_node.dart/usuario_node.dart';
import 'package:reservatu_pista/utils/dialog/general_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../backend/server_node.dart/proveedor_node.dart';
import '../../../../backend/storage/storage.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/database.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../../../routes/models/proveedor_model.dart';
import '../../../routes/models/usuario_model.dart';

class LoginUsuarioController extends GetxController
    with SingleGetTickerProviderMixin {
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
  RxBool checkboxValueRecordarUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueRecordarProveedor = false.obs;
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

  /// Obtener los datos si el usuario guardo la contrasena
  late Storage storagePasswordUsuario;
  late Storage storagePasswordProveedor;
  late Storage storageDineroTotalUsuario;
  late Storage storageIdUsuario;
  late Storage storageIdProveedor;
  late Storage storageTokenUsuario;
  late Storage storageTokenProveedor;

  @override
  void onInit() async {
    super.onInit();
    onInitForm();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminosUsuario = animVibrate(vsync: this);
    animTerminosProveedor = animVibrate(vsync: this);
    recordarContrasena();
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  /// Verificar si el usuario o proveedor a solicitado recordar la contrasena
  void recordarContrasena() async {
    try {
      final getStorage = await SharedPreferences.getInstance();
      // Guardar archivos temporales
      storagePasswordUsuario = Storage(TypeStorage.passwordUsuario, getStorage);
      storagePasswordProveedor =
          Storage(TypeStorage.passwordProveedor, getStorage);
      storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
      storageIdProveedor = Storage(TypeStorage.idProveedor, getStorage);
      storageTokenUsuario = Storage(TypeStorage.tokenUsuario, getStorage);
      storageTokenProveedor = Storage(TypeStorage.tokenProveedor, getStorage);
      storageDineroTotalUsuario = Storage(TypeStorage.dineroTotal, getStorage);

      // Usuario
      final passwordUsuario = storagePasswordUsuario.read();
      if (storagePasswordUsuario.exitsValue()) {
        passwordUsuarioController.text = passwordUsuario;
        checkboxValueRecordarUsuario.value = true;
      }
      // Proveedor
      final passwordProveedor = storagePasswordProveedor.read();
      if (storagePasswordProveedor.exitsValue()) {
        passwordProveedorController.text = passwordProveedor;
        checkboxValueRecordarProveedor.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  // Pruebas para la app
  void onInitForm() {
    emailUsuarioController.text = 'app@reservatupista.com';
    emailProveedorController.text = 'app@reservatupista.com';
    passwordProveedorController.text = '12345678';
    passwordUsuarioController.text = '12345678';
  }

  // Iniciar Sesion Usuario
  void onPressedUsuario() async {
    if (formUsuarioKey.currentState!.validate()) {
      bool isUserPrueba =
          emailUsuarioController.text == 'app@reservatupista.com' &&
              passwordUsuarioController.text == '12345678';
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
          final storage = await SharedPreferences.getInstance();
          // Si el usuario existe guardamos el id para futuras peticiones
          storageIdUsuario.write(result.idUsuario);
          // Guardar el token
          storageTokenUsuario.write(result.token);
          // Guardar el token
          storageDineroTotalUsuario.write(result.dineroTotal);
          storage.fotoUsuario.write(result.foto);
          // Si es recordar contrasena
          if (checkboxValueRecordarUsuario.value) {
            await storagePasswordUsuario.write(passwordUsuarioController.text);
          } else {
            storagePasswordUsuario.remove();
          }
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

  // Iniciar sesion P
  void onPressedProveedor() async {
    if (formProveedorKey.currentState!.validate()) {
      bool isUserPrueba =
          emailProveedorController.text == 'app@reservatupista.com' &&
              passwordProveedorController.text == '12345678';
      if (!checkboxValueTerminosProveedor.value && !isUserPrueba) {
        validateTerminosProveedor.value = true;
        animTerminosProveedor.forward();
      } else {
        List<int> bytes = utf8.encode(passwordProveedorController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final result = await ProveedorNode()
            .iniciarSesion([emailProveedorController.text, hashConstrasena]);
        if (result is ProveedorModel) {
          // Si el usuario existe guardamos el id para futuras peticiones
          storageIdProveedor.write(result.idProveedor);
          // Guardar el token
          storageTokenProveedor.write(result.token);
          // Si es recordar contrasena
          if (checkboxValueRecordarProveedor.value) {
            storagePasswordProveedor.write(passwordProveedorController.text);
          } else {
            storagePasswordProveedor.remove();
          }
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
