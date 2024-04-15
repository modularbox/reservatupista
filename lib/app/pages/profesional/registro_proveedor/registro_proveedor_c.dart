import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservatu_pista/app/routes/models/geonames_model.dart';
import 'package:reservatu_pista/backend/server_node/geonames_node.dart';
import 'package:reservatu_pista/backend/server_node/proveedor_node.dart';
import 'package:reservatu_pista/backend/server_node/subir_image_node.dart';
// import '../../../../backend/apis/direccion_nominatim.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../../../../utils/dialog/rich_alert.dart';
import '../../../../utils/loader/color_loader.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/database.dart';
import '../../../widgets/text_inputters/inputter_registro.dart';

class RegistroProveedorController extends GetxController
    with SingleGetTickerProviderMixin {
  /// ELiminar esyas variables
  bool pruebaEliminarVariable = true;

  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostalFiscal = StateRx(Rx<bool?>(null));
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostal = StateRx(Rx<bool?>(null));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;
  Rx<String?> imageFile = Rx<String?>(null);
  Rx<String?> imageFileCertificado = Rx<String?>(null);
  late ButtonsPage btns;
  bool isFocusNode = false;
  Map<String, String> saveData = {};
  DatabaseController db = Get.find();
  RxBool checkboxTerminos = false.obs;
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  RxBool validateCheckbox = false.obs;
  late AnimationController animTerminos;

  TextEditingController tipoController = TextEditingController();
  TextEditingController cifNifController = TextEditingController();
  TextEditingController direccionFiscalController = TextEditingController();
  TextEditingController codigoPostalFiscalController = TextEditingController();
  TextEditingController localidadFiscalController = TextEditingController();
  TextEditingController provinciaFiscalController = TextEditingController();
  TextEditingController comunidadFiscalController = TextEditingController();
  TextEditingController codigoIbanController = TextEditingController();
  TextEditingController certificadoCuentaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController fijoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ladaController =
      TextEditingController(text: '🇪🇸 +34');
  TextEditingController telefonoController = TextEditingController();
  TextEditingController nombreComercialController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController codigoPostalController = TextEditingController();
  TextEditingController localidadController = TextEditingController();
  TextEditingController provinciaController = TextEditingController();
  TextEditingController comunidadController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController fechaRegistroController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController contrasenaComprobarController = TextEditingController();
  // El texto se guarda en un array en codigo Iban, de acuerdo al Widget
  List<String> listCodigoIban = ['', '', '', '', '', ''];

  /// Initialization and disposal methods.
  @override
  void onInit() {
    super.onInit();
    // onInitForm();
    btns = ButtonsPage(controller: this);
    animTerminos = animVibrate(vsync: this);
  }

  void onInitForm() {
    tipoController.text = 'Club';
    cifNifController.text = 'N1234567N';
    direccionFiscalController.text = 'Direccion';
    codigoPostalFiscalController.text = '123456';
    localidadFiscalController.text = 'Localidad';
    provinciaFiscalController.text = 'Provincia';
    comunidadFiscalController.text = 'Comunidad';
    nombreController.text = 'Nombre Ficticio';
    apellidosController.text = 'Apellido Ficticio';
    fijoController.text = '123456789';
    emailController.text = 'ficticio@hotamil.com';
    telefonoController.text = '123456789';
    nombreComercialController.text = 'Nombre Comercio';
    direccionController.text = 'Direccion';
    codigoPostalController.text = '123456';
    localidadController.text = 'Localidad';
    provinciaController.text = 'Provincia';
    comunidadController.text = 'Comunidad';
    contrasenaController.text = '12345678';
    contrasenaComprobarController.text = '12345678';
  }

  /// Existe el Codigo Postal
  void existeCodigoPostalFiscal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostalFiscal.changeStatus(RxStatusDemo.loading());
      try {
        final direccion = await GeoNamesNode().getLocalizacion(codigoPostal);
        if (direccion is GeoNamesModel) {
          localidadFiscalController.text = direccion.localidad;
          comunidadFiscalController.text = direccion.comunidad;
          provinciaFiscalController.text = direccion.provincia;
          apiCodigoPostalFiscal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostalFiscal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostalFiscal.change(false, RxStatusDemo.success());
      }
    } else {
      localidadController.text = '';
      comunidadController.text = '';
      provinciaController.text = '';
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
          localidadController.text = direccion.localidad;
          comunidadController.text = direccion.comunidad;
          provinciaController.text = direccion.provincia;
          apiCodigoPostal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostal.change(false, RxStatusDemo.success());
      }
    } else {
      localidadController.text = '';
      comunidadController.text = '';
      provinciaController.text = '';
      apiCodigoPostal.changeStatus(RxStatusDemo.empty());
    }
  }

  DatosFacturacionTextField datosFacturacion() => DatosFacturacionTextField(
        tipo: PropertiesTextField(
            labelText: 'Tipo',
            controller: tipoController,
            anim: animVibrate(vsync: this),
            maxLength: 20,
            isSelect: true,
            listSelect: ['Club', 'Ayuntamiento', 'Comunidad', 'Asociación']),
        cifNif: PropertiesTextField(
            labelText: 'CIF/NIF',
            controller: cifNifController,
            anim: animVibrate(vsync: this),
            maxLength: 9,
            onValidate: (val) => val!.length < 9 ? '' : null,
            inputFormatters: [SinEspaciosInputFormatter(), CIFNIFFormatter()]),
        direccionFiscal: PropertiesTextField(
          labelText: 'Dirección fiscal',
          controller: direccionFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
          onValidate: (val) => val!.length < 4 ? '' : null,
        ),
        cp: PropertiesTextField(
            labelText: 'Código Postal',
            controller: codigoPostalFiscalController,
            anim: animVibrate(vsync: this),
            maxLength: 5,
            keyboardType: TextInputType.number,
            suffixIcon: apiCodigoPostalFiscal.obx(
                (state) => state!
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                onLoading: SizedBox(
                    width: 20,
                    child: ColorLoader(
                      radius: 8,
                      padding: const EdgeInsets.only(right: 1),
                    )),
                onEmpty: const SizedBox.shrink()),
            onChange: (val) async {
              existeCodigoPostalFiscal(val);
            },
            onValidate: (val) => val!.length < 5 ? '' : null,
            inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()]),
        localidad: PropertiesTextField(
          labelText: 'Localidad',
          controller: localidadFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
        provincia: PropertiesTextField(
          labelText: 'Provincia',
          controller: provinciaFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
        comunidad: PropertiesTextField(
          labelText: 'Comunidad',
          controller: comunidadFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
      );
  DatosPagoTextField datosPago() => DatosPagoTextField(
        numeroCuenta: PropertiesTextField(
            labelText: 'Número de cuenta',
            controller: codigoIbanController,
            anim: animVibrate(vsync: this),
            maxLength: 20,
            isSelect: true,
            listSelect: ['Club', 'Ayuntamiento', 'Comunidad', 'Asociación']),
        certificadoCuenta: PropertiesTextField(
          labelText: 'Certificado de cuenta',
          controller: certificadoCuentaController,
          anim: animVibrate(vsync: this),
          maxLength: 20,
          isImage: true,
        ),
      );
  DatosContactoTextField datosContacto() => DatosContactoTextField(
        nombre: PropertiesTextField(
            labelText: 'Nombre',
            controller: nombreController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            onValidate: (val) => val!.length < 3 ? '' : null,
            inputFormatters: [SoloLetras()]),
        apellidos: PropertiesTextField(
            labelText: 'Apellidos',
            controller: apellidosController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            onValidate: (val) => val!.length < 3 ? '' : null,
            inputFormatters: [SoloLetras()]),
        fijo: PropertiesTextField(
            labelText: 'Fijo',
            controller: fijoController,
            anim: animVibrate(vsync: this),
            keyboardType: TextInputType.number,
            maxLength: 9,
            onValidate: (val) => val!.length < 9 ? '' : null,
            inputFormatters: [SoloNumeros()]),
        lada: PropertiesTextField(
          labelText: '',
          controller: ladaController,
          isSelect: true,
          listSelect: ['🇪🇸 +34', '🇵🇹 +351', '🇲🇫 +33', '🇲🇽 +52'],
          anim: animVibrate(vsync: this),
          maxLength: 8,
        ),
        movil: PropertiesTextField(
            labelText: 'Telefono',
            controller: telefonoController,
            anim: animVibrate(vsync: this),
            keyboardType: TextInputType.number,
            maxLength: 9,
            onValidate: (val) => val!.length < 9 ? '' : null,
            inputFormatters: [SoloNumeros()]),
        email: PropertiesTextField(
            labelText: 'Email',
            controller: emailController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [SinEspaciosInputFormatter()],
            onValidate: (val) {
              // Utilizar una expresión regular para validar el formato de correo electrónico
              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(val!)) {
                return '';
              }
              return null;
            }),
      );
  List<PropertiesTextField> datosUbicacion() => DatosUbicacionTextField(
        nombreComercial: PropertiesTextField(
          labelText: 'Nombre comercial',
          controller: nombreComercialController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
          onValidate: (val) => val!.length < 3 ? '' : null,
        ),
        direccion: PropertiesTextField(
          labelText: 'Dirección',
          controller: direccionController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
          onValidate: (val) => val!.length < 4 ? '' : null,
        ),
        cp: PropertiesTextField(
            labelText: 'Código Postal',
            controller: codigoPostalController,
            anim: animVibrate(vsync: this),
            maxLength: 5,
            keyboardType: TextInputType.number,
            suffixIcon: apiCodigoPostal.obx(
                (state) => state!
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                onLoading: SizedBox(
                    width: 20,
                    child: ColorLoader(
                      radius: 8,
                      padding: const EdgeInsets.only(right: 1),
                    )),
                onEmpty: const SizedBox.shrink()),
            onValidate: (val) => val!.length < 5 ? '' : null,
            onChange: (val) => existeCodigoPostal(val),
            inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()]),
        localidad: PropertiesTextField(
          labelText: 'Localidad',
          controller: localidadController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
        ),
        provincia: PropertiesTextField(
          labelText: 'Provincia',
          controller: provinciaController,
          anim: animVibrate(vsync: this),
          maxLength: 30,
        ),
        comunidad: PropertiesTextField(
          labelText: 'Comunidad',
          controller: comunidadController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
      ).listProperty();
  DatosContrasenaTextField datosContrasena() => DatosContrasenaTextField.init(
      tick: this,
      contrasenaController2: contrasenaComprobarController,
      contrasenaController: contrasenaController);

  String? validateTextFieldContrasena(
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (contrasenaController.text.isEmpty) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (contrasenaController.text.length < 6) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (contrasenaController.text != contrasenaComprobarController.text) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasenaComprobar(
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (contrasenaController.text.isEmpty) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (contrasenaComprobarController.text.length < 6) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return 'La contraseña debe tener minimo 6 dígitos.';
    }
    if (contrasenaController.text != contrasenaComprobarController.text) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
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
      certificadoCuentaController.text = 'foto';
      imageFileCertificado.value = '@$path';
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        certificadoCuentaController.text = 'foto';
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

  void onPressedRegistrar() async {
    isValidateForms = true;
    isFocusNode = false;
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
        List<int> bytes = utf8.encode(contrasenaController.text);
        String hashConstrasena = sha1.convert(bytes).toString();

        final datosSQLProveedor = [
          tipoController.text,
          cifNifController.text,
          listCodigoIban.join(),
          '${nameFoto}_CC',
          nombreController.text,
          apellidosController.text,
          fijoController.text,
          emailController.text,
          ladaController.text.split(" ")[1],
          telefonoController.text,
          direccionFiscalController.text,
          localidadFiscalController.text,
          provinciaFiscalController.text,
          comunidadFiscalController.text,
          hashConstrasena,
          nameFoto,
          formattedDate,
          codigoPostalFiscalController.text,
        ];

        final datosSQLClub = [
          nombreComercialController.text,
          codigoPostalController.text,
          direccionController.text,
          localidadController.text,
          provinciaController.text,
          comunidadController.text,
        ];

        /// Subir los datos al servidor
        final result = await ProveedorNode()
            .anadirProveedorNode(datosSQLProveedor, datosSQLClub);
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
        validateCheckbox.value = true;
        animTerminos.forward();
      }
    }
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
  late RegistroProveedorController controller;
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

  // ButtonsPage.termsAndConditions() {
  //   Get.dialog(const TermConditions());
  // }
  cancel() {}
}

