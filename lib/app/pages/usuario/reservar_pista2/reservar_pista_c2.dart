import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reservatu_pista/utils/logger/logger.dart';
import '../../../../utils/sizer.dart';
import '../../../routes/database.dart';
import '../../../routes/models/datos_reservas_pista.dart';
import 'dart:convert';

class HorarioFinInicio {
  HorarioFinInicio(
      {required this.inicio,
      required this.termino,
      required this.typeEstadoHorario});

  final String inicio;
  final String termino;
  final TypeEstadoHorario typeEstadoHorario;
  bool isEquals(HorarioFinInicio horaFinInicio) {
    final bool validar =
        horaFinInicio.inicio == inicio && horaFinInicio.termino == termino;
    return validar;
  }
}

class ReservarPistaController2 extends GetxController
    with SingleGetTickerProviderMixin {
  DatabaseController db = Get.find();

  /// Variable que almacena todas las localidades existentes.
  final Rx<List<String>> _localidades = Rx<List<String>>([]);
  List<String> get localidades => _localidades.value;
  set localidades(List<String> value) => _localidades.value = value;

  /// Variable que almacena todos los clubes existentes de la localidad
  final Rx<List<String>> clubes = Rx<List<String>>([]);

  Map<String, String> mapLocalidades = {};
  Rx<String> cod_postal = Rx<String>('');
  // Rx<List<String>> clubes = Rx<List<String>>([]);

  Rx<String> id_club_seleccionado = Rx<String>('');
  Map<String, String> mapClubes = {};
  Rx<List<String>> deportes = Rx<List<String>>([]);
  Map<String, String> mapDeportes = {};
  Rx<String> deporte_seleccionado = Rx<String>('');

  Rx<List<dynamic>> pistas = Rx<List<dynamic>>([]);
  Rx<int> id_pista_seleccionada = Rx<int>(0);
  Rx<String> hora_apertura_pista = Rx<String>('');
  Rx<String> hora_cierre_pista = Rx<String>('');
  Rx<String> duracion_partida = Rx<String>('');
  Rx<DateTime> fecha_seleccionada = Rx<DateTime>(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  Rx<int?> selectLocalidad = Rx<int?>(null);
  Rx<int?> selectClub = Rx<int?>(null);
  Rx<int?> selectDeporte = Rx<int?>(null);
  // Rx<int?> selectedDay = Rx<int?>(null);
  Rx<int?> selectPista = Rx<int?>(null);
  Rx<int?> selectDay = Rx<int?>(null);
  // Cancelar la reserva
  RxBool cancelarReserva = false.obs;

  Rx<HorarioFinInicio?> selectHorario = Rx<HorarioFinInicio?>(null);
  final ScrollController scrollController = ScrollController();
  Rx<DateTime?> selectDateDay = Rx<DateTime?>(null);
  RxList<bool> listReservas = [false, false, false, false].obs;
  TextEditingController localidadController = TextEditingController();
  FocusNode localidadFocusNode = FocusNode();
  TextEditingController deporteController = TextEditingController();
  FocusNode deporteFocusNode = FocusNode();
  TextEditingController PistaController = TextEditingController();
  FocusNode PistaFocusNode = FocusNode();
  TextEditingController nPistaController = TextEditingController();
  FocusNode nPistaFocusNode = FocusNode();
  TextEditingController clubController = TextEditingController();
  FocusNode clubFocusNode = FocusNode();
  TextEditingController codigoDescuentoController = TextEditingController();

  /// Global Keys
  GlobalKey keyInputs = GlobalKey();
  GlobalKey keyCalendar = GlobalKey();
  GlobalKey keyHorarios = GlobalKey();
  GlobalKey keyPistas = GlobalKey();
  GlobalKey keyDatos = GlobalKey();

  // int diaHoy = 0;
  RxBool terms = false.obs;
  RxDouble totalHeight = 0.0.obs;
  RxDouble sizedBoxHeight = 0.0.obs;
  late DateTime fechaActual;
  late List<DateTime> tiempoReservaListaCalendar;

  final appBarAndNavBar = 120;
  PageController pageViewController = PageController();
  @override
  void onInit() {
    super.onInit();
    generarListaLocalidades();
    fechaActual = DateTime.now();
    debounce(sizedBoxHeight, (callback) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }, time: const Duration(milliseconds: 50));
    debounce(selectDay, (callback) {
      if (callback != null) {
        final sizeCalendar = (keyCalendar.currentContext != null
            ? keyCalendar.currentContext!.size!.height
            : 0.0);
        final sizeHorarios = (keyHorarios.currentContext != null
            ? keyHorarios.currentContext!.size!.height
            : 0.0);
        final sizePistas = (keyPistas.currentContext != null
            ? keyPistas.currentContext!.size!.height
            : 0.0);
        final newSize = (100.h -
            (sizeCalendar + sizePistas + appBarAndNavBar + sizeHorarios));
        if (newSize < 0) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + newSize,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          if (sizedBoxHeight.value == newSize) {
            sizedBoxHeight.refresh();
          } else {
            sizedBoxHeight.value = newSize;
          }
        }
        /*pageViewController.animateToPage(callback,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);*/
      }
    }, time: const Duration(milliseconds: 50));
    debounce(selectHorario, (callback) async {
      if (callback != null) {
        final sizeDatos = (keyDatos.currentContext != null
            ? keyDatos.currentContext!.size!.height
            : 0.0);
        final sizePistas = (keyPistas.currentContext != null
            ? keyPistas.currentContext!.size!.height
            : 0.0);
        final newSize = (100.h -
            (sizePistas +
                appBarAndNavBar +
                keyHorarios.currentContext!.size!.height +
                sizeDatos));
        if (newSize < 0) {
          // sizedBoxHeight.refresh();
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + newSize,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          if (sizedBoxHeight.value == newSize) {
            sizedBoxHeight.refresh();
          } else {
            sizedBoxHeight.value = newSize;
          }
        }
      }
    }, time: const Duration(milliseconds: 50));
    tiempoReservaListaCalendar = getListaHorarios();
  }

  Future<void> generarListaLocalidades() async {
    try {
      String localidadesJson = await db.obtenerLocalidades();
      // Convertir la cadena JSON en una lista de mapas
      List<dynamic> localidadesData = json.decode(localidadesJson);
      mapLocalidades = Map.fromEntries(localidadesData.map(
          (e) => MapEntry<String, String>(e['localidad'], e['cod_postal'])));

      List<String> listaLocalidades = localidadesData
          .map<String>((localidad) => localidad['localidad'] as String)
          .toList();
      localidades = listaLocalidades;
      return;
    } catch (error) {
      rethrow;
    }
  }

  //funcion para obtener los clubes que hay en cada localidad
  Future<void> generarListaClubes(String cod_postal) async {
    try {
      //deporte_seleccionado.value = '';
      String clubesJson = await db.obtenerClubes(cod_postal);
      print('clubesssJson $clubesJson');
      if (clubesJson == '[]') {
        //falta cambiar
        print('pruebaaaaaaaaaaaaaaaa');
        return;
      }
      List<dynamic> clubesData = json.decode(clubesJson);

      for (var i = 0; i < clubesData.length; i++) {
        mapClubes[clubesData[i]['nombre']] =
            clubesData[i]['id_club'].toString();
      }
      List<String> listaClubes =
          clubesData.map<String>((club) => club['nombre'] as String).toList();
      clubes.value = listaClubes;
      return;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorr $error');
      rethrow;
    }
  }

  //funcion para obtener los deportes que hay en cada pista de los clubes
  Future<void> generarListaDeportes(String id_club) async {
    //deporteController.text = '';
    deporte_seleccionado.value = '';
    try {
      String deportesJson = await db.obtenerDeportes(id_club);
      print('deportesJson $deportesJson');
      if (deportesJson == '{}') {
        deportes.value = [];
        return;
      }
      List<dynamic> deportesData = json.decode(deportesJson);

      List<String> listaDeportes = deportesData
          .map<String>((deporte) => deporte['deporte'] as String)
          .toList();
      deportes.value = listaDeportes;
      return;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorrrrrrrr $error');
      rethrow;
    }
  }

