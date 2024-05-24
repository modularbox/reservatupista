import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/mis_reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/data/provider/execute_node.dart';
import 'package:reservatu_pista/app/data/provider/reservas_node.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/utils/dialog/change_dialog_general.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';

class MisReservasController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DBService db = Get.find();
  final misReservasUsuario = StateRx(Rx<List<MisReservasUsuarioModel>>([]));
  final List<ReservasUsuarios> listReservasUsuarios = [];
  var isLoading = false.obs;
  final _deporte = 'Padel'.obs;
  String get deporte => _deporte.value;
  set deporte(String value) => _deporte.value = value;

  List<GlobalKey> deporteKey = List.generate(
      16, (index) => GlobalKey()); // Asegúrate de tener esta línea
  Rx<List<double>> deportesWidth =
      Rx<List<double>>(List.generate(16, (index) => 30.0));
  late Timer _timer;
  final _tiempo_restante = 0.obs;
  int get tiempo_restante => _tiempo_restante.value;
  set tiempo_restante(int value) => _tiempo_restante.value = value;

  final _currentPage = 1.obs;
  int get currentPage => this._currentPage.value;
  set currentPage(int value) => this._currentPage.value = value;
  final pageHaschanged = false.obs;
  final isThrottling = false.obs;
  int lastPageSelected = 1;
  final int itemsPerPage = 10;
  //bool hasMoreItems = true;
  bool isLoadingData = false;
  late int initialLength;
  Timer? debounceTimer;
  double previousScrollPosition = 0.0;
  final ScrollController scrollController = ScrollController();
  List<String> listaDeportes = RxList([]);
  late List<MisReservasUsuarioModel> globalResult;
  @override
  void onReady() async {
    try {
      await db.getDB();
      obtenerReservasTotales();
      cargarDatos();
    } catch (e) {
      print(e);
    }
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<double> newDeportesWidth = [];
      for (var i = 0; i < deporteKey.length; i++) {
        // Verifica si el contexto de la GlobalKey es nulo
        if (deporteKey[i].currentContext != null) {
          double width = deporteKey[i].currentContext!.size!.width;
          newDeportesWidth.add(width);
        }
      }
      deportesWidth.value = newDeportesWidth;
    });
    /*debounce(_deporte, (val) => cargarDatos(),
        time: const Duration(milliseconds: 100));*/
    debounce(pageHaschanged, (val) => cargarDatos(),
        time: const Duration(milliseconds: 1000));
  }

  // Método para indicar que se está cargando datos
  void startLoading() {
    isLoading.value = true;
  }

  // Método para indicar que se ha completado la carga de datos
  void stopLoading() {
    isLoading.value = false;
  }

  void obtenerReservasTotales() async {
    initialLength = await ExecuteProvider().obtenerTotalReservas();
    print('initialLengthhhhhhh $initialLength');
  }

  Future<void> cargarDatos() async {
    print('entra cargar datos');
    //if (isLoading.value || !hasMoreItems) return;
    if (isLoading.value) return;
    print('entra cargar datos2');
    print('pagee $currentPage');
    print('itemsPerPagee $itemsPerPage');

    try {
      isLoading.value = true;
      misReservasUsuario.loading();
      final result = await ExecuteProvider()
          .misReservas(deporte, page: currentPage, itemsPerPage: itemsPerPage);
      print('entra cargar datos3');
      if (result is List<MisReservasUsuarioModel>) {
        print('entra cargar datos3.2');
        if (result.isEmpty) {
          print('entra cargar datos4');
          misReservasUsuario.empty();
          // hasMoreItems = false;
          return;
        }
        //VOY POR AQUI ALVARO

        for (var i = 0; i < result.length; i++) {
          final element = result[i];

          result[i].reservasUsuarios = await obtenerPlazasLibres(
              element.idPista.toString(),
              element.fechaReserva.toString(),
              //element.fechaReserva.formatReserva,
              element.horaInicio);
          if (listaDeportes.indexOf(element.deporte) == -1)
            listaDeportes.add(element.deporte);
        }
        print('result.length ${result.length}');
        print('listaDeporteslistaDeportes ${listaDeportes}');
        print(
            'missReservasUsuario.rx.value.length ${misReservasUsuario.rx.value.length}');
        misReservasUsuario.success(result);
        //hasMoreItems = result.length == itemsPerPage;
      } else {
        print('entra elseeeeeeeeeeeeeee');
      }
    } catch (e) {
      print('errorrrrrrrrrr $e');
    } finally {
      isLoading.value = false;
      print('entra cargar datos finally');
    }
  }

  void mostrarDatos() {
    isLoading.value = true;
    misReservasUsuario.success(globalResult);
    List<MisReservasUsuarioModel> finalResult = [];
    int length = 10;
    if (itemsPerPage * currentPage > initialLength) {
      print('initialLength $initialLength');
      length = initialLength;
    } else {
      print('currentPagee $currentPage');
      length = itemsPerPage * currentPage;
    }
    print(
        'misReservasUsuario.rx.value.lengthhhh ${misReservasUsuario.rx.value.length}');
    print('lengthh $length');
    for (var i = 0; i < length; i++) {
      finalResult.add(misReservasUsuario.rx.value[i]);
      print('iiii $i');
    }
    if (finalResult.isEmpty) {
      misReservasUsuario.empty();
      //hasMoreItems = false;
      return;
    }
    isLoading.value = false;
    misReservasUsuario.success(finalResult);

    /*if (currentPage == 1) {
      print('ENTRA IGUAL A 1');
      misReservasUsuario.success(result);
      print(
          'misReservasUsuario.rx.value.length ${misReservasUsuario.rx.value.length}');
    } else {
      print('ENTRA ELSE A 1');
      final List<MisReservasUsuarioModel> currentList =
          misReservasUsuario.rx.value;
      misReservasUsuario.success(currentList);
    } */
    //currentPage++;
    //hasMoreItems = finalResult.length == itemsPerPage;
  }

  void loadMoreData() {
    // Añadir un debounce para evitar múltiples llamadas rápidas consecutivas
    cargarDatos();
    print('currentPage');
    print('currentPage $currentPage');
  }

  void onPressDeporte(String val) => {deporte = val};

  Future<void> eliminarReserva(String idReserva) async {
    try {
      final resultEliminarReserva =
          await ReservasProvider().cancelarReserva(idReserva);
      if (!resultEliminarReserva) {
        Get.dialog(ChangeDialogGeneral(
          alertTitle: richTitle("Reserva NO Cancelada"),
          alertSubtitle: richSubtitle(
              'La reserva no se ha podido cancelar ya que el tiempo de cancelación de reservas de esta pista es inferior al tiempo que queda para la partida'),
          textButton: "Cerrar",
          alertType: TypeGeneralDialog.WARNING,
          onPressed: Get.back,
        ));
      } else {
        Get.dialog(ChangeDialogGeneral(
            alertTitle: richTitle("RESERVA CANCELADA"),
            alertSubtitle:
                richSubtitle('¡ENHORABUENA!. LA RESERVA SE HA CANCELADO.'),
            textButton: "Cerrar",
            alertType: TypeGeneralDialog.SUCCESS,
            onPressed: () => {
                  Get.back(),
                  Get.back(),
                }));
      }
      await cargarDatos();
    } catch (e) {
      Get.dialog(ChangeDialogGeneral(
        alertTitle: richTitle("Reserva NO Cancelada"),
        alertSubtitle: richSubtitle('Ha habido un error interno en la app.'),
        textButton: "Cerrar",
        alertType: TypeGeneralDialog.ERROR,
        onPressed: () => Get.back(),
      ));
      throw e;
    }
  }

  void empezarFechaRestante(int tiempoRestante) {
    try {
      _timer.cancel();
    } catch (e, st) {
      print('e: $e');
      print('st $st');
    }

    tiempo_restante = tiempoRestante;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      tiempo_restante = tiempo_restante - 1000;
    });
    // fecha = fechaRestante;
    // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   fecha = fecha!.subtract(const Duration(seconds: 1));
    // });
  }

  Future<ReservasUsuarios?> obtenerPlazasLibres(
      String idPista, String fecha, String horaInicio) async {
    try {
      final result = await ReservasProvider()
          .obtenerPlazasLibres(idPista, fecha, horaInicio);
      if (result is ReservasUsuarios) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  DateTime construirDatetime(DateTime fecha, String horaInicio) {
    final hora = int.parse(horaInicio.substring(0, 2));
    final minutos = int.parse(horaInicio.substring(3, 5));
    DateTime fechaConHora = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      hora,
      minutos,
      0,
    );
    return fechaConHora;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
