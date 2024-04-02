import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/buttons_sounds.dart';
import '../../../../utils/colores.dart';
import '../../../../utils/dialog/rich_alert_flutterflow.dart';
import '../../../../utils/dialog/terminos_condiciones_dialog.dart';
import '../../../../utils/search_droptown/dropdown_search.dart';
import '../../../../utils/server/image_server.dart';
import '../../../routes/models/datos_reservas_pista.dart';
import './reservar_pista_c.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';
import '../../../../utils/sizer.dart';
import '../../../../utils/calendar/calendar.dart';
import '../../../../utils/format_date.dart';
import '/backend/schema/enums/enums.dart';
import 'widgets/input_club_favoritos.dart';
import 'widgets/input_select.dart';
import '../../../routes/database.dart';

class ReservarPistaPage extends GetView<ReservarPistaController> {
  ReservarPistaController get self => controller;
  final SelectionController controller2 = SelectionController();
  final DatabaseController db = Get.find();

  //final listaLocalidades
  List<String> generateListClubs() {
    final clubs = self.selectLocalidad.value == null
        ? []
        : self.db.datosReserva.reservas[self.selectLocalidad.value!].clubs;
    final List<String> listFavoritos = [];
    final List<String> listNoFavoritos = [];
    for (var i = 0; i < clubs.length; i++) {
      if (clubs[i].favorito) {
        listFavoritos.add(clubs[i].name);
      } else {
        listNoFavoritos.add(clubs[i].name);
      }
    }
    return listFavoritos + listNoFavoritos;
  }

  List<bool> generateListClubsBool() {
    final clubs = self.selectLocalidad.value == null
        ? []
        : self.db.datosReserva.reservas[self.selectLocalidad.value!].clubs;
    final List<bool> listFavoritos = [];
    final List<bool> listNoFavoritos = [];
    for (var i = 0; i < clubs.length; i++) {
      if (clubs[i].favorito) {
        listFavoritos.add(true);
      } else {
        listNoFavoritos.add(false);
      }
    }

    return listFavoritos + listNoFavoritos;
  }

  List<String> generateListClubsFavoritos() {
    List<String> list = self.db.datosReserva.clubsFavoritos
        .map<String>((e) => self
            .db.datosReserva.reservas[e.indexLocalidad].clubs[e.indexClub].name)
        .toList();
    return list;
  }

  List<bool> generateListClubsFavoritosBool() {
    List<bool> list = self.db.datosReserva.clubsFavoritos
        .map<bool>((e) => self.db.datosReserva.reservas[e.indexLocalidad]
            .clubs[e.indexClub].favorito)
        .toList();
    return list;
  }

