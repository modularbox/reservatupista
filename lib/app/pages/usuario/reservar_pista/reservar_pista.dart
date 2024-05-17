import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/datos_reservas_pista.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import './widgets/build_usuarios.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/calendar/src/models/calendar_config.dart';
import 'package:reservatu_pista/utils/calendar/src/widgets/calendar_date_picker2.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/buttons_sounds.dart';
import '../../../../utils/colores.dart';
import '../../../../utils/dialog/terminos_condiciones_dialog.dart';
import '../../../../utils/search_droptown/dropdown_search.dart';
import './reservar_pista_c.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';
import '../../../../utils/sizer.dart';
import '../../../../utils/format_date.dart';
import '/backend/schema/enums/enums.dart';
import 'controllers/db_alvaro_c.dart';
import 'widgets/input_club_favoritos.dart';
import 'widgets/input_select.dart';

class ReservarPistaPage extends GetView<ReservarPistaController> {
  ReservarPistaPage({super.key});

  ReservarPistaController get self => controller;
  final DBAlvaroController db = Get.find();

  bool estaAutomatizada(idPista) {
    List pistas = self.pistas.value;
    for (int i = 0; i < pistas.length; i++) {
      if (pistas[i]['id_pista'] == idPista) {
        print("pistas[i]['automatizada'] ${pistas[i]['automatizada']}");
        return pistas[i]['automatizada'] == 1;
      }
    }
    return false;
  }

