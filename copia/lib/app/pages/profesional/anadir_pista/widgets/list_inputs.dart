import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../../../utils/colores.dart';
import '../../../../../utils/dialog/terminos_condiciones_dialog.dart';
import '../../../../../utils/loader/color_loader.dart';
import '../../../../../utils/btn_icon.dart';
import '../../../../widgets/seleccion_imagen_widget.dart';
import '../../../../widgets/text_inputters/inputter_registro.dart';
import '../anadir_pista_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input_pista.dart';

class ListInputs extends StatefulWidget {
  const ListInputs({
    super.key,
  });

  @override
  State<ListInputs> createState() => _ListInputsState();
}

class _ListInputsState extends State<ListInputs> {
  AnadirPistaController self = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.deporte.anim,
                  child: Obx(() => InputPista(
                      key: self.deporte.key,
                      controller: self.deporte.controller,
                      focusNode: self.deporte.focus,
                      context: context,
                      labelText: 'Deporte',
                      itemsDD: const [
                        '🎾 Padel',
                        '🎾 Tenis',
                        '🏸 Badminton',
                        '🏊‍♀️ P. climatizada',
                        '🏊‍♀️ Piscina',
                        '🏀 Baloncesto',
                        '⚽ Futbol sala',
                        '⚽ Futbol 7',
                        '⚽ Futbol 11',
                        '🥍 Pickleball',
                        '🏸 Squash',
                        '🏓 Tenis de mesa',
                        '🏓 Fronton',
                        '⚽ Balomano',
                        '🏉 Rugby',
                        '🥅 Multideporte',
                      ],
                      isValidate: self.deporte.isValidate.value,
                      onChanged: (val) {
                        self.deporte.isValidate.value = false;
                        if (val.isNotEmpty) {
                          self.nPistaController.text = '1';
                        }
                      },
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.deporte.isValidate,
                          self.deporte.anim,
                          self.deporte.key))),
                ),
              ),
              4.0.sw,
              Flexible(
                child: TextFormField(
                  controller: self.nPistaController,
                  enabled: false,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'y7pf20ni' /* Nº de pista */,
                    ),
                    labelStyle: GoogleFonts.getFont(
                      'Readex Pro',
                      color: const Color.fromARGB(165, 117, 117, 117),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colores().proveedor.primary69,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.techada.anim,
                  child: Obx(() => InputPista(
                      key: self.techada.key,
                      controller: self.techada.controller,
                      focusNode: self.techada.focus,
                      context: context,
                      labelText: 'Techada',
                      itemsDD: const ['Si', 'No'],
                      onChanged: (val) => self.techada.isValidate.value = false,
                      isValidate: self.techada.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.techada.isValidate,
                          self.techada.anim,
                          self.techada.key))),
                ),
              ),
              4.0.sw,
              Expanded(
                child: VibratingWidget(
                  controller: self.iluminacion.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.iluminacion.key,
                      controller: self.iluminacion.controller,
                      focusNode: self.iluminacion.focus,
                      context: context,
                      labelText: 'Iluminación',
                      itemsDD: const ['Leds', 'Halogeno'],
                      onChanged: (val) =>
                          self.iluminacion.isValidate.value = false,
                      isValidate: self.iluminacion.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.iluminacion.isValidate,
                          self.iluminacion.anim,
                          self.iluminacion.key),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.tipo.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.tipo.key,
                      controller: self.tipo.controller,
                      focusNode: self.tipo.focus,
                      context: context,
                      labelText: 'Tipo',
                      itemsDD: const ['Cristal', 'Hormigo'],
                      onChanged: (val) => self.tipo.isValidate.value = false,
                      isValidate: self.tipo.isValidate.value,
                      onValidator: (val) => self.validarInputController(val,
                          self.tipo.isValidate, self.tipo.anim, self.tipo.key),
                    ),
                  ),
                ),
              ),
              4.0.sw,
              Expanded(
                child: VibratingWidget(
                  controller: self.cesped.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.cesped.key,
                      controller: self.cesped.controller,
                      focusNode: self.cesped.focus,
                      context: context,
                      labelText: 'Cesped',
                      itemsDD: const [
                        'Verde',
                        'Azul',
                        'Negro',
                        'Marron',
                        'Rojo'
                      ],
                      onChanged: (val) => self.cesped.isValidate.value = false,
                      isValidate: self.cesped.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.cesped.isValidate,
                          self.cesped.anim,
                          self.cesped.key),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.automatizada.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.automatizada.key,
                      controller: self.automatizada.controller,
                      focusNode: self.automatizada.focus,
                      context: context,
                      labelText: 'Automatizada',
                      itemsDD: const ['Si', 'No'],
                      onChanged: (val) =>
                          self.automatizada.isValidate.value = false,
                      isValidate: self.automatizada.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.automatizada.isValidate,
                          self.automatizada.anim,
                          self.automatizada.key),
                    ),
                  ),
                ),
              ),
              Container(
                width: 4.0,
                decoration: const BoxDecoration(),
              ),
              Expanded(
                child: VibratingWidget(
                  controller: self.duracionPartida.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.duracionPartida.key,
                      controller: self.duracionPartida.controller,
                      focusNode: self.duracionPartida.focus,
                      context: context,
                      labelText: 'Duración partida',
                      onChanged: (val) => {
                        self.setDuration(val),
                        self.isValidBtnTarifas.refresh(),
                        self.duracionPartida.isValidate.value = false
                      },
                      itemsDD: const ['60 Minutos', '90 Minutos'],
                      isValidate: self.duracionPartida.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.duracionPartida.isValidate,
                          self.duracionPartida.anim,
                          self.duracionPartida.key),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.horaInicio.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.horaInicio.key,
                      controller: self.horaInicio.controller,
                      focusNode: self.horaInicio.focus,
                      context: context,
                      labelText: 'Hora de inicio',
                      onChanged: (val) {
                        self.horaFin.controller.text = self.listaHorarios
                            .value[self.listaHorarios.value.length - 1];
                        self.isValidBtnTarifas.refresh();
                        self.horaInicio.isValidate.value = false;
                        self.horaFin.isValidate.value = false;
                      },
                      enableInput: self.isValidBtnTarifas.value ||
                          self.duracionPartida.controller.text != '',
                      itemsDD: self.listaHorarios.value,
                      isValidate: self.horaInicio.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.horaInicio.isValidate,
                          self.horaInicio.anim,
                          self.horaInicio.key),
                    ),
                  ),
                ),
              ),
              4.0.sw,
              Expanded(
                child: VibratingWidget(
                  controller: self.horaFin.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.horaFin.key,
                      controller: self.horaFin.controller,
                      focusNode: self.horaFin.focus,
                      context: context,
                      labelText: 'Hora de fin',
                      enableInput: self.isValidBtnTarifas.value ||
                          self.duracionPartida.controller.text != '',
                      itemsDD: self.generarHoraFinal(self.listaHorarios.value),
                      onChanged: (val) => {
                        self.horaFin.isValidate.value = false,
                        self.isValidBtnTarifas.refresh()
                      },
                      isValidate: self.horaFin.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.horaFin.isValidate,
                          self.horaFin.anim,
                          self.horaFin.key),
                    ),
                  ),
                ),
              ),
            ],
          ),
          buildContainerSocioNew(
            context: context,
            title: 'Socio',
            tiempoReserva: self.socioTiempoReserva,
            tiempoCancelacion: self.socioTiempoCancelacion,
            precioConLuz: self.socioPrecioConLuz,
            precioSinLuz: self.socioPrecioSinLuz,
          ),
          buildContainerSocioNew(
            context: context,
            title: 'No Socio',
            tiempoReserva: self.noSocioTiempoReserva,
            tiempoCancelacion: self.noSocioTiempoCancelacion,
            precioConLuz: self.noSocioPrecioConLuz,
            precioSinLuz: self.noSocioPrecioSinLuz,
          ),
          buildContainerMetodoPago(context: context),
          Obx(() => FFButtonWidget(
                onPressed: !self.isValidBtnTarifas.value
                    ? null
                    : () async {
                        self.generarListaTarifas();
                      },
                text: self.selfTarifas.datosGuardados.value
                    ? 'Modificar Tarifas'
                    : 'Crear Tarifas',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: !self.isValidBtnTarifas.value
                      ? Colores().grisClaro
                      : FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: !self.isValidBtnTarifas.value
                            ? Colors.black
                            : Colors.white,
                      ),
                  borderSide: self.validarTarifas.value &&
                          !self.selfTarifas.datosGuardados.value
                      ? const BorderSide(color: Colors.red, width: 2)
                      : null,
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.nombrePatrocinador.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.nombrePatrocinador.key,
                      controller: self.nombrePatrocinador.controller,
                      focusNode: self.nombrePatrocinador.focus,
                      typeInputPista: TypeInputPista.input,
                      context: context,
                      labelText: 'Nombre patrocinador',
                      itemsDD: const [],
                      readOnly: false,
                      isValidate: self.nombrePatrocinador.isValidate.value,
                      onChanged: (val) =>
                          self.nombrePatrocinador.isValidate.value = false,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.nombrePatrocinador.isValidate,
                          self.nombrePatrocinador.anim,
                          self.nombrePatrocinador.key),
                    ),
                  ),
                ),
              ),
              4.0.sw,
              Expanded(
                child: buildUploadImage(context: context),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: VibratingWidget(
                  controller: self.vestuario.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.vestuario.key,
                      controller: self.vestuario.controller,
                      focusNode: self.vestuario.focus,
                      context: context,
                      labelText: 'Vestuario',
                      itemsDD: const ['Si', 'No'],
                      isValidate: self.vestuario.isValidate.value,
                      onChanged: (val) =>
                          self.vestuario.isValidate.value = false,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.vestuario.isValidate,
                          self.vestuario.anim,
                          self.vestuario.key),
                    ),
                  ),
                ),
              ),
              4.0.sw,
              Expanded(
                child: VibratingWidget(
                  controller: self.duchas.anim,
                  child: Obx(
                    () => InputPista(
                      key: self.duchas.key,
                      controller: self.duchas.controller,
                      focusNode: self.duchas.focus,
                      context: context,
                      labelText: 'Duchas',
                      itemsDD: const ['Si', 'No'],
                      onChanged: (val) => self.duchas.isValidate.value = false,
                      isValidate: self.duchas.isValidate.value,
                      onValidator: (val) => self.validarInputController(
                          val,
                          self.duchas.isValidate,
                          self.duchas.anim,
                          self.duchas.key),
                    ),
                  ),
                ),
              ),
            ],
          ),
          VibratingWidget(
            controller: self.imagenesPistaAnim,
            child: self.imagesPista.obx(
                (state) => BtnIcon(
                      borderRadius: 12,
                      borderColor: self.imagesPista.action == 'validate'
                          ? FlutterFlowTheme.of(context).error
                          : state!.isEmpty
                              ? Colores().proveedor.primary
                              : Colores().proveedor.primary160,
                      hoverColor: Colores().proveedor.primary69,
                      borderWidth: 2,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      onPressed: self.pickImagesPista,
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.add_a_photo_rounded,
                                color: self.imagesPista.action == 'validate'
                                    ? FlutterFlowTheme.of(context).error
                                    : Colores().proveedor.primary,
                                size: 25.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  state!.isEmpty
                                      ? 'Subir imagenes de la pista'
                                      : 'Fotos',
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                          state.isEmpty
                              ? const SizedBox.shrink()
                              : Row(
                                  children: state
                                      .map((e) => BtnIcon(
                                          onPressed: () {
                                            Get.dialog(
                                              GestureDetector(
                                                onTap: () => Get.back(),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: Image.file(
                                                    e,
                                                    width: 300.0,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          borderRadius: 30,
                                          padding: const EdgeInsets.all(0),
                                          fillColor: Colors.transparent,
                                          hoverColor: const Color.fromARGB(
                                              68, 255, 255, 255),
                                          icon: CircleAvatar(
                                            radius: 20,
                                            backgroundImage: FileImage(
                                              e,
                                            ),
                                          )))
                                      .toList()),
                        ],
                      ),
                    ),
                onLoading: BtnIcon(
                    borderRadius: 12,
                    borderColor: Colores().proveedor.primary,
                    hoverColor: Colores().proveedor.primary69,
                    borderWidth: 2,
                    height: 45,
                    padding: const EdgeInsets.all(8.0),
                    icon: ColorLoader())),
          ),
          VibratingWidget(
            controller: self.descripcion.anim,
            child: Obx(
              () => TextFormField(
                key: self.descripcion.key,
                controller: self.descripcion.controller,
                focusNode: self.descripcion.focus,
                obscureText: false,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: 'Descripción',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: self.descripcion.isValidate.value
                          ? FlutterFlowTheme.of(context).error
                          : Colores().proveedor.primary160,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: self.descripcion.isValidate.value
                          ? FlutterFlowTheme.of(context).error
                          : Colores().proveedor.primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 24.0, 16.0, 12.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                cursorColor: FlutterFlowTheme.of(context).primary,
                maxLines: 4,
                inputFormatters: [MaxLinesTextInputFormatter(4)],
                onChanged: (val) => self.descripcion.isValidate.value = false,
                validator: (val) => self.validarInputController(
                    val,
                    self.descripcion.isValidate,
                    self.descripcion.anim,
                    self.descripcion.key),
              ),
            ),
          ),
          TerminosCondicionesDialog(
              self.animTerminos,
              self.checkboxTerminos,
              Colores().proveedor.primary,
              self.checkboxTerminos,
              FlutterFlowTheme.of(Get.context!).primaryText),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }

// Construir para crear imagen
  Widget buildUploadImage({
    required BuildContext context,
  }) {
    return VibratingWidget(
        controller: self.foto.anim,
        child: Obx(() => TextFormField(
              controller: self.foto.controller,
              focusNode: self.foto.focus,
              decoration: InputDecoration(
                counterText: '',
                errorStyle: const TextStyle(fontSize: 0),
                labelText: 'Foto',
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: const Color(0xFF95A1AC),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: self.foto.isValidate.value
                        ? FlutterFlowTheme.of(context).error
                        : Colores().proveedor.primary160,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: self.foto.isValidate.value
                        ? FlutterFlowTheme.of(context).error
                        : Colores().proveedor.primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    color: self.foto.isValidate.value
                        ? FlutterFlowTheme.of(context).error
                        : Colores().proveedor.primary,
                    size: 25.0,
                  ),
                ),
                suffixIcon: Obx(() => self.imagePatrocinador.value != null
                    ? BtnIcon(
                        onPressed: () {
                          Get.dialog(
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.file(
                                  self.imagePatrocinador.value!,
                                  width: 300.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          );
                        },
                        borderRadius: 30,
                        padding: const EdgeInsets.all(0),
                        fillColor: Colors.transparent,
                        hoverColor: const Color.fromARGB(68, 255, 255, 255),
                        icon: CircleAvatar(
                          radius: 20,
                          backgroundImage: FileImage(
                            self.imagePatrocinador.value!,
                          ),
                        ))
                    : const SizedBox.shrink()),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 12.0, 16.0, 12.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              readOnly: true,
              onTap: () {
                Get.dialog(SeleccionImagenWidget(
                  onPressed: self.pickImagePatrocinador,
                  isProveedor: true,
                ));
              },
              enableInteractiveSelection: false,
              validator: (val) => self.validarInputController(
                  val, self.foto.isValidate, self.foto.anim, self.foto.key),
            )));
  }

// Build inputs del socio o no socio
  Widget buildContainerSocioNew({
    required BuildContext context,
    required String title,
    required InputController tiempoReserva,
    required InputController tiempoCancelacion,
    required InputController precioConLuz,
    required InputController precioSinLuz,
  }) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: const Color.fromRGBO(43, 120, 220, 1),
          ),
          boxShadow: const [
            BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.normal)
          ]),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Text(
                  title,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: VibratingWidget(
                      controller: tiempoReserva.anim,
                      child: Obx(
                        () => InputPista(
                          key: tiempoReserva.key,
                          controller: tiempoReserva.controller,
                          focusNode: tiempoReserva.focus,
                          context: context,
                          labelText: 'Tiempo reserva',
                          itemsDD: const [
                            '1 Día',
                            '2 Día',
                            '3 Día',
                            '4 Día',
                            '5 Día',
                            '6 Día',
                            '7 Día',
                            '8 Día',
                            '9 Día',
                            '10 Día',
                          ],
                          onChanged: (val) =>
                              tiempoReserva.isValidate.value = false,
                          isValidate: tiempoReserva.isValidate.value,
                          onValidator: (val) => self.validarInputController(
                              val,
                              tiempoReserva.isValidate,
                              tiempoReserva.anim,
                              tiempoReserva.key),
                        ),
                      ),
                    ),
                  ),
                  4.0.sw,
                  Expanded(
                    child: VibratingWidget(
                      controller: tiempoCancelacion.anim,
                      child: Obx(
                        () => InputPista(
                          key: tiempoCancelacion.key,
                          controller: tiempoCancelacion.controller,
                          focusNode: tiempoCancelacion.focus,
                          context: context,
                          labelText: 'Tiempo cancelación',
                          itemsDD: const [
                            '12 Horas',
                            '24 Horas',
                            '48 Horas',
                            '72 Horas'
                          ],
                          onChanged: (val) =>
                              tiempoCancelacion.isValidate.value = false,
                          isValidate: tiempoCancelacion.isValidate.value,
                          onValidator: (val) => self.validarInputController(
                              val,
                              tiempoCancelacion.isValidate,
                              tiempoCancelacion.anim,
                              tiempoCancelacion.key),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: VibratingWidget(
                      controller: precioConLuz.anim,
                      child: Obx(
                        () => InputPista(
                          key: precioConLuz.key,
                          controller: precioConLuz.controller,
                          focusNode: precioConLuz.focus,
                          typeInputPista: TypeInputPista.input,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          context: context,
                          labelText: 'Precio con luz',
                          maxLength: 7,
                          inputFormatters: [
                            SinEspaciosInputFormatter(),
                            PrecioInputFormatter(),
                          ],
                          readOnly: false,
                          onChanged: (val) => {
                            self.isValidBtnTarifas.refresh(),
                            precioConLuz.isValidate.value = false
                          },
                          isValidate: precioConLuz.isValidate.value,
                          onValidator: (val) => self.validarInputController(
                              val,
                              precioConLuz.isValidate,
                              precioConLuz.anim,
                              precioConLuz.key),
                        ),
                      ),
                    ),
                  ),
                  4.0.sw,
                  Expanded(
                    child: VibratingWidget(
                      controller: precioSinLuz.anim,
                      child: Obx(
                        () => InputPista(
                          key: precioSinLuz.key,
                          controller: precioSinLuz.controller,
                          focusNode: precioSinLuz.focus,
                          typeInputPista: TypeInputPista.input,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          context: context,
                          maxLength: 7,
                          labelText: 'Precio sin luz',
                          inputFormatters: [
                            SinEspaciosInputFormatter(),
                            PrecioInputFormatter(),
                          ],
                          readOnly: false,
                          onChanged: (val) => {
                            self.isValidBtnTarifas.refresh(),
                            precioSinLuz.isValidate.value = false
                          },
                          isValidate: precioSinLuz.isValidate.value,
                          onValidator: (val) => self.validarInputController(
                              val,
                              precioSinLuz.isValidate,
                              precioSinLuz.anim,
                              precioSinLuz.key),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              0.0.empty,
            ].divide(10.0.sh)),
      ),
    );
  }

// Build inputs de metodo de pago
  Widget buildContainerMetodoPago({
    required BuildContext context,
  }) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: const Color.fromRGBO(43, 120, 220, 1),
          ),
          boxShadow: const [
            BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.normal)
          ]),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Metodos de Pago',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'En Club',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                  4.0.sw,
                  Expanded(
                    child: Text(
                      'Monedero Virtual',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: buildInputSiONo('Efectivo', self.efectivo),
                  ),
                  4.0.sw,
                  Expanded(
                    child:
                        buildInputSiONo('ReservaTuPista', self.reservatupista),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: buildInputSiONo('Tarjeta', self.tarjeta),
                  ),
                  4.0.sw,
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: buildInputSiONo('Bono', self.bono),
                  ),
                  4.0.sw,
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              0.0.empty,
            ].divide(10.0.sh)),
      ),
    );
  }