class PropertiesTextField {
  PropertiesTextField(
      {required this.labelText,
      required this.anim,
      required this.maxLength,
      required this.controller,
      this.keyboardType,
      this.isSelect = false,
      this.isImage = false,
      this.listSelect,
      this.onValidate,
      this.onChange,
      this.inputFormatters,
      this.suffixIcon});
  final String labelText;
  final bool isSelect;
  final bool isImage;
  final AnimationController anim;
  final int maxLength;
  final List<String>? listSelect;
  final TextInputType? keyboardType;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onValidate;
  final void Function(String)? onChange;

  String? validateTextField(String? text) {
    if (text == null || text.isEmpty) {
      FocusScope.of(Get.context!).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return onValidate == null ? null : onValidate!(text);
  }
}

class DatosFacturacionTextField {
  DatosFacturacionTextField({
    required this.cifNif,
    required this.tipo,
    required this.direccionFiscal,
    required this.cp,
    required this.localidad,
    required this.provincia,
    required this.comunidad,
  });
  final PropertiesTextField cifNif;
  final PropertiesTextField tipo;
  final PropertiesTextField direccionFiscal;
  final PropertiesTextField cp;
  final PropertiesTextField localidad;
  final PropertiesTextField provincia;
  final PropertiesTextField comunidad;
  List<PropertiesTextField> listProperty() {
    return [tipo, cifNif, direccionFiscal, cp, localidad, provincia, comunidad];
  }
}

class DatosPagoTextField {
  DatosPagoTextField({
    required this.numeroCuenta,
    required this.certificadoCuenta,
  });
  final PropertiesTextField numeroCuenta;
  final PropertiesTextField certificadoCuenta;
  List<PropertiesTextField> listProperty() {
    return [
      numeroCuenta,
      certificadoCuenta,
    ];
  }
}

class DatosContactoTextField {
  DatosContactoTextField({
    required this.nombre,
    required this.apellidos,
    required this.fijo,
    required this.lada,
    required this.movil,
    required this.email,
  });
  final PropertiesTextField nombre;
  final PropertiesTextField apellidos;
  final PropertiesTextField fijo;
  final PropertiesTextField movil;
  final PropertiesTextField lada;
  final PropertiesTextField email;
  List<PropertiesTextField> listProperty() {
    return [nombre, apellidos, fijo, email];
  }
}

class DatosUbicacionTextField {
  DatosUbicacionTextField({
    required this.nombreComercial,
    required this.direccion,
    required this.cp,
    required this.localidad,
    required this.provincia,
    required this.comunidad,
  });
  final PropertiesTextField nombreComercial;
  final PropertiesTextField direccion;
  final PropertiesTextField cp;
  final PropertiesTextField localidad;
  final PropertiesTextField provincia;
  final PropertiesTextField comunidad;
  List<PropertiesTextField> listProperty() {
    return [
      nombreComercial,
      direccion,
      cp,
      localidad,
      provincia,
      comunidad,
    ];
  }
}

class DatosContrasenaTextField {
  DatosContrasenaTextField({
    required this.contrasena,
    required this.comprobarContrasena,
  });
  factory DatosContrasenaTextField.init(
      {required TickerProvider tick,
      required TextEditingController contrasenaController,
      required TextEditingController contrasenaController2}) {
    return DatosContrasenaTextField(
      contrasena: PropertiesTextField(
          labelText: 'Contraseña',
          anim: animVibrate(vsync: tick),
          maxLength: 15,
          controller: contrasenaController),
      comprobarContrasena: PropertiesTextField(
          labelText: 'Comprobar contraseña',
          anim: animVibrate(vsync: tick),
          maxLength: 15,
          controller: contrasenaController2),
    );
  }
  final PropertiesTextField contrasena;
  final PropertiesTextField comprobarContrasena;
}
