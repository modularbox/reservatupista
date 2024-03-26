import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservatu_pista/components/navbar_login.dart';
import '../../../components/appbar_profesional.dart';
import '../../../utils/btn_icon.dart';
import '../../../utils/colores.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'clonar_dias.dart';

class TarifasWidget extends StatefulWidget {
  const TarifasWidget({super.key});

  @override
  _TarifasWidgetState createState() => _TarifasWidgetState();
}

class _TarifasWidgetState extends State<TarifasWidget> {
  late List<bool> isCkeckedAllActivado;
  late List<bool> isCkeckedAllClases;
  late List<bool> isCkeckedAllLuz;
  int indexDias = 0;
  @override
  void initState() {
    super.initState();
    final generateListCkecked = List.generate(7, (index) => false);
    isCkeckedAllActivado = generateListCkecked;
    isCkeckedAllClases = generateListCkecked;
    isCkeckedAllLuz = generateListCkecked;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppbarProfesional(
                title: 'Tarifas', isTitle: false, isTitleBack: true),
            10.0.sh,
            Builder(
              builder: (context) {
                final Map<int, FlexColumnWidth> columnWidth = {
                  0: const FlexColumnWidth(1.2),
                  1: const FlexColumnWidth(0.7),
                  2: const FlexColumnWidth(0.6),
                  3: const FlexColumnWidth(0.7),
                  4: const FlexColumnWidth(0.9),
                  5: const FlexColumnWidth(0.9),
                };
                final List<String> titleTable = [
                  'Activado',
                  'Clases',
                  'Luz',
                  'Hora',
                  'Socio',
                  'No Socio'
                ];
                final List<String> diasSelect = [
                  'L',
                  'M',
                  'X',
                  'J',
                  'V',
                  'S',
                  'D'
                ];
                return Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            diasSelect.length,
                            (index) => FFButtonWidget(
                              onPressed: () => setState(
                                () {
                                  indexDias = index;
                                },
                              ),
                              text: diasSelect[index],
                              options: FFButtonOptions(
                                width: 35.0,
                                height: 35.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: indexDias == index
                                    ? const Color(0xFF46EF98)
                                    : FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Table(
                          columnWidths: columnWidth,
                          border: TableBorder.all(
                              width: 1, color: const Color(0xFF2B78DC)),
                          children: [
                            TableRow(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF1F4F8)),
                                children: [
                                  ...List.generate(titleTable.length, (index) {
                                    /// Activar y desactivar
                                    if (titleTable[index] == 'Activado') {
                                      return TableCell(
                                        child: BtnIcon(
                                          padding: const EdgeInsets.all(0),
                                          hoverColor:
                                              Colores().proveedor.primary69,
                                          onPressed: () {
                                            setState(() {
                                              if (isCkeckedAllActivado[
                                                  indexDias]) {
                                                FFAppState()
                                                    .listaTarifas[indexDias]
                                                    .map((e) => {
                                                          e.disponible = false,
                                                          e.clases = false,
                                                          e.luz = false
                                                        })
                                                    .toList();
                                              } else {
                                                FFAppState()
                                                    .listaTarifas[indexDias]
                                                    .map((e) =>
                                                        e.disponible = true)
                                                    .toList();
                                              }
                                              isCkeckedAllActivado[indexDias] =
                                                  !isCkeckedAllActivado[
                                                      indexDias];
                                            });
                                          },
                                          icon: Text(
                                            titleTable[index],
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      );
                                    }

                                    /// Clases
                                    if (index == 1) {
                                      return TableCell(
                                        child: BtnIcon(
                                          padding: const EdgeInsets.all(0),
                                          hoverColor:
                                              Colores().proveedor.primary69,
                                          onPressed: () {
                                            setState(() {
                                              if (isCkeckedAllClases[
                                                  indexDias]) {
                                                FFAppState()
                                                    .listaTarifas[indexDias]
                                                    .map((e) =>
                                                        e.disponible == true
                                                            ? e.clases = true
                                                            : e)
                                                    .toList();
                                              } else {
                                                FFAppState()
                                                    .listaTarifas[indexDias]
                                                    .map((e) =>
                                                        e.disponible == true
                                                            ? e.clases = false
                                                            : e)
                                                    .toList();
                                              }
                                              isCkeckedAllClases[indexDias] =
                                                  !isCkeckedAllClases[
                                                      indexDias];
                                            });
                                          },
                                          icon: Text(
                                            titleTable[index],
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      );
                                    }

                                    /// Luz
                                    if (index == 2) {
                                      return TableCell(
                                        child: BtnIcon(
                                          padding: const EdgeInsets.all(0),
                                          hoverColor:
                                              Colores().proveedor.primary69,
                                          onPressed: () {
                                            setState(() {
                                              if (isCkeckedAllLuz[indexDias]) {
                                                FFAppState()
                                                    .listaTarifas[indexDias]
                                                    .map((e) =>
                                                        e.disponible == true
                                                            ? e.luz = true
                                                            : e)
                                                    .toList();
                                              } else {
                                                FFAppState()
                                                    .listaTarifas[indexDias]
                                                    .map((e) =>
                                                        e.disponible == true
                                                            ? e.luz = false
                                                            : e)
                                                    .toList();
                                              }
                                              isCkeckedAllLuz[indexDias] =
                                                  !isCkeckedAllLuz[indexDias];
                                            });
                                          },
                                          icon: Text(
                                            titleTable[index],
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      );
                                    }
                                    return TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Text(
                                        titleTable[index],
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    );
                                  })
                                ])
                          ]),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Table(
                              columnWidths: columnWidth,
                              border: TableBorder.all(
                                  width: 1, color: Color(0xFF5A9BEE)),
                              children: [
                                ...List.generate(
                                  FFAppState().listaTarifas[indexDias].length,
                                  (index) {
                                    final val = FFAppState()
                                        .listaTarifas[indexDias][index];
                                    return TableRow(
                                      decoration: val.disponible
                                          ? const BoxDecoration(
                                              color: Color(0xFF93EF93))
                                          : null,
                                      children: [
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: BtnIcon(
                                            padding: const EdgeInsets.all(0),
                                            hoverColor:
                                                Colores().proveedor.primary69,
                                            onPressed: () {
                                              setState(() {
                                                if (val.disponible) {
                                                  FFAppState()
                                                      .listaTarifas[indexDias]
                                                          [index]
                                                      .clases = false;
                                                  FFAppState()
                                                      .listaTarifas[indexDias]
                                                          [index]
                                                      .luz = false;
                                                }
                                                FFAppState()
                                                        .listaTarifas[indexDias]
                                                            [index]
                                                        .disponible =
                                                    !val.disponible;
                                              });
                                            },
                                            icon: Text(
                                              val.disponible
                                                  ? 'Activado'
                                                  : 'Desactivado',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (val.disponible) {
                                                setState(() {
                                                  FFAppState()
                                                      .listaTarifas[indexDias]
                                                          [index]
                                                      .clases = !val.clases;
                                                });
                                              }
                                            },
                                            style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStatePropertyAll(val
                                                            .disponible
                                                        ? const Color.fromARGB(
                                                            60, 0, 0, 0)
                                                        : Colors.transparent),
                                                backgroundColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                shadowColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                padding:
                                                    const MaterialStatePropertyAll(
                                                        EdgeInsets.zero)),
                                            child: Icon(
                                              Icons.school,
                                              color: val.clases
                                                  ? const Color(0xFFD241FF)
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (val.disponible) {
                                                setState(() {
                                                  FFAppState()
                                                      .listaTarifas[indexDias]
                                                          [index]
                                                      .luz = !val.luz;
                                                });
                                              }
                                            },
                                            style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStatePropertyAll(val
                                                            .disponible
                                                        ? const Color.fromARGB(
                                                            60, 0, 0, 0)
                                                        : Colors.transparent),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                shadowColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.zero)),
                                            child: Icon(
                                              FontAwesomeIcons.solidLightbulb,
                                              color: val.luz
                                                  ? FlutterFlowTheme.of(context)
                                                      .warning
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          child: Text(
                                            val.horaInicio!,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        TableCell(
                                          child: TextFormField(
                                            maxLength: 7,
                                            controller:
                                                valueSocio(index, indexDias),
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              PrecioInputFormatter()
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              final valueDouble = double.parse(
                                                  value.substring(
                                                      0, value.length - 2));
                                              if (valueDouble != 0) {
                                                // if (val.luz) {
                                                //   val.precioConLuzSocio =
                                                //       valueDouble;
                                                // } else {
                                                //   val.precioSinLuzSocio =
                                                //       valueDouble;
                                                // }
                                              }
                                            },
                                          ),
                                        ),
                                        TableCell(
                                          child: TextFormField(
                                            maxLength: 7,
                                            controller:
                                                valueNoSocio(index, indexDias),
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              PrecioInputFormatter()
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              final valueDouble = double.parse(
                                                  value.substring(
                                                      0, value.length - 2));
                                              if (valueDouble != 0) {
                                                // if (val.luz) {
                                                //   val.precioConLuzNoSocio =
                                                //       valueDouble;
                                                // } else {
                                                //   val.precioSinLuzNoSocio =
                                                //       valueDouble;
                                                // }
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildButton('Clonar Día', Icons.copy, false),
          20.0.sw,
          buildButton('Guardar', Icons.save, true)
        ]),
      ),
    );
  }

  TextEditingController? createEditingController(
          double precioTarifa, String precio) =>
      precioTarifa != 0
          ? TextEditingController(
              text: addEuro(precioTarifa.toStringAsFixed(2)))
          : TextEditingController(text: precio);
  TextEditingController? valueSocio(index, int indexDia) =>
      FFAppState().listaTarifas[indexDia][index].luz
          ? createEditingController(
              0,
              // FFAppState().listaTarifas[indexDia][index].precioConLuzSocio ,
              FFAppState().precioconluzController.text)
          : createEditingController(
              // FFAppState().listaTarifas[indexDia][index].precioSinLuzSocio,
              0,
              FFAppState().preciosinluzController.text);

  TextEditingController? valueNoSocio(index, int indexDia) =>
      FFAppState().listaTarifas[indexDia][index].luz
          ? createEditingController(
              // FFAppState().listaTarifas[indexDia][index].precioConLuzNoSocio,
              0,
              FFAppState().precioconluzNoSocioController.text)
          : createEditingController(
              // FFAppState().listaTarifas[indexDia][index].precioSinLuzNoSocio,
              0,
              FFAppState().preciosinluzNoSocioController.text);

  TextEditingController? valueConLuzNoSocio(index, int indexDia) =>
      FFAppState().listaTarifas[indexDia][index].luz
          ? TextEditingController(
              text: FFAppState().precioconluzNoSocioController.text)
          : TextEditingController(
              text: FFAppState().preciosinluzNoSocioController.text);

  String addEuro(String value) {
    return '$value €';
  }

  Widget buildButton(String text, IconData icon, bool isGuardar) {
    return ElevatedButton(
      onPressed: () async {
        // if (controller.validateForm()) {
        //   controller.update(['tableSave']);
        //   Navigator.pop(context);
        // }
        if (isGuardar) {
          Navigator.pop(context);
        } else {
          await showAlignedDialog(
            context: context,
            isGlobal: true,
            avoidOverflow: false,
            targetAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return ClonarDias(
                indexDias: indexDias,
              );
            },
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(192, 0, 255, 123)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(150, 20)),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrecioInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll('.', ''); // Eliminar puntos
    int newTextLength = newText.length;

    if (newTextLength == 0) {
      // Si no hay ningún número ingresado, devolver un valor vacío
      return const TextEditingValue();
    }

    double amount = double.parse(newText.substring(0, newText.length - 2)) /
        100; // Convertir a número y dividir por 100
    String formattedText =
        amount.toStringAsFixed(2); // Formatear con dos decimales

    return TextEditingValue(
      text: '$formattedText €',
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