// Build input si o no
  Widget buildInputSiONo(String title, InputController inputController) {
    return VibratingWidget(
      controller: inputController.anim,
      child: Obx(
        () => InputPista(
          key: inputController.key,
          controller: inputController.controller,
          focusNode: inputController.focus,
          context: context,
          labelText: title,
          itemsDD: const [
            'Si',
            'No',
          ],
          onChanged: (val) => inputController.isValidate.value = false,
          isValidate: inputController.isValidate.value,
          onValidator: (val) => self.validarInputController(
              val,
              inputController.isValidate,
              inputController.anim,
              inputController.key),
        ),
      ),
    );
  }
}

class MaxLinesTextInputFormatter extends TextInputFormatter {
  final int maxLines;

  MaxLinesTextInputFormatter(this.maxLines);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Contamos el número de saltos de línea en el nuevo valor
    int lineCount = '\n'.allMatches(newValue.text).length + 1;

    // Si el número de líneas supera el límite, mantenemos el valor anterior
    if (lineCount > maxLines) {
      return oldValue;
    }

    // Si no, permitimos la actualización
    return newValue;
  }
}

class PrecioInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll('.', ''); // Eliminar puntos
    newText = newText.replaceAll('€', ''); // Eliminar Euro
    int newTextLength = newText.length; // Tamano del texto
    if (newTextLength == 0) {
      // Si no hay ningún número ingresado, devolver un valor vacío
      return const TextEditingValue();
    }
    if (double.tryParse(newText) == null) {
      return oldValue;
    } else {
      double amount =
          double.parse(newText) / 100; // Convertir a número y dividir por 100
      String formattedText =
          amount.toStringAsFixed(2); // Formatear con dos decimales
      return TextEditingValue(
        text: '$formattedText €',
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }
}