  void reservarPistaF() async {
    bool response = await db.subtractUserMoney(db.idUsuario, 4);
    if (response == true) {
      db.getMoney();
      Get.back();
      Get.defaultDialog(
        title: "Reserva exitosa",
        middleText: "La pista se ha reservado correctamente.",
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed('/monederoVirtual');
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    } else {
      Get.defaultDialog(
        title: "Error al reservar pista",
        middleText: "La pista no se ha podido reservar.",
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Cierra la alerta
            },
            child: Text('Aceptar'),
          ),
        ],
      );
    }
  }

  List<String> generateListDeporte() {
    List<String> list = self
        .db
        .datosReserva
        .reservas[self.selectLocalidad.value!]
        .clubs[self.selectClub.value!]
        .deportes
        .map<String>((e) => e.name)
        .toList();
    return list;
  }

  List<Pista> generateListPistas() {
    print('listaaaa');
    List<Pista> list = self.selectDay.value == null
        ? []
        : [
            Pista(name: 'name', image: 'image', horarios: [
              Horario(horario: 'horario', estatus: TypeEstadoHorario.abierta)
            ]),
            Pista(name: 'name', image: 'image', horarios: [
              Horario(horario: 'horario', estatus: TypeEstadoHorario.abierta)
            ])
          ];
    print('listaaaa222');
    /*self
            .db
            .datosReserva
            .reservas[self.selectLocalidad.value!]
            .clubs[self.selectClub.value!]
            .deportes[self.selectDeporte.value!]
            .semana[self.selectDay.value!]
            .pistas;*/

    return list;
  }

  List<Horario> generateListHorarios() {
    List<Horario> list = self.selectPista.value == null
        ? []
        : self
            .db
            .datosReserva
            .reservas[self.selectLocalidad.value!]
            .clubs[self.selectClub.value!]
            .deportes[self.selectDeporte.value!]
            .semana[self.selectDay.value!]
            .pistas[self.selectPista.value!]
            .horarios;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return NavbarYAppbarUsuario(
      title: 'Reservar Pista',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Container(
            constraints: BoxConstraints(minWidth: 300),
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: Column(
              children: [
                Column(
                  key: controller.keyInputs,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10, 10.0, 10.0, 5.0),
                      child: SizedBox(
                        height: 45,
                        child: Obx(() => DropdownSearch<String>(
                              onChanged: (value) {
                                if (value != null) {
                                  self.cod_postal.value = self
                                          .mapLocalidades[value] ??
                                      ''; // Usar .value para asignar un valor a un Rx<String>
                                  print('value ${self.mapLocalidades[value]}');
                                  self.generarListaClubes(
                                      self.cod_postal.value);
                                  print(
                                      'self.clubes.value ${self.clubes.value}');
                                  //self.generarListaClubes(self.cod_postal.value);
                                }
                              },
                              popupProps: PopupProps.menu(
                                emptyBuilder: (context, searchEntry) =>
                                    const Center(
                                        child: Text(
                                            'No se encontraron resultados')),
                                showSelectedItems: true,
                                showSearchBox: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              selectedItem: self.selectedItemDeporte.value,
                              items: self.localidades.value,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: 'Localidad',
                                  hintText: "Selecciona la localidad.",
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Obx(() {
                      final List<bool> listaFavoritosBool = self
                          .db.datosReserva.clubsFavoritos
                          .map<bool>((e) => self
                              .db
                              .datosReserva
                              .reservas[e.indexLocalidad]
                              .clubs[e.indexClub]
                              .favorito)
                          .toList();
                      if (self.selectLocalidad.value == null) {
                        final clubsFavoritos =
                            self.db.datosReserva.clubsFavoritos;
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10.0, 10.0, 5.0),
                          child: Obx(() => InputClubFavorito(
                                controller: self.clubController,
                                focusNode: self.clubFocusNode,
                                context: context,
                                labelText: 'Club',
                                onChanged: (val, favorito) {
                                  print('cambia clubbbbbbbb');

                                  String id_club = self.mapClubes[val] ?? '';
                                  self.generarListaDeportes(id_club);
                                  self.id_club_seleccionado.value = id_club;
                                },
                                clubsFavoritos: [false, false],
                                itemsDD: self.clubes.value,
                              )),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10.0, 10.0, 5.0),
                        child: InputSelect(
                          controller: self.deporteController,
                          focusNode: self.deporteFocusNode,
                          context: context,
                          labelText: 'Deporte',
                          onChanged: (val) {
                            print('valllll $val');
                            self.deporte_seleccionado.value = val;
                            self.generarListaPistas(
                                self.id_club_seleccionado.value,
                                self.deporte_seleccionado.value);
                          },
                          itemsDD: self.deportes.value,
                        ),
                      );
                    }),
                    5.0.sh
                  ],
                ),
                Obx(() => self.deporte_seleccionado.value == ''
                    ? 0.0.empty
                    : Calendar(
                        key: self.keyCalendar,
                        config: CalendarConfig(
                            dayBorderRadius:
                                const BorderRadius.all(Radius.zero),
                            currentDate: DateTime.now(), //self.fechaActual,
                            selectDayConfig:
                                DateTime.now(), //self.selectDateDay.value,
                            controlsTextStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .copyWith(color: Colors.white)),
                        value: [
                          DateTime.now()
                        ], //self.singleDatePickerValueWithDefaultValue,
                        onValueChanged: (position, dayDate) {
                          print('onvaluechanged');

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
                          print(
                              'cambia self.selectDay.value ${self.selectDay.value}');
                        },
                      )),
                Obx(
                  () => self.selectDay.value == null
                      ? 0.0.empty
                      : Builder(builder: (BuildContext context) {
                          final generateLista = generateListPistas();
                          final generateLista2 = self.generarListaPistas(
                              self.id_club_seleccionado.value,
                              self.deporte_seleccionado.value);
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
                                          context,
                                          self.pistas.value[index]['id_pista']
                                              .toString(),
                                          self.pistas.value[index][
                                              'imagen_patrocinador'], //generateLista[index],
                                          index)).divide(3.0.sw).around(4.0.sw),
                                ),
                              ));
                        }),
                ),
                Container(
                  key: self.keyHorarios,
                  child: Obx(() {
                    if (self.selectDay.value == null) {
                      return 0.0.empty;
                    }
                    print('self.selectDay.value ${self.selectDay.value}');
                    final List<Widget> buildFechaHorarios = List.generate(
                        self.tiempoReservaListaCalendar.length,
                        (index) => Column(
                              children: [
                                Container(
                                  width: 100.w,
                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      index == 0
                                          ? const SizedBox(
                                              width: 25,
                                            )
                                          : BtnIcon(
                                              onPressed: () {
                                                self.pageViewController
                                                    .previousPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.linear);
                                              },
                                              hoverColor:
                                                  Colores().usuario.primary69,
                                              borderRadius: 25,
                                              icon: const Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.white,
                                                  size: 25),
                                            ),
                                      Expanded(
                                        child: Text(
                                          self.selectDateDay.value != null
                                              ? FormatDate.dateToString(
                                                  DateTime(
                                                      self.selectDateDay.value!
                                                          .year,
                                                      self.selectDateDay.value!
                                                          .month,
                                                      self.selectDateDay.value!
                                                          .day))
                                              : FormatDate.dateToString(
                                                  DateTime(
                                                      DateTime.now().year,
                                                      DateTime.now().month,
                                                      DateTime.now().day)),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 18),
                                        ),
                                      ),
                                      index ==
                                              self.tiempoReservaListaCalendar
                                                      .length -
                                                  1
                                          ? const SizedBox(
                                              width: 25,
                                            )
                                          : BtnIcon(
                                              onPressed: () {
                                                self.pageViewController
                                                    .nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.linear);
                                              },
                                              hoverColor:
                                                  Colores().usuario.primary69,
                                              borderRadius: 28,
                                              icon: const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: 28),
                                            ),
                                    ],
                                  ),
                                ),
                                /* buildHorarios(
                                    self
                                        .db
                                        .datosReserva
                                        .reservas[self.selectLocalidad.value!]
                                        .clubs[self.selectClub.value!]
                                        .deportes[self.selectDeporte.value!]
                                        .semana[index]
                                        .pistas[self.selectPista.value!]
                                        .horarios,
                                    self.selectPista.value!),*/
                              ],
                            ));
                    return SizedBox(
                      width: 100.w,
                      height: 170,
                      child: PageView(
                        controller: self.pageViewController,
                        scrollDirection: Axis.horizontal,
                        children: buildFechaHorarios,
                      ),
                    );
                  }),
                ),
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
                                ..._buildDatos(),
                              ]),
                            ),
                          ),
                  ),
                ),
                Obx(() => self.sizedBoxHeight.value.sh),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool todoOcupado(List<Horario> list) {
    bool todoOcupadoHorario = true;
    for (var i = 0; i < list.length; i++) {
      if (list[i].estatus == TypeEstadoHorario.desocupada) {
        todoOcupadoHorario = false;
        break;
      }
    }
    return todoOcupadoHorario;
  }

