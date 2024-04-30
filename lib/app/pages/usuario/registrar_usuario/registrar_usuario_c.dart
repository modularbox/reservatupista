// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservatu_pista/app/routes/models/geonames_model.dart';
import 'package:reservatu_pista/backend/server_node/geonames_node.dart';
import '../../../../backend/server_node/subir_image_node.dart';
import '../../../../backend/server_node/usuario_node.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/dialog/rich_alert.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:image/image.dart' as img;
import 'class/text_input_controller.dart';

class RegistrarUsuarioController extends GetxController
    with GetTickerProviderStateMixin {
  // Traer datos de la api de codigo postal Nominatim
  final apiCodigoPostal = StateRx(Rxn<bool>());
  // Api si existe el nick
  final apiExisteNick = StateRx(Rxn<bool>());
  // Controlladores para los inputs
  final tc = TextInputController();
  // Global key para el form de los inputs
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Si el form esta validado
  bool isValidateForms = false;
  // Checar si los terminos y condiciones son aceptados
  RxBool checkboxTerminos = false.obs;
  // La visibilidad de la contrasena
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  // Verificar si existe nick y mandar a la api en un tiempo determinado
  RxString nick = ''.obs;
  // Verificar si existe email y mandar a la api en un tiempo determinado
  RxString email = ''.obs;
  // Animacion de los terminos y condiciones
  late AnimationController animTerminos;
  // Guardar imagen del usuario
  final imageFile = Rxn<String>();
  // Botones para las peticiones de cambiar imagen
  late ButtonsPage btns;

  @override
  void onInit() {
    super.onInit();
    // onInitForm();
    apiExisteNick.empty();
    btns = ButtonsPage(controller: this);
    animTerminos = animVibrate(vsync: this);
    debounce(contrasenaVisibility, (_) => contrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(comprobarContrasenaVisibility,
        (_) => comprobarContrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(nick, (value) async {
      existeNick(value);
    }, time: const Duration(seconds: 1));
  }

  onInitForm() {
    tc.nombre.text = 'Nombre Fiticio';
    tc.apellidos.text = 'Apellido Fiticio';
    tc.sexo.text = 'Hombre';
    tc.dni.text = '12345678D';
    tc.lada.text = '🇪🇸 +34';
    tc.telefono.text = '999999999';
    tc.email.text = 'app@reservatupista.com';
    tc.direccion.text = 'Direccion';
    tc.codigoPostal.text = '12345';
    tc.localidad.text = 'Localidad';
    tc.provincia.text = 'Provincia';
    tc.comunidad.text = 'Comunidad';
    tc.nick.text = 'ficticio1';
    tc.contrasenaComprobar.text = '12345678';
    tc.contrasena.text = '12345678';
  }

  /// Loading Nick
  void loadingNick(String val) {
    if (val.isEmpty) {
      apiExisteNick.empty();
    } else {
      apiExisteNick.loading();
      nick.value = val;
    }
  }

  /// Existe el Nick
  void existeNick(String nick) async {
    // Muestra el estado de carga
    apiExisteNick.loading();
    try {
      final existe = await UsuarioNode().getUsuarioExisteNick(nick);
      apiExisteNick.success(existe);
    } catch (error) {
      // En caso de error, muestra el mensaje de error
      apiExisteNick.success(false);
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

  /// Registrar Usuario
  void onPressedRegistrar() async {
    if (formKey.currentState!.validate() && checkboxTerminos.value) {
      try {
        // Obtener la fecha actual
        final DateTime now = DateTime.now();
        // Formatear la fecha en el formato deseado
        final String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        String nameFoto = now.millisecondsSinceEpoch.toString();
        if (imageFile.value![0] == '@') {
          // Nombre de la foto
          nameFoto = now.millisecondsSinceEpoch.toString();
          // Subir Imagen en nodejs y copiarAssetLocal
          await subirImageNode(
              await copiarAssetAFile(imageFile.value!.substring(1)),
              destination: 'usuarios',
              nameFoto: nameFoto);
        } else {
          // Nombre de la foto
          nameFoto = now.millisecondsSinceEpoch.toString();
          // Subir Imagen en nodejs y reducir su tamano
          await subirImageNode(await imageResize(imageFile.value!),
              destination: 'usuarios', nameFoto: nameFoto);
        }

        /// Insertar los datos en SQL en la tabla
        List<int> bytes = utf8.encode(tc.contrasena.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final nombre = tc.nombre.text;
        final apellidos = tc.apellidos.text;
        final sexo = tc.sexo.text;
        final DNI = tc.dni.text;
        final lada = tc.lada.text.split(" ")[1];
        final telefono = tc.telefono.text;
        final email = tc.email.text;
        final empadronamiento = tc.empadronamiento.text;
        final comunidad_de_vecinos = tc.comunidadVecinos.text;
        final direccion = tc.direccion.text;
        final codigo_postal = tc.codigoPostal.text;
        final localidad = tc.localidad.text;
        final provincia = tc.provincia.text;
        final comunidad = tc.comunidad.text;
        final nick = tc.nick.text;
        final nivel = tc.nivel.text;
        final posicion = tc.posicion.text;
        final marca_pala = tc.pala.text;
        final modelo_pala = tc.modelo.text;
        final juegos_semana = tc.juegoPorSemana.text;
        final contrasena = hashConstrasena;
        final foto = nameFoto;
        final fecha_registro = formattedDate;

        final datosSQL = [
          nombre,
          apellidos,
          sexo,
          DNI,
          lada,
          telefono,
          email,
          empadronamiento,
          comunidad_de_vecinos,
          direccion,
          codigo_postal,
          localidad,
          provincia,
          comunidad,
          nick,
          nivel,
          posicion,
          marca_pala,
          modelo_pala,
          juegos_semana,
          contrasena,
          foto,
          fecha_registro
        ];
        await UsuarioNode().anadirUsuarioNode(datosSQL);

        /// Regresar al inicio y enviar el email.
        await Get.dialog(RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("Registro usuario"),
          alertSubtitle:
              richSubtitle("Compruebe su correo para finalizar el registro."),
          textButton: "Ir a Login",
          alertType: RichAlertType.SUCCESS,
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 0);
          },
        ));
      } catch (e) {
        print(e);
      }
    } else {
      if (!checkboxTerminos.value) {
        animTerminos.forward();
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

  Future<File> copiarAssetAFile(String path) async {
    try {
      // Especifica el path relativo del activo
      String pathAsset = 'assets/images/$path.png';
      // Obtiene el contenido del activo como bytes
      List<int> bytes = await rootBundle
          .load(pathAsset)
          .then((byteData) => byteData.buffer.asUint8List());
      // Obtiene el directorio temporal del sistema
      Directory tempDir = await getTemporaryDirectory();
      // Crea un archivo temporal con el contenido del activo
      File tempFile = File('${tempDir.path}/image_asset.png');
      return await tempFile.writeAsBytes(bytes);
    } catch (error) {
      throw ('Error al copiar el activo a un archivo: $error');
    }
  }

  String? validateTextField(BuildContext context, String? text,
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (text == null || text.isEmpty) {
      // FocusScope.of(context).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return null;
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
        tc.foto.text = 'IMG';
      }
    }
  }

  @override
  void onClose() {
    tc.unfocusNode.dispose();
    tc.nickFocusNode.dispose();
    tc.nick.dispose();
    tc.nombreFocusNode.dispose();
    tc.nombre.dispose();
    tc.apellidosFocusNode.dispose();
    tc.apellidos.dispose();
    tc.sexoFocusNode.dispose();
    tc.sexo.dispose();
    tc.dniFocusNode.dispose();
    tc.dni.dispose();
    tc.telefonoFocusNode.dispose();
    tc.telefono.dispose();
    tc.emailFocusNode.dispose();
    tc.email.dispose();
    tc.socioFocusNode.dispose();
    tc.empadronamiento.dispose();
    tc.contrasena.dispose();
    tc.contrasenaComprobar.dispose();
    super.onClose();
  }
}

class ButtonsPage {
  late RegistrarUsuarioController controller;
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

  cancel() {}
}