  int obtenerDuracionPartida(idPista) {
    List pistas = self.pistas.value;
    for (int i = 0; i < pistas.length; i++) {
      if (pistas[i]['id_pista'] == idPista) {
        return pistas[i]['duracion_partida'];
      }
    }
    return 60;
  }

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Reservar Pista',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: ResponsiveWeb(
            child: Column(
              children: [
                Column(
                  key: controller.keyInputs,
                  children: [
                    buildInputLocalidades(),
                    5.0.sh,
                    Obx(buildInputClubs),
                    5.0.sh,
                    Obx(buildInputDeportes),
                    5.0.sh
                  ],
                ),
                Obx(buildCalendar),
                Obx(buildPistas),
                Obx(buildFechasHorarios),
                SizedBox(
                  key: controller.keyDatos,
                  child: Obx(
                    () => self.selectHorario.value == null
                        ? 0.0.empty
                        : Opacity(
                            opacity:
                                self.selectHorario.value == null ? 0.0 : 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Column(children: [
                                ..._buildDatos(
                                    self.localidad_seleccionada.value,
                                    self.deporte_seleccionado.value,
                                    self.id_pista_seleccionada.value,
                                    self.pista_con_luces.value,
                                    self.pista_automatizada.value,
                                    DateTime(
                                        self.fecha_seleccionada.value.year,
                                        self.fecha_seleccionada.value.month,
                                        self.fecha_seleccionada.value.day,
                                        int.parse(self
                                            .hora_inicio_reserva_seleccionada
                                            .value
                                            .substring(0, 2)),
                                        int.parse(self
                                            .hora_inicio_reserva_seleccionada
                                            .value
                                            .substring(3, 5))),
                                    self.fecha_seleccionada.value,
                                    self.duracion_partida.value,
                                    self.precio_con_luz_no_socio.value,
                                    self.precio_con_luz_socio.value,
                                    self.precio_sin_luz_no_socio.value,
                                    self.precio_sin_luz_socio.value),
                              ]),
                            ),
                          ),
                  ),
                ),
                Obx(() => self.sizedBoxHeight.value.sh),
                50.0.sh,
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Input de las pistas
  Widget buildInputLocalidades() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
        height: 45,
        child: Obx(() => self.localidades.value.isEmpty
            ? const SizedBox.shrink()
            : DropdownSearch<String>(
                onChanged: (value) {
                  if (value != null) {
                    self.cod_postal.value = self.mapLocalidades[value] ?? '';
                    self.localidad_seleccionada.value = value;
                    self.deporte_seleccionado.value = '';
                    self.selectDay.value = null;
                    self.selectHorario.value = null;
                    print(
                        'self.selectNombreLocalidad.value ${self.localidad_seleccionada.value}');
                    self.generarListaClubes(self.cod_postal.value);
                    print('self.clubes.value ${self.clubes.value}');
                    //self.generarListaClubes(self.cod_postal.value);
                  }
                },
                popupProps: PopupProps.menu(
                  emptyBuilder: (context, searchEntry) =>
                      const Center(child: Text('No se encontraron resultados')),
                  showSelectedItems: true,
                  showSearchBox: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: self.localidades.value,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: 'Localidad',
                    hintText: "Selecciona la localidad.",
                    labelStyle: LightModeTheme().labelMedium,
                    hintStyle: LightModeTheme().labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: LightModeTheme().alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: LightModeTheme().primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: LightModeTheme().error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: LightModeTheme().error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                ),
              )),
      ),
    );
  }

  /// Input de los Clubss
  Widget buildInputClubs() {
    return InputClubFavorito(
      controller: self.clubController,
      focusNode: self.clubFocusNode,
      context: Get.context!,
      labelText: 'Club',
      onChanged: (val, favorito) {
        self.deporteController.text = '';
        String idClub = self.mapClubes[val] ?? '';
        self.generarListaDeportes(idClub);
        self.id_club_seleccionado.value = idClub;
        self.selectDay.value = null;
      },
      clubsFavoritos: const [false, false],
      itemsDD: self.clubes.value,
    );
  }

  // Input Deportes
  Widget buildInputDeportes() {
    return InputSelect(
      controller: self.deporteController,
      focusNode: self.deporteFocusNode,
      context: Get.context!,
      labelText: 'Deporte',
      onChanged: (val) {
        self.deporte_seleccionado.value = val;
        self.generarListaPistas(
            self.id_club_seleccionado.value, self.deporte_seleccionado.value);
        self.selectDay.value = null;
        self.selectDay.refresh();
      },
      itemsDD: self.deportes.value,
    );
  }

  // Widget Calendar
  Widget buildCalendar() {
    return self.deporte_seleccionado.value == ''
        ? 0.0.empty
        : Calendar(
            key: self.keyCalendar,
            config: CalendarConfig(
                dayBorderRadius: const BorderRadius.all(Radius.zero),
                currentDate: DateTime.now(),
                selectDayConfig: self.selectDateDay.value,
                controlsTextStyle:
                    LightModeTheme().titleLarge.copyWith(color: Colors.white)),
            value: [DateTime.now()],
            onValueChanged: (position, dayDate) {
              self.fecha_seleccionada.value =
                  DateTime(dayDate.year, dayDate.month, dayDate.day);
              self.selectHorario.value = null;
              self.selectDateDay.value = dayDate;
              self.selectDay.value = position;
              if (self.selectPista.value == 0) {
                self.selectPista.refresh();
              } else {
                self.selectPista.value = 0;
              }
              print(
                  'cambia self.selectDateDay.value ${self.selectDateDay.value}');
              print('cambia self.selectDay.value ${self.selectDay.value}');
            },
          );
  }

  // Widget Pistas
  Widget buildPistas() {
    return SizedBox(
        key: self.keyPistas,
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                self.pistas.value.length,
                //generateLista.length,
                (index) => buildChip(
                    self.pistas.value[index]['id_pista'].toString(),
                    self.pistas.value[index]
                        ['imagen_patrocinador'], //generateLista[index],
                    index)).divide(3.0.sw).around(4.0.sw),
          ),
        )).visible(self.selectDay.value != null);
  }

  Widget buildFechasHorarios() {
    final Widget buildFechaHorarios = Column(
      children: [
        Container(
          // width: Get.width * 0.3,
          color: Colors.green,
          child: Row(
            children: [
              BtnIcon(
                onPressed: () {
                  self.pageViewController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                hoverColor: Colores.usuario.primary69,
                borderRadius: 25,
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 25),
              ),
              Expanded(
                child: Text(
                  self.selectDateDay.value != null
                      ? FormatDate.dateToString(DateTime(
                          self.selectDateDay.value!.year,
                          self.selectDateDay.value!.month,
                          self.selectDateDay.value!.day))
                      : FormatDate.dateToString(DateTime(DateTime.now().year,
                          DateTime.now().month, DateTime.now().day)),
                  textAlign: TextAlign.center,
                  style: LightModeTheme().bodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
              BtnIcon(
                onPressed: () {
                  self.pageViewController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                hoverColor: Colores.usuario.primary69,
                borderRadius: 28,
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 28),
              ),
            ],
          ),
        ),
        FutureBuilder<Widget>(
          future: enviarHorarios(
              self.id_pista_seleccionada.value,
              DateTime(
                  self.fecha_seleccionada.value.year,
                  self.fecha_seleccionada.value.month,
                  self.fecha_seleccionada.value
                      .day)), // Aquí debes pasar el id de la pista correcto
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print(111111);
              // Mientras se carga la lista de widgets
              return const CircularProgressIndicator(); // Puedes mostrar un indicador de carga
            } else if (snapshot.hasError) {
              print(11111111);
              // Si hay un error al cargar la lista de widgets
              return Text('Errorr: ${snapshot.error}');
            } else {
              print(11111111111);
              return snapshot.data!;
            }
          },
        ),
      ],
    );

    return Container(
      key: self.keyHorarios,
      child: SizedBox(
        width: 100.w,
        height: 210,
        child: PageView(
          controller: self.pageViewController,
          scrollDirection: Axis.horizontal,
          children: [buildFechaHorarios],
        ),
      ).visible(self.selectDay.value != null),
    );
  }

  bool todoOcupado(List<Horario> list) {
    bool todoOcupadoHorario = true;
    for (var i = 0; i < list.length; i++) {
      if (list[i].estatus == TypeEstadoHorario.cerrada) {
        todoOcupadoHorario = false;
        break;
      }
    }
    return todoOcupadoHorario;
  }

  Widget buildChip(
    String idPista,
    String fotoPista,
    int index,
  ) {
    print('id_pistaaa $idPista');
    print('foto_pista $fotoPista');
    try {
      return Obx(() {
        final bool isSelect = index == self.selectPista.value;
        print('foto_pista $fotoPista');
        return Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 108,
                  height: 20,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                  child: Center(
                    child: Text(
                      'Pista ${(index + 1)}',
                      textAlign: TextAlign.center,
                      style: LightModeTheme().bodyMedium.copyWith(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  width: 108,
                  height: 65,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      '${DatosServer.urlServer}/images_pista/$fotoPista.png',
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
            BtnIcon(
                onPressed: () {
                  self.selectHorario.value = null;
                  self.selectPista.value = index;
                  self.selectDay.refresh();
                  //alvaro

                  print('idddd_pista $idPista');
                  self.id_pista_seleccionada.value = int.parse(idPista);

                  self.pista_automatizada.value =
                      estaAutomatizada(self.id_pista_seleccionada.value);

                  self.duracion_partida.value =
                      obtenerDuracionPartida(self.id_pista_seleccionada.value);
                  print(
                      'self.duracion_partida.valu ${self.duracion_partida.value}');
                  enviarHorarios(self.id_pista_seleccionada.value,
                      self.fecha_seleccionada.value);
                },
                hoverColor: Colores.usuario.primary69,
                padding: const EdgeInsets.all(0),
                fillColor: Colors.transparent,
                borderWidth: isSelect ? 2 : 1,
                borderColor: isSelect
                    ? Colores.usuario.primary
                    : const Color.fromARGB(255, 0, 0, 0),
                borderRadius: 5,
                width: 108,
                height: 85,
                icon: 0.0.empty),
          ],
        );
      });
    } catch (error, stack) {
      print(error);
      print(stack);
      rethrow;
    }
  }

  Future<Widget> enviarHorarios(int idPista, DateTime diaActual) async {
    List<dynamic> datosPistaJson =
        await self.generarListaHorarios(idPista, diaActual);
    print('datosPistaJson $datosPistaJson');
    List<Horario> arrayHorarios = [];
    for (var i = 0; i < datosPistaJson.length; i++) {
      TypeEstadoHorario status;
      switch (datosPistaJson[i]['estado']) {
        /*case 'ABIERTA':
          status = TypeEstadoHorario.abierta;
          break;*/
        case 'CERRADA':
          status = TypeEstadoHorario.cerrada;
          break;
        case 'RESERVADA_CLASE':
          status = TypeEstadoHorario.reservadaClase;
          break;
        case 'RESERVADA_PARCIAL':
          status = TypeEstadoHorario.reservadaParcial;
          break;
        case 'RESERVADA_COMPLETA':
          status = TypeEstadoHorario.reservada;
          break;
        case 'RESERVA_EN_PROCESO':
          status = TypeEstadoHorario.reservaEnProceso;
          break;
        default:
          status = TypeEstadoHorario.abierta;
          break;
      }
      arrayHorarios.add(Horario(
          horario: datosPistaJson[i]['hora'],
          estatus: status,
          precio_con_luz_no_socio: datosPistaJson[i]['precio_con_luz_no_socio'],
          precio_con_luz_socio: datosPistaJson[i]['precio_con_luz_socio'],
          precio_sin_luz_no_socio: datosPistaJson[i]['precio_sin_luz_no_socio'],
          precio_sin_luz_socio: datosPistaJson[i]['precio_sin_luz_socio'],
          luces: datosPistaJson[i]['luz']));
    }
    print('array_horarios $arrayHorarios');
    return buildHorarios(arrayHorarios, true);
  }

  Widget buildHorarios(List<Horario> horarios, bool verHorarios) {
    Future<void> onPressedHorario(
        int index, String textHorario, String termino) async {
      print("onPressedHorario ------------");
      self.pista_con_luces.value = horarios[index].luces;
      self.precio_con_luz_no_socio.value =
          horarios[index].precio_con_luz_no_socio ?? 0;
      self.precio_con_luz_socio.value =
          horarios[index].precio_con_luz_socio ?? 0;
      self.precio_sin_luz_no_socio.value =
          horarios[index].precio_sin_luz_no_socio ?? 0;
      self.precio_sin_luz_socio.value =
          horarios[index].precio_sin_luz_socio ?? 0;
      self.hora_inicio_reserva_seleccionada.value = textHorario;
      int horaHoraInicio = int.parse(
          self.hora_inicio_reserva_seleccionada.value.substring(0, 2));
      int minutosHoraInicio = int.parse(
          self.hora_inicio_reserva_seleccionada.value.substring(3, 5));
      //PARA SETEAR LA HORA FIN
      DateTime horaInicial = DateTime(
          self.fecha_seleccionada.value.year,
          self.fecha_seleccionada.value.month,
          self.fecha_seleccionada.value.day,
          horaHoraInicio,
          minutosHoraInicio,
          0);
      DateTime horaFin =
          horaInicial.add(Duration(minutes: self.duracion_partida.value));
      self.hora_fin_reserva_seleccionada.value =
          horaFin.toString().substring(11, 19);
      self.selectHorario.value = HorarioFinInicio(
          inicio: textHorario,
          termino: termino,
          typeEstadoHorario: TypeEstadoHorario.abierta);

      await self.obtenerPlazasLibres();
    }

    if (verHorarios) {
      return Column(
          children: List.generate(1, (col) {
        final List<Widget> rows = [];

        for (var i = 0; i < horarios.length; i = i + 4) {
          rows.add(Obx(() => Row(
                  children: List<Widget>.generate(4, (row) {
                if ((row + i) < horarios.length) {
                  final String textHorario =
                      horarios[row + i].horario.formatHora;
                  final isSelect =
                      self.hora_inicio_reserva_seleccionada.value ==
                          textHorario;
                  final String termino = (row + i + 1) == horarios.length
                      ? "00:00"
                      : horarios[row + i + 1].horario;
                  if (horarios[row + i].estatus == TypeEstadoHorario.cerrada) {
                    return Flexible(
                      child: BtnIcon(
                          padding: const EdgeInsets.all(0),
                          height: 40,
                          fillColor: Colors.grey, //Colores().proveedor.primary,
                          borderRadius: isSelect ? 30 : null,
                          borderColor:
                              isSelect ? Colores.usuario.primary : Colors.white,
                          borderWidth: isSelect ? 2 : 0.5,
                          hoverColor: Colores.usuario.primary69,
                          onPressed: null,
                          icon: Center(
                              child: Text(
                            textHorario,
                            style: LightModeTheme().bodySmall.copyWith(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                          ))),
                    );
                  } else if (horarios[row + i].estatus ==
                      TypeEstadoHorario.abierta) {
                    return Flexible(
                      child: BtnIcon(
                          padding: const EdgeInsets.all(0),
                          height: 40,
                          fillColor: Colors.greenAccent,
                          borderRadius: isSelect ? 30 : null,
                          borderColor:
                              isSelect ? Colores.usuario.primary : Colors.white,
                          borderWidth: isSelect ? 2 : 0.5,
                          hoverColor: Colores.usuario.primary69,
                          onPressed: () async => await onPressedHorario(
                              row + 1, textHorario, termino),
                          icon: Center(
                              child: Text(
                            textHorario,
                            style: LightModeTheme().bodySmall.copyWith(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                          ))),
                    );
                  } else if (horarios[row + i].estatus ==
                      TypeEstadoHorario.reservada) {
                    return Flexible(
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colores.rojo,
                                border: Border.all(
                                    width: 0.5, color: Colors.white)),
                            child: Center(
                                child: Text(
                              textHorario,
                              style: LightModeTheme().bodySmall.copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            ))));
                    //alvaro
                  } else if (horarios[row + i].estatus ==
                      TypeEstadoHorario.reservadaClase) {
                    return Flexible(
                        child: BtnIcon(
                            padding: const EdgeInsets.all(0),
                            height: 40,
                            fillColor: Colors
                                .purpleAccent, //Colores().proveedor.primary,
                            borderRadius: isSelect ? 30 : null,
                            borderColor: isSelect
                                ? Colores.usuario.primary
                                : Colors.white,
                            borderWidth: isSelect ? 2 : 0.5,
                            hoverColor: Colores.usuario.primary69,
                            onPressed: null,
                            icon: Center(
                                child: Text(
                              textHorario,
                              style: LightModeTheme().bodySmall.copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            ))));
                  } else if (horarios[row + i].estatus ==
                      TypeEstadoHorario.reservadaParcial) {
                    return Flexible(
                        child: BtnIcon(
                            padding: const EdgeInsets.all(0),
                            height: 40,
                            // width: widthHorario,
                            fillColor: Colores.orange,
                            borderRadius: isSelect ? 30 : null,
                            borderColor: isSelect
                                ? Colores.usuario.primary
                                : Colors.white,
                            borderWidth: isSelect ? 2 : 0.5,
                            hoverColor: Colores.usuario.primary69,
                            onPressed: () async {
                              self.hora_inicio_reserva_seleccionada.value =
                                  textHorario;
                              self.pista_con_luces.value =
                                  horarios[row + i].luces;
                              self.precio_con_luz_no_socio.value =
                                  horarios[row + i].precio_con_luz_no_socio ??
                                      0;
                              self.precio_con_luz_socio.value =
                                  horarios[row + i].precio_con_luz_socio ?? 0;
                              self.precio_sin_luz_no_socio.value =
                                  horarios[row + i].precio_sin_luz_no_socio ??
                                      0;
                              self.precio_sin_luz_socio.value =
                                  horarios[row + i].precio_sin_luz_socio ?? 0;

                              self.hora_inicio_reserva_seleccionada.value =
                                  textHorario;
                              self.selectHorario.value = HorarioFinInicio(
                                  inicio: textHorario,
                                  termino: termino,
                                  typeEstadoHorario: TypeEstadoHorario.abierta);

                              self.hora_inicio_reserva_seleccionada.value =
                                  textHorario;
                              int horaHoraInicio = int.parse(self
                                  .hora_inicio_reserva_seleccionada.value
                                  .substring(0, 2));
                              int minutosHoraInicio = int.parse(self
                                  .hora_inicio_reserva_seleccionada.value
                                  .substring(3, 5));
                              //PARA SETEAR LA HORA FIN
                              DateTime horaInicial = DateTime(
                                  self.fecha_seleccionada.value.year,
                                  self.fecha_seleccionada.value.month,
                                  self.fecha_seleccionada.value.day,
                                  horaHoraInicio,
                                  minutosHoraInicio,
                                  0);
                              DateTime horaFin = horaInicial.add(Duration(
                                  minutes: self.duracion_partida.value));
                              printError(info: horaFin.toString());
                              printError(
                                  info: horaFin.toString().substring(11, 19));
                              self.hora_fin_reserva_seleccionada.value =
                                  horaFin.toString().substring(11, 18);
                              self.obtenerPlazasLibres();
                            },
                            icon: Center(
                                child: Text(
                              textHorario,
                              style: LightModeTheme().bodySmall.copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            ))));
                  }
                  return Flexible(
                      child: Container(
                          height: 40,
                          // width: widthHorario,
                          decoration: BoxDecoration(
                              color: const Color(0xffc0c0c0),
                              border:
                                  Border.all(width: 0.5, color: Colors.white)),
                          child: Center(
                              child: Text(
                            textHorario,
                            style: LightModeTheme().bodySmall.copyWith(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                          ))));
                } else {
                  return const Flexible(
                    child: SizedBox(
                      height: 40,
                    ),
                  );
                }
              }))));
        }
        return Column(
          children: rows,
        );
      }));
    } else {
      return Container();
    }
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: self.onConfirmar,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(192, 0, 255, 123)),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(130, 20), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: const Center(
        child: Text(
          "Confirmar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildCancelar() {
    return ElevatedButton(
      onPressed: self.selectHorario.value == null
          ? null
          : () {
              self.selectHorario.value = null;
              ButtonsSounds.playSound();
            },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(211, 255, 48, 48)),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(130, 20), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: const Center(
        child: Text(
          "Cancelar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> _buildDatos(
      String localidad,
      String deporte,
      int numPista,
      bool luz,
      bool automatizada,
      DateTime fechaHoraInicio,
      DateTime fechaHoraFin,
      int duracionPartida,
      int precioConLuzNoSocio,
      int precioConLuzSocio,
      int precioSinLuzNoSocio,
      int precioSinLuzSocio) {
    final List<Widget> list = [];

    int precioReserva = luz ? precioConLuzNoSocio : precioSinLuzNoSocio;
    self.precio_a_mostrar.value =
        precioReserva * self.usuario.value.plazasReservadas;

    final datos = [
      "Localidad",
      "Deporte",
      "N° de pista",
      'Luz',
      'Automatizada',
      "Comienza",
      "Finaliza",
      "Duración",
      "Precio",
      "Descuento"
    ];
    const double fontSize = 13;
    final List<String> datosList = [
      localidad,
      deporte,
      numPista.toString(),
      luz ? 'Si' : 'No',
      automatizada ? 'Si' : 'No',
      fechaHoraInicio.toString().substring(0, 16),
      '${fechaHoraFin.toString().substring(0, 10)} ${self.hora_fin_reserva_seleccionada.value.formatHora}',
      '${duracionPartida.toString()} minutos.',
      '${double.parse((self.precio_a_mostrar.value / 100).toString())} €',
      "code"
    ];
    list.add(SizedBox(width: 100.w, child: const SelectedUsuarios()));
    for (var i = 0; i < datos.length; i++) {
      if (datosList[i] == "code") {
        list.add(
          Container(
            width: 100.w,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 115,
                  child: Text("${datos[i]}:",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Color(0xff4c4c4c))),
                ),
                Expanded(
                  child: SizedBox(
                    child: TextFormField(
                      controller: controller.codigoDescuentoController,
                      maxLength: 10,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Usa aquí el cupón descuento',
                        hintStyle: TextStyle(
                          fontSize: fontSize,
                        ),
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC0D914))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        list.add(
          Container(
            // width: Get.width * 0.3,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                SizedBox(
                  width: 115,
                  child: Text("${datos[i]}:",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Color(0xff4c4c4c))),
                ),
                Expanded(
                  child: datos[i] == 'Precio'
                      ? Obx(() => Text(
                          '${double.parse((self.precio_a_mostrar.value / 100).toString())} €',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          )))
                      : Text(datosList[i],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          )),
                ),
              ],
            ),
          ),
        );
      }
    }
    list.add(const SizedBox(
      height: 5,
    ));
    list.add(
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SelectionWidget(
                label: 'Monedero Virtual',
                value: self.db.dineroTotal > 0 ? 'monedero' : '0',
                controller: self.selectionController,
                self: self,
              ),
            ),
            Flexible(
              child: SelectionWidget(
                label: 'Tarjeta',
                value: self.capacidad_pista == self.plazas_a_reservar.value
                    ? 'tarjeta'
                    : '00',
                controller: self.selectionController,
                self: self,
              ),
            ),
          ],
        ),
      ),
    );
    list.add(const SizedBox(
      height: 5,
    ));
    list.add(
      TerminosCondicionesDialog(
        self.animTerminos,
        self.checkboxTerminos,
        Colores.proveedor.primary,
        self.validateTerminos,
        LightModeTheme().primaryText,
        saltoLinea: true,
      ),
    );
    list.add(const SizedBox(
      height: 5,
    ));
    list.add(SizedBox(
      width: 100.w - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildButton(), const SizedBox(width: 40), buildCancelar()],
      ),
    ));
    return list;
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class SelectionWidget extends StatelessWidget {
  final String label;
  final String value;
  final SelectionController controller;
  final ReservarPistaController self;
  const SelectionWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.controller,
      required this.self});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller.selectedOption,
      builder: (context, selectedValue, _) {
        bool isSelected = selectedValue == value;

        return BtnIcon(
          onPressed: () {
            if (value == 'tarjeta') {
              print('entraaaaaaaaa tarjeta');
            } else if (value == '00') {
              print('entraaaaaaaaa 00');
              if (self.plazas_a_reservar.value != self.capacidad_pista) {
                print(
                    'entraaaaaaaaa db.plazas_a_reservar.value != db.capacidad_pista');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error al seleccionar método de pago'),
                      content: const Text(
                          'Para reservar con tarjeta necesitas ocupar todas las plazas de la pista.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta cuando se presione el botón "Aceptar"
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              }
            } else if (value == '0') {
              //if(db.plazasLibres)
              if (self.db.dineroTotal <= 0) {
                // es igual que value == '0' ya que comparo lo mismo al enviarle el value
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Falta de créditos'),
                      content: const Text(
                          'Necesitas recargar créditos en tu monedero virtual.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta cuando se presione el botón "Aceptar"
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              } else if (self.db.dineroTotal < self.precio_a_mostrar.value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Saldo insuficiente'),
                      content: const Text(
                          'El precio de la reserva es superior al dinero de su monedero virtual'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta cuando se presione el botón "Aceptar"
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              }
            }
            if (value != '0' && value != '00')
              controller.selectedOption.value = value;
            print(
                'controller.selectedOption.value ${controller.selectedOption.value}');
          },
          icon: Container(
            // width: (Get.width - 30) / 2,
            height: 50,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Icon(
                        Icons.credit_card,
                        size: 25,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Center(
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 13,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  self.db.dineroTotal.euro,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ).visible(value == 'monedero')
              ],
            ),
          ),
        );
      },
    );
  }
}