/*Widget buildChip(
    BuildContext context,
    Pista pista,
    int index,
  ) {
    return Obx(() {
      final bool isSelect = index == self.selectPista.value;
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
                      bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
                child: Center(
                  child: Text(
                    'Pista ${(index + 1)}',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(Get.context!)
                        .bodyMedium
                        .copyWith(
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
                  image: AssetImage(
                    'assets/images/${pista.image}',
                  ),
                  fit: BoxFit.fill,
                )),
              ),
            ],
          ),
          BtnIcon(
              onPressed: () async {
                self.selectHorario.value = null;
                self.selectPista.value = index;
                self.selectDay.refresh();
              },
              hoverColor: Colores().usuario.primary69,
              padding: const EdgeInsets.all(0),
              fillColor: Colors.transparent,
              borderWidth: isSelect ? 2 : 1,
              borderColor: isSelect
                  ? Colores().usuario.primary
                  : const Color.fromARGB(255, 0, 0, 0),
              borderRadius: 5,
              width: 108,
              height: 85,
              icon: 0.0.empty),
        ],
      );
    });
  } */
  Widget buildChip(
    BuildContext context,
    String id_pista,
    String foto_pista,
    int index,
  ) {
    print('id_pista $id_pista');
    print('foto_pista $foto_pista');
    try {
      return Obx(() {
        final bool isSelect = index == self.selectPista.value;
        print('foto_pista $foto_pista');
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
                    image: AssetImage(
                      'assets/images/${foto_pista}',
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
            BtnIcon(
                onPressed: () async {
                  self.selectHorario.value = null;
                  self.selectPista.value = index;
                  self.selectDay.refresh();
                },
                hoverColor: Colores().usuario.primary69,
                padding: const EdgeInsets.all(0),
                fillColor: Colors.transparent,
                borderWidth: isSelect ? 2 : 1,
                borderColor: isSelect
                    ? Colores().usuario.primary
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

  Widget buildHorarios(List<Horario> horarios, int index) {
    return Column(
        children: List.generate(1, (col) {
      final List<Widget> rows = [];
      for (var i = 0; i < horarios.length; i = i + 4) {
        rows.add(Row(
            children: List<Widget>.generate(4, (row) {
          if ((row + i) < horarios.length) {
            final String textHorario = horarios[row + i].horario;
            final String termino = (row + i + 1) == horarios.length
                ? "00:00"
                : horarios[row + i + 1].horario;
            final isSelect = self.selectHorario.value == null
                ? false
                : (self.selectHorario.value!.inicio == textHorario);
            if (horarios[row + i].estatus == TypeEstadoHorario.desocupada) {
              return BtnIcon(
                  padding: const EdgeInsets.all(0),
                  height: 40,
                  width: 100.w / 4,
                  fillColor: Colores().proveedor.primary,
                  borderRadius: isSelect ? 30 : null,
                  borderColor:
                      isSelect ? Colores().usuario.primary : Colors.white,
                  borderWidth: isSelect ? 2 : 0.5,
                  hoverColor: Colores().usuario.primary69,
                  onPressed: () {
                    print(2222222222222222);
                    bool isEqual = false;
                    if (self.selectHorario.value != null) {
                      isEqual = self.selectHorario.value!.isEquals(
                          HorarioFinInicio(
                              inicio: textHorario,
                              termino: termino,
                              typeEstadoHorario: TypeEstadoHorario.desocupada));
                    }
                    self.listReservas.value =
                        self.listReservas.map((e) => e = false).toList();
                    if (isEqual) {
                      self.selectHorario.refresh();
                    } else {
                      self.selectHorario.value = HorarioFinInicio(
                          inicio: textHorario,
                          termino: termino,
                          typeEstadoHorario: TypeEstadoHorario.desocupada);
                    }
                  },
                  icon: Center(
                      child: Text(
                    textHorario,
                    style: FlutterFlowTheme.of(Get.context!).bodySmall.copyWith(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16),
                  )));
            }
            if (horarios[row + i].estatus == TypeEstadoHorario.abierta) {
              return BtnIcon(
                  padding: const EdgeInsets.all(0),
                  height: 40,
                  width: 100.w / 4,
                  fillColor: Colores().orange,
                  borderRadius: isSelect ? 30 : null,
                  borderColor:
                      isSelect ? Colores().usuario.primary : Colors.white,
                  borderWidth: isSelect ? 2 : 0.5,
                  hoverColor: Colores().usuario.primary69,
                  onPressed: () {
                    self.listReservas.value = [true, false, false, false];
                    bool isEqual = false;
                    if (self.selectHorario.value != null) {
                      isEqual = self.selectHorario.value!.isEquals(
                          HorarioFinInicio(
                              inicio: textHorario,
                              termino: termino,
                              typeEstadoHorario: TypeEstadoHorario.abierta));
                    }
                    if (isEqual) {
                      self.selectHorario.refresh();
                    } else {
                      self.selectHorario.value = HorarioFinInicio(
                          inicio: textHorario,
                          termino: termino,
                          typeEstadoHorario: TypeEstadoHorario.abierta);
                    }
                  },
                  icon: Center(
                      child: Text(
                    textHorario,
                    style: FlutterFlowTheme.of(Get.context!).bodySmall.copyWith(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16),
                  )));
            }
            if (horarios[row + i].estatus == TypeEstadoHorario.reservada) {
              return Container(
                  height: 40,
                  width: 100.w / 4,
                  decoration: BoxDecoration(
                      color: Colores().rojo,
                      border: Border.all(width: 0.5, color: Colors.white)),
                  child: Center(
                      child: Text(
                    textHorario,
                    style: FlutterFlowTheme.of(Get.context!).bodySmall.copyWith(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16),
                  )));
            }
            return Container(
                height: 40,
                width: 100.w / 4,
                decoration: BoxDecoration(
                    color: const Color(0xffc0c0c0),
                    border: Border.all(width: 0.5, color: Colors.white)),
                child: Center(
                    child: Text(
                  textHorario,
                  style: FlutterFlowTheme.of(Get.context!).bodySmall.copyWith(
                      color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                )));
          } else {
            return SizedBox(
              height: 40,
              width: 90.w / 4,
            );
          }
        })));
      }
      return Column(
        children: rows,
      );
    }));
  }

  Widget buildButton() {
    print('db.dineroTotal ${db.dineroTotal}');
    return ElevatedButton(
      onPressed: self.selectHorario.value == null
          ? null
          : () {
              const precio_reserva = 4; //euros
              if (controller.terms.value &&
                  controller2.selectedOption.value != '' &&
                  controller2.selectedOption.value != 'rellenar') {
                print('dinero_total ${db.dineroTotal}');
                final precio = db.dineroTotal -
                    precio_reserva *
                        100; /*int.parse(db.datosPerfilUsuario
                        .obx(
                            (state) => Text(
                                  '${FormatNumber.formatNumberWithTwoDecimals(double.parse(state!.dineroTotal.toString()) / 100)} €',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            onLoading: const Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ColorLoader2(),
                            ))
                        .toString())*/

                print('preciooooooooooo ${precio}'); //(0 - 4.0);
                if (precio < 0) {
                  Get.dialog(RichAlertFlutterFlow(
                    alertType: TypeAlert.NONE,
                    alertTitle: 'Reservar Pista',
                    alertSubtitle:
                        'No tienes saldo suficiente, debes recargar para poder reservar.',
                    textButton: 'Aceptar',
                    precio: '${precio_reserva.toStringAsFixed(2)} €',
                    onPressed: () {
                      Get.back();
                    },
                  ));
                } else {
                  Get.dialog(RichAlertFlutterFlow(
                    alertType: TypeAlert.NONE,
                    alertTitle: 'Reservar Pista',
                    alertSubtitle: '¿Desea reservar la pista?',
                    textButton: '',
                    acceptButton: MaterialButton(
                      color: Colors.green,
                      onPressed: () => reservarPistaF(),
                      splashColor: Colors.lightGreen,
                      child: Text(
                        'Aceptar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    cancelButton: MaterialButton(
                      color: Colors.red,
                      onPressed: () => Get.back(),
                      splashColor: Colors.redAccent,
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    precio: '${precio_reserva.toStringAsFixed(2)} €',
                    onPressed: () {
                      Get.back();
                    },
                  ));
                }
                // Get.dialog(AnswerDialog(
                //   onPressed: () => {Get.back()},
                //   answer: "Reserva de pista",
                //   title: controller2.selectedOption.value == 'monedero'
                //       ? 'Monedero Virtual'
                //       : "Tarjeta",
                //   importe: 4.0,
                //   titleButton: "Pagar",
                // ));
              }
              ButtonsSounds.playSound();
            },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(192, 0, 255, 123)),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(130, 20), // Ajusta el ancho y alto según tus necesidades
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
          Size(130, 20), // Ajusta el ancho y alto según tus necesidades
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

  List<Widget> _buildDatos() {
    final List<Widget> list = [];

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
    final selectHorario = self.selectHorario.value ??
        HorarioFinInicio(
            inicio: '00:00',
            termino: '00:00',
            typeEstadoHorario: TypeEstadoHorario.abierta);
    final comienzo =
        "${FormatDate.dateToString(controller.selectDateDay.value!)} ${selectHorario.inicio}";
    final finaliza =
        "${FormatDate.dateToString(controller.selectDateDay.value!)} ${selectHorario.termino}";
    const double fontSize = 13;
    final stringLOcalidad = (self.selectLocalidad.value != null
        ? self.db.datosReserva.reservas[self.selectLocalidad.value!].localidad
        : (self.selectedItemDeporte.value ?? ''));
    final datosList = [
      stringLOcalidad,
      controller.deporteController.text.substring(3),
      self.selectPista.value != null
          ? '${self.selectPista.value! + 1} - ${generateListPistas()[self.selectPista.value!].name}'
          : "",
      'Si',
      'Si',
      comienzo,
      finaliza,
      "90 minutos",
      "4.00 €",
      "code"
    ];
    list.add(SizedBox(
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: List.generate(
              self.listReservas.length,
              (index) => Stack(
                children: [
                  index == 0 &&
                          self.selectHorario.value!.typeEstadoHorario ==
                              TypeEstadoHorario.abierta
                      ? self.cancelarReserva.value
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: ImageServer(
                                height: 50,
                                width: 50,
                              ),
                            )
                          : ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: Image.asset(
                                'assets/images/icon_user2.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            )
                      : ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0)),
                          child: ImageServer(
                            height: 50,
                            width: 50,
                          ),
                        ),
                  BtnIcon(
                      onPressed: index == 0 &&
                              self.selectHorario.value!.typeEstadoHorario ==
                                  TypeEstadoHorario.abierta
                          ? null
                          : () {
                              self.listReservas[index] =
                                  !self.listReservas[index];
                            },
                      padding: const EdgeInsets.all(0),
                      borderRadius: 35.0,
                      size: const Size(50, 50),
                      borderWidth: 2,
                      hoverColor: Colores().usuario.primary69,
                      borderColor: Colores().usuario.primary,
                      fillColor: self.listReservas[index] ||
                              index == 0 ||
                              (index == 1 &&
                                  self.selectHorario.value!.typeEstadoHorario ==
                                      TypeEstadoHorario.abierta)
                          ? Colors.transparent
                          : Colors.white,
                      icon: self.listReservas[index] ||
                              index == 0 ||
                              (index == 1 &&
                                  self.selectHorario.value!.typeEstadoHorario ==
                                      TypeEstadoHorario.abierta)
                          ? const SizedBox.shrink()
                          : Icon(
                              Icons.add,
                              color: Colores().usuario.primary,
                              size: 30,
                              weight: 2,
                            )),
                ],
              ),
            ).divide(4.0.sw),
          ),
          Obx(() => BtnIcon(
                onPressed: () {
                  if (self.cancelarReserva.value) {
                    self.listReservas.value =
                        self.listReservas.map((e) => e = false).toList();
                    self.cancelarReserva.value = false;
                  } else {
                    self.listReservas.value =
                        self.listReservas.map((e) => e = true).toList();
                    self.cancelarReserva.value = true;
                  }
                },
                fillColor: self.cancelarReserva.value
                    ? Colores().rojo
                    : Colores().usuario.primary,
                borderRadius: 10,
                size: const Size(130, 40),
                icon: Text(
                  self.cancelarReserva.value ? 'Cancelar' : 'Reservar todo',
                  style: FlutterFlowTheme.of(Get.context!)
                      .bodyMedium
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ))
        ]),
      ),
    ));
    for (var i = 0; i < datos.length; i++) {
      if (datosList[i] == "code") {
        list.add(
          Container(
            width: 100.w - 16,
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
                SizedBox(
                  width: 99.w - 128,
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
              ],
            ),
          ),
        );
      } else {
        list.add(
          Container(
            width: 100.w - 16,
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
                  child: Text(datosList[i],
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
    list.add(SizedBox(
      height: 5,
    ));
    list.add(
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectionWidget(
              label: 'Monedero Virtual',
              value: 'monedero',
              controller: controller2,
              db: db,
            ),
            const SizedBox(
              width: 16,
            ),
            SelectionWidget(
              label: 'Tarjeta',
              value: 'tarjeta',
              controller: controller2,
              db: db,
            ),
          ],
        ),
      ),
    );
    list.add(SizedBox(
      height: 5,
    ));
    list.add(
      TerminosCondicionesDialog(
          AnimationController(vsync: self),
          self.terms,
          Colores().proveedor.primary,
          self.terms,
          FlutterFlowTheme.of(Get.context!).primaryText),
    );
    list.add(SizedBox(
      height: 5,
    ));
    list.add(SizedBox(
      width: 100.w - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildButton(), SizedBox(width: 40), buildCancelar()],
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
  final DatabaseController db;
  SelectionWidget(
      {required this.label,
      required this.value,
      required this.controller,
      required this.db});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller.selectedOption,
      builder: (context, selectedValue, _) {
        bool isSelected = selectedValue == value;

        return GestureDetector(
          onTap: () {
            controller.selectedOption.value = value;
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width / 2 - 15,
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
                  offset: Offset(0, 3),
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
                value == 'monedero'
                    ? Text(
                        '${(double.parse(db.dineroTotal.toString()) / 100).toStringAsFixed(2)} €',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