//funcion para obtener las pistas que hay en cada club
  Future<void> generarListaPistas(String id_club, String deporte) async {
    //deporteController.text = '';
    try {
      String pistasJson = await db.obtenerPistas(id_club, deporte);
      print('pistasJson $pistasJson');
      if (pistasJson.isEmpty) {
        pistas.value = [];
        return;
      }
      // List<dynamic> pistasData = json.decode(pistasJson);
      pistas.value = json.decode(pistasJson);
      id_pista_seleccionada.value = pistas.value[0]['id_pista'];
      print('id_pista_seleccionada $id_pista_seleccionada');
      print('pistasData[0] ${pistas.value[0]['id_pista']}');
      /* List<String> listaPistas = pistasData
          .map<String>((pista) => pista['id_pista'].toString())
          .toList();*/
      return;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('$error');
      rethrow;
    }
  }

  Future<List<dynamic>> generarListaHorarios(
      int idPista, DateTime dia_seleccionado) async {
    try {
      String response =
          await db.obtenerHorariosPistas(idPista, dia_seleccionado);
      if (response.length <= 0) return [];
      print('response ${response}');
      List<dynamic> datosPista2 = json.decode(response);
      print('datosPista22 ${datosPista2}');
      return datosPista2;
      /*String datosPistaString = await db.obtenerDatosPista(idPista);
      List<dynamic> datosPista = json.decode(datosPistaString);
      hora_apertura_pista.value = datosPista[0]['hora_inicio'].toString();
      hora_cierre_pista.value = datosPista[0]['hora_fin'].toString();
      duracion_partida.value = datosPista[0]['duracion_partida'].toString();
      List<String> partesHoraInicio = hora_apertura_pista.value.split(":");
      TimeOfDay horaInicio = TimeOfDay(
        hour: int.parse(partesHoraInicio[0]), // hora
        minute: int.parse(partesHoraInicio[1]), // minutos
      );
      DateTime hora_apertura = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          horaInicio.hour,
          horaInicio.minute);
      DateTime prueba = hora_apertura.add(Duration(minutes: 30));
      DateTime hora_cierre = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      return datosPista; */
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorrrrr $error');
      rethrow;
    }
  }

  List<DateTime> getListaHorarios() {
    return List.generate(
        db.datosReserva.tiempoReserva, (index) => getAddDia(index));
  }

  DateTime fechaAnterior() {
    // Obtén la fecha y hora actual
    DateTime fechaActual = DateTime.now();

    // Crea una duración de un día (24 horas)
    const unDia = Duration(days: 1);

    // Resta un día a la fecha actual
    return fechaActual.add(unDia);
  }

  DateTime getAddDia(int days) {
    final addDia = Duration(days: days);
    return fechaActual.add(addDia);
  }

  SvgPicture _buildSvgIcon(String asset) {
    return SvgPicture.asset(
      asset,
      height: 5,
      width: 5,
      fit: BoxFit.fill,
      colorFilter: const ColorFilter.mode(
          Color.fromARGB(255, 145, 145, 145), BlendMode.srcIn),
    );
  }
}

class SelectionController {
  ValueNotifier<String?> selectedOption = ValueNotifier<String>('');
}