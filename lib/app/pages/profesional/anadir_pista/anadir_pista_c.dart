import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../app_state.dart';
import '../../../../backend/schema/enums/tipo_imagen.dart';
import '../../../../backend/server_node/anadir_pista_node.dart';
import 'package:image/image.dart' as img;
import '../../../../utils/animations/list_animations.dart';
import '../../../../utils/dialog/rich_alert.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import '../tarifas_pista/tarifas_pista_c.dart';

extension SioNo on String {
  bool get sn => this == 'Si' ? true : false;
  String get de => substring(3);
  int get dp => this == '60 Minutos' ? 60 : 90;
  String get tm => '$this:00';
  int get trOtc => int.parse(split(' ')[0]);
  double get pc => double.parse(split(' ')[0]);
}

class InputController {
  InputController(this.anim);
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  RxBool isValidate = false.obs;
  GlobalKey key = GlobalKey();
  AnimationController anim;
}

class AnadirPistaController extends GetxController
    with GetTickerProviderStateMixin {
  RxBool isValidBtnTarifas = false.obs;
  TarifasPistaController selfTarifas = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Controller de slider.
  ScrollController scrollController = ScrollController();
  // Input Controller deporte
  late InputController deporte;
  // Input Controller techada
  late InputController techada;
  // Input Controller iluminacion
  late InputController iluminacion;
  // Input Controller tipo
  late InputController tipo;
  // Input Controller cesped
  late InputController cesped;
  // Input Controller automatizada
  late InputController automatizada;
  // Input Controller duracionPartida
  late InputController duracionPartida;
  // Input Controller horaInicio
  late InputController horaInicio;
  // Input Controller horaFin
  late InputController horaFin;
  // Input Controller socioTiempoReserva
  late InputController socioTiempoReserva;
  // Input Controller socioTiempoCancelacion
  late InputController socioTiempoCancelacion;
  // Input Controller socioPrecioConLuz
  late InputController socioPrecioConLuz;
  // Input Controller socioPrecioSinLuz
  late InputController socioPrecioSinLuz;
  // Input Controller noSocioTiempoReserva
  late InputController noSocioTiempoReserva;
  // Input Controller noSocioTiempoCancelacion
  late InputController noSocioTiempoCancelacion;
  // Input Controller noSocioPrecioConLuz
  late InputController noSocioPrecioConLuz;
  // Input Controller noSocioPrecioSinLuz
  late InputController noSocioPrecioSinLuz;
  // Input Controller descripcion
  late InputController descripcion;
  // Input Controller nombrePatrocinador
  late InputController nombrePatrocinador;
  // Input Controller foto
  late InputController foto;
  // Input Controller vestuario
  late InputController vestuario;
  // Input Controller duchas
  late InputController duchas;
  // Input Controller efectivo
  late InputController efectivo;
  // Input Controller tarjeta
  late InputController tarjeta;
  // Input Controller bono
  late InputController bono;
  // Input Controller reservatupista
  late InputController reservatupista;
  // Animation Controller imagenesPistaAnim
  late AnimationController imagenesPistaAnim;
  // Animation Controller animTerminos
  late AnimationController animTerminos;
  // Valida Checkbox los terminos y condiciones
  RxBool validateCheckbox = false.obs;
  // Controller numero de pista
  TextEditingController nPistaController = TextEditingController();
// Focus al InputController, solo a uno
  bool focusInputController = false;
  // Validar Terminos y condiciones al momento de crear la pista
  RxBool checkboxTerminos = false.obs;
  // Validar si se han creado las tarifas al momento de crear la pista
  RxBool validarTarifas = false.obs;
  // Imagen del patrocinador
  Rx<File?> imagePatrocinador = Rx<File?>(null);
  // Imagenes de la pistas
  StateRx<List<File>?> imagesPista = StateRx(Rx<List<File>?>(null));
  // Lista de los horarios para crear las tarifas
  Rx<List<String>> listaHorarios = Rx<List<String>>([]);
  // Lista de las tarifas
  List<List<Tarifa>> listaTarifas = [];
  @override
  void onInit() {
    super.onInit();
    imagesPista.change([], RxStatusDemo.success());
    ever(isValidBtnTarifas, (callback) {
      if (!callback) {
        final listValidators = [
          duracionPartida.controller.text,
          horaInicio.controller.text,
          horaFin.controller.text,
          socioPrecioConLuz.controller.text,
          socioPrecioSinLuz.controller.text,
          noSocioPrecioConLuz.controller.text,
          noSocioPrecioSinLuz.controller.text
        ];
        bool btnTarifas = true;
        for (String element in listValidators) {
          if (element.isEmpty) {
            btnTarifas = false;
            break;
          }
        }
        if (btnTarifas) {
          isValidBtnTarifas.value = true;
        }
      }
    });

    deporte = InputController(animVibrate(vsync: this));
    techada = InputController(animVibrate(vsync: this));
    iluminacion = InputController(animVibrate(vsync: this));
    tipo = InputController(animVibrate(vsync: this));
    cesped = InputController(animVibrate(vsync: this));
    automatizada = InputController(animVibrate(vsync: this));
    duracionPartida = InputController(animVibrate(vsync: this));
    horaInicio = InputController(animVibrate(vsync: this));
    horaFin = InputController(animVibrate(vsync: this));
    socioTiempoReserva = InputController(animVibrate(vsync: this));
    socioTiempoCancelacion = InputController(animVibrate(vsync: this));
    socioPrecioConLuz = InputController(animVibrate(vsync: this));
    socioPrecioSinLuz = InputController(animVibrate(vsync: this));
    noSocioTiempoReserva = InputController(animVibrate(vsync: this));
    noSocioTiempoCancelacion = InputController(animVibrate(vsync: this));
    noSocioPrecioConLuz = InputController(animVibrate(vsync: this));
    noSocioPrecioSinLuz = InputController(animVibrate(vsync: this));
    descripcion = InputController(animVibrate(vsync: this));
    nombrePatrocinador = InputController(animVibrate(vsync: this));
    foto = InputController(animVibrate(vsync: this));
    vestuario = InputController(animVibrate(vsync: this));
    duchas = InputController(animVibrate(vsync: this));
    imagenesPistaAnim = animVibrate(vsync: this);
    efectivo = InputController(animVibrate(vsync: this));
    tarjeta = InputController(animVibrate(vsync: this));
    bono = InputController(animVibrate(vsync: this));
    reservatupista = InputController(animVibrate(vsync: this));
    animTerminos = animVibrate(vsync: this);
  }

  AnimationController getAnimVibrate() {
    return animVibrate(vsync: this);
  }

  validarInputController(
    String? val,
    RxBool isValidate,
    AnimationController anim,
    GlobalKey key,
  ) {
    if (val!.isEmpty) {
      isValidate.value = true;
      anim.forward();
      if (!focusInputController) {
        focusInputController = true;
        final RenderBox textFieldRenderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        final textFieldPosition = textFieldRenderBox.localToGlobal(Offset.zero);
        scrollController
            .animateTo(
              textFieldPosition.dy,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            )
            .then((value) => focusInputController = false);
      }
    }
    return null;
  }

  /// Todo para crear las tarifas
  void generarListaTarifas() {
    if (selfTarifas.datosGuardados.value) {
      selfTarifas.changeDia(0);
      Get.toNamed(Routes.TARIFAS_PISTA);
    } else {
      final newListString = [];
      bool startList = false;
      for (var element in listaHorarios.value) {
        if (element == horaInicio.controller.text) {
          startList = true;
        }
        if (startList) {
          newListString.add(element);
          if (element == horaFin.controller.text) {
            break;
          }
        }
      }
      listaTarifas = List<List<Tarifa>>.generate(
          7,
          (index) => List.generate(
              newListString.length,
              (index) => Tarifa(
                  horaInicio: newListString[index],
                  precioConLuzSocio: socioPrecioConLuz.controller.text,
                  precioSinLuzSocio: socioPrecioSinLuz.controller.text,
                  precioConLuzNoSocio: noSocioPrecioConLuz.controller.text,
                  precioSinLuzNoSocio: noSocioPrecioSinLuz.controller.text)));
      selfTarifas.onCrearPistas(listaTarifas);
      selfTarifas.indexDias.value = 0;
      Get.toNamed(Routes.TARIFAS_PISTA);
    }
  }

  // Duracion si son 60mminutos o 90 minutos
  void setDuration(String value) {
    if (value == '60 Minutos') {
      generarListaHorarios(true);
    } else {
      generarListaHorarios(false);
    }
  }

  void generarListaHorarios(isSesena) {
    List<String> newListHorarios = [];
    DateTime initialTime = DateTime(2023, 1, 1, 0, 0);
    DateTime endTime = DateTime(2023, 1, 2, 0, 0);
    DateTime currentTime = initialTime;
    Duration duration = const Duration();
    if (isSesena) {
      duration = const Duration(minutes: 60);
    } else {
      duration = const Duration(minutes: 90);
    }
    String horaDia = DateFormat('HH:mm').format(currentTime);
    newListHorarios.add(horaDia);
    while (currentTime.isBefore(endTime)) {
      currentTime = currentTime.add(duration);
      String horaDia = DateFormat('HH:mm').format(currentTime);
      newListHorarios.add(horaDia);
    }
    newListHorarios.removeLast();
    listaHorarios.value = newListHorarios;
  }

  List<String> generarHoraFinal(List<String> lista) {
    final List<String> horariosFinal = [];
    bool startList = false;
    for (var i = 0; i < lista.length; i++) {
      if (startList) {
        horariosFinal.add(lista[i]);
      } else {
        if (lista[i] == horaInicio.controller.text) {
          if (i == lista.length - 1) {
            horariosFinal.add(lista[i]);
          }
          startList = true;
        }
      }
    }
    return horariosFinal;
  }

  /// Generar las tarifas esto es para generar la tabla del dia se tiene que cambiar
  List generateTarifasSemana(DateTime lunesInicio, int dayOfWeek) {
    DateTime fechaWeek = lunesInicio;
    final trns = socioTiempoReserva.controller.text.trOtc;
    final trs = noSocioTiempoReserva.controller.text.trOtc;
    int maxTr = trs + dayOfWeek;
    maxTr = maxTr <= 6 ? 6 : maxTr;
    if (trns >= trs) {
      maxTr = trns;
    }

    int contDias = 0;
    List tarifasDate = [];
    for (var i = 0; i < maxTr; i++) {
      // Utiliza el formato deseado
      final formatoFecha = DateFormat('yyyy-MM-dd');
      // Formatea la fecha
      final fecha = formatoFecha.format(fechaWeek);
      tarifasDate.add(FFAppState()
          .listaTarifas[contDias]
          .map((e) => [
                e.disponible,
                e.clases,
                e.luz,
                e.horaInicio,
                e.fecha = fecha,
                e.precioConLuzSocio,
                e.precioSinLuzSocio,
                e.precioConLuzNoSocio,
                e.precioSinLuzNoSocio
              ])
          .toList());
      if (contDias == 6) {
        contDias = 0;
      } else {
        contDias++;
      }
      fechaWeek = fechaWeek.add(const Duration(days: 1));
    }
    return tarifasDate;
  }

  /// Cargar la imagen del patrocinador
  void pickImagePatrocinador(String? path, TipoImagen tipoImagen) async {
    if (path is String) {
      imagePatrocinador.value = await imageResize(path);
      foto.isValidate.value = false;
      foto.controller.text = 'Foto';
    }
    Get.back();
  }

  /// Cargar las imagenes de la pista
  void pickImagesPista() async {
    try {
      List<XFile> images = await ImagePicker().pickMultiImage();
      if (images.isNotEmpty) {
        imagesPista.change(null, RxStatusDemo.loading());
        final maxImages = images.length > 5;
        if (maxImages) {
          /// Si el limite es mayor, mensaje de error
          await Get.dialog(RichAlertDialog(
            //uses the custom alert dialog
            alertTitle: richTitle("Imagenes pista"),
            alertSubtitle: richSubtitle(
                "Solo puedes seleccionar 5\nimagenes de la pista."),
            textButton: "Cerrar",
            alertType: RichAlertType.WARNING,
            onPressed: () => Get.back(),
          ));
        } else {
          List<File> imagesResize = [];
          for (XFile img in images) {
            imagesResize.add(await imageResize(img.path));
          }
          imagesPista.change(imagesResize, RxStatusDemo.success(),
              newAction: '');
        }
      }
    } catch (e) {
      imagesPista.change([], RxStatusDemo.success());
      print(e);
    }
  }

  /// Reducir imagen
  Future<File> imageResize(String path) async {
    // Imagen decoded
    img.Image image = img.decodeImage(File(path).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 300,
      height: 600,
    );
    // Regresar la imagen comprimida
    return File(path)
      ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 90));
  }

  /// Crear la pista y subirla al servidor
  void crearPista() {
    bool validarAnterior = true;
    if (imagesPista.rx.value!.isEmpty) {
      validarAnterior = false;
      imagesPista.changeActions('validate');
    }
    if (!checkboxTerminos.value) {
      validarAnterior = false;
      validateCheckbox.value = true;
      animTerminos.forward();
    }
    if (!selfTarifas.datosGuardados.value) {
      validarAnterior = false;
      validarTarifas.value = true;
    }
    if (formKey.currentState!.validate() && validarAnterior) {
      print("Todos los campos estan completos");
    }
    //   final datosPista = [
    //     deporteController!.text.de,
    //     1,
    //     techadaController!.text.sn,
    //     iluminacionController!.text,
    //     tipoController!.text,
    //     cespedController!.text,
    //     automatizadaController!.text.sn,
    //     duracionPartidaController!.text.dp,
    //     horaInicioController!.text.tm,
    //     horaFinController!.text.tm,
    //     tiempoReservaSocioController!.text.trOtc,
    //     tiempoCancelacionSocioController!.text.trOtc,
    //     precioConLuzSocioController!.text.pc,
    //     precioSinLuzSocioController!.text.pc,
    //     tiempoReservaNoSocioController!.text.trOtc,
    //     tiempoCancelacionNoSocioController!.text.trOtc,
    //     precioConLuzNoSocioController!.text.pc,
    //     precioSinLuzNoSocioController!.text.pc,
    //     descripcionController!.text,
    //     nombrePatrocinadorController!.text,
    //     'patrocinador1.jpg',
    //     vestuarioController!.text.sn,
    //     duchasController!.text.sn,
    //     'imagen1.jpg,imagen2.jpg,imagen3.jpg'
    //   ];
    // // Obtén la fecha actual
    // DateTime now = DateTime.now();
    // // Obtén el número del día de la semana (1-7)
    // int dayOfWeek = now.weekday;
    // now = now.subtract(Duration(days: dayOfWeek - 1));
    // final datosTarifas = generateTarifasSemana(now, dayOfWeek);
    // anadirPistaNode(datosPista, datosTarifas);
  }

  @override
  void dispose() {
    super.dispose();
    // deporteController!.dispose();
    // deporteFocusNode!.dispose();
    // nPistaController!.dispose();
    // nPistaFocusNode!.dispose();
    // techadaController!.dispose();
    // techadaFocusNode!.dispose();
    // iluminacionController!.dispose();
    // iluminacionFocusNode!.dispose();
    // tipoController!.dispose();
    // tipoFocusNode!.dispose();
    // cespedController!.dispose();
    // cespedFocusNode!.dispose();
    // automatizadaController!.dispose();
    // automatizadaFocusNode!.dispose();
    // duracionPartidaController!.dispose();
    // duracionPartidaFocusNode!.dispose();
    // horaInicioController!.dispose();
    // horaInicioFocusNode!.dispose();
    // horaFinController!.dispose();
    // horaFinFocusNode!.dispose();
    // tiempoReservaSocioController!.dispose();
    // tiempoReservaSocioFocusNode!.dispose();
    // tiempoCancelacionSocioController!.dispose();
    // tiempoCancelacionSocioFocusNode!.dispose();
    // precioConLuzSocioController!.dispose();
    // precioConLuzSocioFocusNode!.dispose();
    // precioSinLuzSocioController!.dispose();
    // precioSinLuzSocioFocusNode!.dispose();
    // tiempoReservaNoSocioController!.dispose();
    // tiempoReservaNoSocioFocusNode!.dispose();
    // tiempoCancelacionNoSocioController!.dispose();
    // tiempoCancelacionNoSocioFocusNode!.dispose();
    // precioConLuzNoSocioController!.dispose();
    // precioConLuzNoSocioFocusNode!.dispose();
    // precioSinLuzNoSocioController!.dispose();
    // precioSinLuzNoSocioFocusNode!.dispose();
    // descripcionController!.dispose();
    // descripcionFocusNode!.dispose();
    // nombrePatrocinadorController!.dispose();
    // nombrePatrocinadorFocusNode!.dispose();
    // imagePatrocinadorController!.dispose();
    // imagePatrocinadorFocusNode!.dispose();
    // vestuarioController!.dispose();
    // vestuarioFocusNode!.dispose();
    // duchasController!.dispose();
    // duchasFocusNode!.dispose();
  }
}
