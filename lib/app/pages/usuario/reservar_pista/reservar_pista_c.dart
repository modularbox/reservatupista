// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/datos_reservas_pista.dart';
import 'package:reservatu_pista/app/data/models/detalles_pista_reserva_model.dart';
import 'package:reservatu_pista/app/data/models/localidad_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/provider/email_node.dart';
import 'package:reservatu_pista/app/data/provider/proveedor_node.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/controllers/db_alvaro_c.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/widgets/dialogs_messages.dart';
import 'package:reservatu_pista/app/pages/usuario/reservar_pista/widgets/size_move.dart';
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/buttons_sounds.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

extension ExtDateTime on DateTime {
  String get formatDate =>
      '${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}

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

class ReservarPistaController extends GetxController
    with GetTickerProviderStateMixin {
  /// Reservas Usuario

  // Tamano de cada widget
  SizeMove sm = SizeMove();

  /// Todos los dialogos al reservar la pista
  late DialogsMessages dm;

  // Global key para el form de los inputs
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Tiempo de reserva para el calendario
  final _tiempoReserva = 0.obs;
  int get tiempoReserva => _tiempoReserva.value;
  set tiempoReserva(int value) => _tiempoReserva.value = value;

  /// Datos usuarios a reservar
  late Rx<ReservaUsuario> usuario;
  DBAlvaroController db2 = Get.find();
  DBService db = Get.find();
  //variable que almacena todas las localidades existentes.
  Rx<List<String>> localidades = Rx<List<String>>([]);
  LocalidadModel listLocalidades = LocalidadModel(localidades: []);
  Rx<String> cod_postal = Rx<String>('');
  Rx<List<String>> clubes = Rx<List<String>>([]);
  Rx<String> id_club_seleccionado = Rx<String>('');
  Map<String, String> mapClubes = {};
  Rx<List<String>> deportes = Rx<List<String>>([]);
  Map<String, String> mapDeportes = {};
  Rx<String> deporte_seleccionado = Rx<String>('');

  // Rx<List<dynamic>> pistas = Rx<List<dynamic>>([]);

  final pistas = Rx<List<DetallesPistaReservaModel>>([]);
  Rx<int> id_pista_seleccionada = Rx<int>(0);
  Rx<bool> pista_automatizada = Rx<bool>(false);
  Rx<bool> pista_con_luces = Rx<bool>(false);
  Rx<String> hora_apertura_pista = Rx<String>('');
  Rx<String> hora_cierre_pista = Rx<String>('');
  Rx<int> duracion_partida = Rx<int>(0);
  Rx<DateTime> fecha_seleccionada = Rx<DateTime>(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  Rx<String> hora_inicio_reserva_seleccionada = Rx<String>('00:00:00');
  Rx<String> hora_fin_reserva_seleccionada = Rx<String>('01:00:00');
  Rx<int> plazas_a_reservar = Rx<int>(1);
  //variable que almacenara la diferencia entre la capacidad de la pista y las plazas que quiere reservar el user, para no tener que estar seteando constantemente la diferencia
  int plazasLibres = 0;
  int capacidad_pista = 4;
  Rx<int?> selectLocalidad = Rx<int?>(null);
  Rx<String> localidad_seleccionada = Rx<String>('');
  Rx<int?> selectClub = Rx<int?>(null);
  Rx<int?> selectDeporte = Rx<int?>(null);
  // Rx<int?> selectedDay = Rx<int?>(null);
  Rx<int?> selectPista = Rx<int?>(0);
  Rx<String?> selectedItemDeporte = Rx<String?>(null);
  Rx<int> precio_con_luz_socio = Rx<int>(0);
  Rx<int> precio_con_luz_no_socio = Rx<int>(0);
  Rx<int> precio_sin_luz_socio = Rx<int>(0);
  Rx<int> precio_sin_luz_no_socio = Rx<int>(0);
  Rx<int> precio_elegido = Rx<int>(0);
  Rx<int> precio_a_mostrar = Rx<int>(
      0); //PRECIO QUE SE MOSTRARÁ AL USUARIO A LA HORA DE RESERVAR ALGUNA PISTA. Se calcula multiplicando el precio obtenido de la reserva por las plazas que se va a reservar
  // late SharedPreferences storage;
  // Cancelar la reserva
  final cancelarReserva = false.obs;

  final selectHorario = Rxn<HorarioFinInicio>();
  Rx<DateTime?> selectDateDay = Rx<DateTime?>(null);
  late List<DateTime?> singleDatePickerValueWithDefaultValue;
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

  int diaHoy = 0;
  late AnimationController animTerminos;

  RxDouble totalHeight = 0.0.obs;
  late DateTime fechaActual;
  final appBarAndNavBar = 120;

  /// Obtener los usuarios con reservas
  final reservas_usuarios = Rxn<ReservasUsuarios>();
  // Verificar si las reservas son abiertas y si ha solicitado todas las reservas siendo el mismo
  bool totalMisReservas = false;

  // Datos de la reserva
  late DatosReservaPista datosReserva;
  // Selection controller
  final SelectionController selectionController = SelectionController();

  @override
  void onInit() async {
    super.onInit();
    generarListaLocalidades();
    fechaActual = DateTime.now();
    animTerminos = animVibrate(vsync: this);
    db.getMoney();
    // if (!isWeb) {
    sm.insertDebounce();
    // }
    singleDatePickerValueWithDefaultValue = [fechaActual];
    diaHoy = singleDatePickerValueWithDefaultValue[0]!.day;
  }

  void onChangedDay(DateTime dayDate) {
    fecha_seleccionada.value =
        DateTime(dayDate.year, dayDate.month, dayDate.day);
    selectHorario.value = null;
    selectDateDay.value = dayDate;
    selectDateDay.refresh();
    sm.moveCalendar();
    if (selectPista.value == 0) {
      selectPista.refresh();
    } else {
      selectPista.value = 0;
    }
  }

  void onConfirmar() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (selectHorario.value == null) {
      return;
    }
    if (selectionController.selectedOption.value != '' &&
        selectionController.selectedOption.value != 'rellenar') {
      final precio = db.dineroTotal - (precio_a_mostrar.value);
      if (precio < 0) {
        if (selectionController.selectedOption.value == 'tarjeta') {
          dm.reservarTarjeta(
              precio: precio_a_mostrar.value.euro,
              onPressedButton: () => db2.reservarPistaConTarjeta(
                  precio_a_mostrar.value, this, dm.reservarProceso));
        } else {
          dm.reservaNoMoney();
        }
      } else {
        if (selectionController.selectedOption.value == 'tarjeta') {
          dm.reservarTarjeta(
              precio: precio_a_mostrar.value.euro,
              onPressedButton: () => db2.reservarPistaConTarjeta(
                  precio_a_mostrar.value, this, dm.reservarProceso));
        } else {
          dm.reservarMonedero(
              precio: precio_a_mostrar.value.euro,
              onPressedButton: reservarPistaF);
        }
      }
    }
    ButtonsSounds.playSound();
  }

  void reservarPistaF() async {
    String? referencia = await db2.reservarPista(
        db.idUsuario,
        precio_a_mostrar.value / 100,
        fecha_seleccionada.value,
        hora_inicio_reserva_seleccionada.value,
        id_pista_seleccionada.value.toString(),
        usuario.value.plazasReservadas);
    if (referencia is String) {
      await EmailProvider().emailReservas(
          db.email,
          referencia,
          fecha_seleccionada.value.toString().substring(0, 10),
          hora_inicio_reserva_seleccionada.value,
          hora_fin_reserva_seleccionada.value,
          localidad_seleccionada.value,
          deporteController.text,
          (selectPista.value! + 1).toString(),
          'monedero',
          db.nombre,
          plazas_a_reservar.value.toString());
      dm.reservarSuccess(
          onPressed: () => {Get.back(), Get.offNamed(Routes.MIS_RESERVAS)});
    } else {
      dm.reservaError();
    }
  }

  Future<void> obtenerPlazasLibres() async {
    try {
      // Iniciarlizar el usuario con los datos guardados
      usuario = Rx<ReservaUsuario>(ReservaUsuario(
          idUsuario: db.idUsuario,
          nick: db.nick,
          imagen: db.fotoUsuario,
          plazasReservadas: 1));
      final idPista = id_pista_seleccionada.value.toString();
      final fecha = fecha_seleccionada.value.formatDate;
      final horaInicio = hora_inicio_reserva_seleccionada.value;
      final result = await ReservasProvider()
          .obtenerPlazasLibres(idPista, fecha, horaInicio);
      if (result is ReservasUsuarios) {
        /// refrescar todo
        reservas_usuarios.value = result;
        plazasLibres = capacidad_pista - result.plazasReservadasTotales;
        usuario.value.plazasReservadas = 1;
        cancelarReserva.value = false;
        totalMisReservas = false;
        plazas_a_reservar.value = 0;
        usuario.refresh();
        sm.moveHorarios();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> generarListaLocalidades() async {
    try {
      dynamic localidadesJson = await obtenerLocalidades();
      // Convertir la cadena JSON en una lista de mapas
      listLocalidades = LocalidadModel.fromRawJson(localidadesJson);
      List<String> listaLocalidades = listLocalidades.localidades
          .map<String>((localidad) => localidad.localidad)
          .toList();
      localidades.value = listaLocalidades;
      return;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> obtenerLocalidades() async {
    try {
      var url = '${DatosServer.urlServer}/usuario/obtener_localidades';
      var response = await http.get(Uri.parse(url));

      return response.body;
    } catch (error) {
      print('eeeeeeeeerrrrooor: $error');
      rethrow;
    }
  }

  //funcion para obtener los clubes que hay en cada localidad
  Future<void> generarListaClubes(
      String cod_postal, List<String> codigos_postales) async {
    try {
      //resets
      clubController.text = '';
      deporteController.text = '';
      clubes.value = [];
      deportes.value = [];

      List<dynamic> clubesCodPostal =
          await ProveedorProvider().obtenerClubes(codigos_postales);

      for (var i = 0; i < clubesCodPostal.length; i++) {
        mapClubes[clubesCodPostal[i]['nombre']] =
            clubesCodPostal[i]['id_club'].toString();
      }

      List<String> listaClubes = clubesCodPostal
          .map<String>((club) => club['nombre'] as String)
          .toList();
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
      String deportesJson = await db2.obtenerDeportes(id_club);
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

  void onPressedBuildChip(int index) {
    selectHorario.value = null;
    selectPista.value = index;
    tiempoReserva = pistas.value[index].tiempoReservaNoSocio;
    _tiempoReserva.refresh();
    selectDateDay.refresh();
    sm.movePista();
  }

//funcion para obtener las pistas que hay en cada club
  Future<void> generarListaPistas(String id_club, String deporte) async {
    //deporteController.text = '';
    try {
      String pistasJson = await db2.obtenerPistas(id_club, deporte);
      if (pistasJson.isEmpty) {
        pistas.value = [];
        return;
      }

      pistas.value =
          detallesPistaReservaModelFromJsonList(json.decode(pistasJson));
      //POR DEFECTO SIEMPRE COGE COMO SELECCIONADA LA PRIMERA QUE DEVUELVE LA BASE DE DATOS
      id_pista_seleccionada.value = pistas.value[0].idPista;
      duracion_partida.value = pistas.value[0].duracionPartida;
      pista_automatizada.value =
          (pistas.value[0].automatizada == 1) ? true : false;
      capacidad_pista = pistas.value[0].capacidad;

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
          await db2.obtenerHorariosPistas(idPista, dia_seleccionado);
      if (response.length <= 0) return [];
      List<dynamic> datosPista2 = json.decode(response);
      return datosPista2;
    } catch (error, stack) {
      print('stack: ${stack}');
      print('errorrrrr $error');
      rethrow;
    }
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
}

class SelectionController {
  ValueNotifier<String?> selectedOption = ValueNotifier<String>('');
}
