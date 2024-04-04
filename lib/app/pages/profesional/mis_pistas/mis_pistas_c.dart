import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/server_node/pista_node.dart';
import 'package:reservatu_pista/utils/format_date.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../routes/models/mis_pistas_model.dart';
import '../../../routes/models/pistas_model.dart';

extension FechaExt on DateTime {
  String get formatFecha => FormatDate.dateToString(this);
  String get letraDia => ['L', 'M', 'X', 'J', 'V', 'S', 'D'][weekday - 1];
}

class MisPistasController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<List<PistasModel>> {
  /// Obtencion de los datos de la api
  StateRx<List<MiPista>> misPistas = StateRx(Rx<List<MiPista>>([]));

  /// Controlador para las animaciones
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  /// Controlador para cambiar de paginas en la
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Controladores para el manejo de los dias de la fecha
  final Rx<DateTime> _fecha = Rx<DateTime>(DateTime.now());
  DateTime get fecha => _fecha.value;
  set fecha(DateTime value) => _fecha.value = value;

  /// Declaramos una variable booleana donde false sera previous fecha y true sera next fecha
  final _fechaNextPrevious = false.obs;
  bool get fechaNextPrevious => _fechaNextPrevious.value;
  set fechaNextPrevious(bool value) => _fechaNextPrevious.value == value
      ? _fechaNextPrevious.refresh()
      : _fechaNextPrevious.value = value;

  /// Controlador para cambiar de deporte
  final _deporte = 'Padel'.obs;
  String get deporte => _deporte.value;
  set deporte(String value) => _deporte.value = value;
  // Global key para el cambio del deporte
  List<GlobalKey> deporteKey = List.generate(16, (index) => GlobalKey());
  // Mostrar el width una vez que cargue la pantalla
  Rx<List<double>> deportesWidth =
      Rx<List<double>>(List.generate(16, (index) => 30.0));

  @override
  void onReady() {
    cargarDatos();
    // TODO: implement onReady
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Verifica si el contexto de la GlobalKey es nulo
      final List<double> newDeportesWidth = [];
      for (var i = 0; i < deporteKey.length; i++) {
        if (deporteKey[i].currentContext != null) {
          // Obtiene el ancho del widget utilizando el contexto de la GlobalKey
          double width = deporteKey[i].currentContext!.size!.width;
          newDeportesWidth.add(width);
        }
      }
      deportesWidth.value = newDeportesWidth;
    });
    super.onReady();
  }

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();
    // Cambiar la fecha cuando se actualice y mover el pageview
    debounce(_fechaNextPrevious, (val) => val ? nextPage() : previousPage(),
        time: const Duration(milliseconds: 200));
    // Mandar llamar a la api cargar datos cada vez que se cambie el estado del deporte
    debounce(_deporte, (val) => cargarDatos(),
        time: const Duration(milliseconds: 100));
  }

  /// Método para cargar datos
  void cargarDatos() async {
    misPistas.changeStatus(RxStatusDemo.loading());
    try {
      final result = await PistaNode().getMisPista(deporte, fecha.letraDia);
      if (result is MisPistas) {
        if (result.misPistas.isEmpty) {
          misPistas.change([], RxStatusDemo.empty());
        } else {
          misPistas.change(result.misPistas, RxStatusDemo.success());
        }
      }
    } catch (error) {
      change(null,
          status: RxStatus.error('Error al cargar datos de las pistas.'));
    }
  }

  /// Funciones para el controlador de las paginas para cambiar la pagina de dia
  void nextPageBool() => {
        pageViewController!.jumpToPage(1),
        fechaNextPrevious = true,
      };

  void previousPageBool() =>
      {pageViewController!.jumpToPage(1), fechaNextPrevious = false};

  /// Funciones para el controlador de las paginas para cambiar la pagina de dia
  void nextPage() => {
        pageViewController!.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
        nextDia()
      };

  void previousPage() => {
        pageViewController!.previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
        previousDia()
      };

  /// Funciones para la fecha en este caso para cambiar de dias en el inicio
  void nextDia() => {fecha = fecha.add(const Duration(days: 1)), cargarDatos()};
  void previousDia() =>
      {fecha = fecha.subtract(const Duration(days: 1)), cargarDatos()};

  /// Ver cuando pulsa en algun deporte
  void onPressDeporte(String val) {
    deporte = val;
  }
}
