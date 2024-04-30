import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservatu_pista/app/routes/models/geonames_model.dart';
import 'package:reservatu_pista/backend/server_node/geonames_node.dart';
import '../../../../backend/server_node/proveedor_node.dart';
import '../../../../backend/server_node/subir_image_node.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../../../../utils/dialog/rich_alert.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import 'class/text_input_controller.dart';

class RegistrarProveedorController extends GetxController
    with GetTickerProviderStateMixin {
  // Clase para guardar los controladores de los inputs
  final tc = TextInputController();
  // Controllador para hacer scroll
  ScrollController scrollController = ScrollController();
  // Rellenar codigo iban
  bool pruebaEliminarVariable = false;
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostalFiscal = StateRx(Rx<bool?>(null));
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostal = StateRx(Rx<bool?>(null));
  // GlobalKey para validar el FORM
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Verificar si el form esta validado
  bool isValidateForms = false;
  // Obtener imagen del proveedor
  Rx<String?> imageFile = Rx<String?>(null);
  // Obtener imagen del certificado de cuenta
  Rx<String?> imageFileCertificado = Rx<String?>(null);
  // Botones para seleccionar imagenes
  late ButtonsPage btns;
  // Checkbox de terminos y condiciones
  RxBool checkboxTerminos = false.obs;
  // Visibilidad las contrasenas
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  // Animacion de terminos y condiciones
  late AnimationController animTerminos;
  // El texto se guarda en un array en codigo Iban, de acuerdo al Widget COmo el controlador
  List<String> listCodigoIban = ['', '', '', '', '', ''];

  /// Initialization and disposal methods.
  @override
  void onInit() {
    super.onInit();
    // onInitForm();
    //Inicializar los botones
    btns = ButtonsPage(controller: this);
    // Inicializar la animacion de terminos y condiciones
    animTerminos = animVibrate(vsync: this);
  }

  // Esto es para pruebas
  void onInitForm() {
    tc.tipo.text = 'Club';
    tc.cifNif.text = 'N1234567N';
    tc.direccionFiscal.text = 'Direccion';
    tc.codigoPostalFiscal.text = '123456';
    tc.localidadFiscal.text = 'Localidad';
    tc.provinciaFiscal.text = 'Provincia';
    tc.comunidadFiscal.text = 'Comunidad';
    tc.nombre.text = 'Nombre Ficticio';
    tc.apellidos.text = 'Apellido Ficticio';
    tc.fijo.text = '123456789';
    tc.email.text = 'app@reservatupista.com';
    tc.telefono.text = '123456789';
    tc.nombreComercial.text = 'Nombre Comercio';
    tc.direccion.text = 'Direccion';
    tc.codigoPostal.text = '123456';
    tc.localidad.text = 'Localidad';
    tc.provincia.text = 'Provincia';
    tc.comunidad.text = 'Comunidad';
    tc.contrasena.text = '12345678';
    tc.contrasenaComprobar.text = '12345678';
    tc.certificadoCuenta.text = 'djfhisdfh';
  }

  /// Subir los datos al servidor
  void onPressedRegistrar() async {
    // moveScroll();
    isValidateForms = true;
    if (formKey.currentState!.validate() && checkboxTerminos.value) {
      try {
        // Obtener la fecha actual
        final DateTime now = DateTime.now();

        // Formatear la fecha en el formato deseado
        final String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

        String nameFoto = now.millisecondsSinceEpoch.toString();
        // Subir Imagen en nodejs y reducir su tamano
        await subirImageNode(await imageResize(imageFile.value!),
            destination: 'proveedores', nameFoto: nameFoto);

        // Subir Imagen del certificado
        await subirImageNode(await imageResize(imageFileCertificado.value!),
            destination: 'proveedores', nameFoto: '${nameFoto}_CC');

        /// Insertar los datos en SQL en la tabla
        List<int> bytes = utf8.encode(tc.contrasena.text);
        String hashConstrasena = sha1.convert(bytes).toString();

        final datosSQLProveedor = [
          tc.tipo.text,
          tc.cifNif.text,
          listCodigoIban.join(),
          '${nameFoto}_CC',
          tc.nombre.text,
          tc.apellidos.text,
          tc.fijo.text,
          tc.email.text,
          tc.lada.text.split(" ")[1],
          tc.telefono.text,
          tc.direccionFiscal.text,
          tc.localidadFiscal.text,
          tc.provinciaFiscal.text,
          tc.comunidadFiscal.text,
          hashConstrasena,
          nameFoto,
          formattedDate,
          tc.codigoPostalFiscal.text,
        ];

        final datosSQLClub = [
          tc.nombreComercial.text,
          tc.codigoPostal.text,
          tc.direccion.text,
          tc.localidad.text,
        ];

        final datosSQLocalidades = [
          tc.codigoPostal.text,
          tc.localidad.text,
          tc.provincia.text,
          tc.comunidad.text,
        ];

        /// Subir los datos al servidor
        final result = await ProveedorNode().anadirProveedorNode(
            datosSQLProveedor, datosSQLClub, datosSQLocalidades);
        if (result.code == 2000) {
          /// Regresar al inicio y enviar el email.
          await Get.dialog(RichAlertDialog(
            //uses the custom alert dialog
            alertTitle: richTitle("Registro proveedor"),
            alertSubtitle: richSubtitle(result.message),
            textButton: "Ir a Login",
            alertType: RichAlertType.SUCCESS,
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 1);
            },
          ));
        } else {
          /// Regresar al inicio y enviar el email.
          await Get.dialog(RichAlertDialog(
            //uses the custom alert dialog
            alertTitle: richTitle("Registro proveedor"),
            alertSubtitle: richSubtitle(result.messageError()),
            textButton: "Aceptar",
            alertType: RichAlertType.WARNING,
            onPressed: () {
              Get.back();
            },
          ));
        }
      } catch (e) {
        print(e);
      }
    } else {
      if (!checkboxTerminos.value) {
        animTerminos.forward();
      }
    }
  }

  /// Existe el Codigo Postal
  void existeCodigoPostalFiscal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostalFiscal.changeStatus(RxStatusDemo.loading());
      try {
        final direccion = await GeoNamesNode().getLocalizacion(codigoPostal);
        if (direccion is GeoNamesModel) {
          tc.localidadFiscal.text = direccion.localidad;
          tc.comunidadFiscal.text = direccion.comunidad;
          tc.provinciaFiscal.text = direccion.provincia;
          apiCodigoPostalFiscal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostalFiscal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostalFiscal.change(false, RxStatusDemo.success());
      }
    } else {
      tc.localidadFiscal.text = '';
      tc.comunidadFiscal.text = '';
      tc.provinciaFiscal.text = '';
      apiCodigoPostalFiscal.changeStatus(RxStatusDemo.empty());
    }
  }

  /// Existe el Codigo Postal
  void existeCodigoPostal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostal.changeStatus(RxStatusDemo.loading());
      try {
        final direccion = await GeoNamesNode().getLocalizacion(codigoPostal);
        if (direccion is GeoNamesModel) {
          tc.localidad.text = direccion.localidad;
          tc.comunidad.text = direccion.comunidad;
          tc.provincia.text = direccion.provincia;
          apiCodigoPostal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostal.change(false, RxStatusDemo.success());
      }
    } else {
      tc.localidad.text = '';
      tc.comunidad.text = '';
      tc.provincia.text = '';
      apiCodigoPostal.changeStatus(RxStatusDemo.empty());
    }
  }

  String? validateTextFieldContrasena(
      AnimationController anim, FocusNode focusNode) {
    if (tc.contrasena.text.isEmpty) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    if (tc.contrasena.text.length < 6) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    if (tc.contrasena.text != tc.contrasenaComprobar.text) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasenaComprobar(
      AnimationController anim, FocusNode focusNode) {
    if (tc.contrasena.text.isEmpty) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return '';
    }
    if (tc.contrasenaComprobar.text.length < 6) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return 'La contraseña debe tener minimo 6 dígitos.';
    }
    if (tc.contrasena.text != tc.contrasenaComprobar.text) {
      // if (!isFocusNode) {
      //   isFocusNode = true;
      //   focusNode.requestFocus();
      // }
      anim.forward();
      return 'La contraseña no coinciden.';
    }
    return null;
  }

  Future<void> pickImage(ImageSource source, {String? path}) async {
    if (path != null) {
      imageFile.value = '@$path';
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        imageFile.value = pickedFile.path;
      }
    }
  }

  Future<void> pickImageCertificado(ImageSource source, {String? path}) async {
    if (path != null) {
      tc.certificadoCuenta.text = 'foto';
      imageFileCertificado.value = '@$path';
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        tc.certificadoCuenta.text = 'foto';
        imageFileCertificado.value = pickedFile.path;
      }
    }
  }

  /// Reducir imagen
  Future<File> imageResize(String path) async {
    // Imagen decoded
    img.Image image = img.decodeImage(File(path).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 150,
      height: 300,
    );
    // Regresar la imagen comprimida
    return File(path)
      ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 60));
  }

  String? validateTextField(BuildContext context, String? text,
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (text == null || text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return null;
  }
}

class ButtonsPage {
  late RegistrarProveedorController controller;
  ButtonsPage({required this.controller});
  camera() {
    controller.pickImage(ImageSource.camera);
    Get.back();
  }

  galeria() {
    controller.pickImage(ImageSource.gallery);
    Get.back();
  }

  imageLocal(String path) {
    controller.pickImage(ImageSource.camera, path: path);
    Get.back();
  }

  cameraCertificado() {
    controller.pickImageCertificado(ImageSource.camera);
    Get.back();
  }

  galeriaCertificado() {
    controller.pickImageCertificado(ImageSource.gallery);
    Get.back();
  }

  imageLocalCertificado(String path) {
    controller.pickImageCertificado(ImageSource.camera, path: path);
    Get.back();
  }

  cancel() {}
}
