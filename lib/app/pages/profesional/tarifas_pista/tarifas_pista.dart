import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import './tarifas_pista_c.dart';
import 'widgets/clonar_dias.dart';

class TarifasPistaPage extends GetView<TarifasPistaController> {
  const TarifasPistaPage({super.key});

  TarifasPistaController get self => controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightModeTheme().secondaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppbarProfesional(
                title: 'Tarifas', isTitle: false, isTitleBack: true),
            10.0.sh,
            Builder(
              builder: (context) {
                return Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(buildListaDeDiasSemana),
                      10.0.sh,
                      buildTableTarifas(context),
                      buildTableDatos(context)
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 10.0, vertical: isiOS ? 15.0 : 5.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildButton(context, 'Clonar Día', Icons.copy, false),
          20.0.sw,
          buildButton(context, 'Guardar', Icons.save, true)
        ]),
      ),
    );
  }

  /// Construir la lista para seleccionar el dia de la semana
  Widget buildListaDeDiasSemana() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        self.listDiaSemana.length,
        (index) => BtnIcon(
          width: 100.w / 7,
          height: 45,
          padding: const EdgeInsets.all(2.5),
          hoverColor: Colores.proveedor.primary69,
          onPressed: () => self.changeDia(index),
          icon: CircleAvatar(
              backgroundColor: self.indexDias.value == index
                  ? const Color(0xFF46EF98)
                  : LightModeTheme().primary,
              child: Text(
                self.listDiaSemana[index],
                style: LightModeTheme().titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
              )),
        ),
      ),
    );
  }

  /// Construir la tabla con el titulo de cada fila
  Widget buildTableTarifas(BuildContext context) {
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
    return Table(
        columnWidths: columnWidth,
        border: TableBorder.all(width: 1, color: const Color(0xFF2B78DC)),
        children: [
          TableRow(
              decoration: const BoxDecoration(color: Color(0xFFF1F4F8)),
              children: [
                ...List.generate(titleTable.length, (index) {
                  /// Activar y desactivar
                  if (titleTable[index] == 'Activado') {
                    return TableCell(
                      child: BtnIcon(
                        padding: const EdgeInsets.all(0),
                        hoverColor: Colores.proveedor.primary69,
                        onPressed: self.onChangeAllActive,
                        icon: Text(
                          titleTable[index],
                          textAlign: TextAlign.center,
                          style: LightModeTheme().bodyMedium,
                        ),
                      ),
                    );
                  }

                  /// Clases
                  if (index == 1) {
                    return TableCell(
                      child: BtnIcon(
                        padding: const EdgeInsets.all(0),
                        hoverColor: Colores.proveedor.primary69,
                        onPressed: self.onChangeAllClase,
                        icon: Text(
                          titleTable[index],
                          textAlign: TextAlign.center,
                          style: LightModeTheme().bodyMedium,
                        ),
                      ),
                    );
                  }

                  /// Luz
                  if (index == 2) {
                    return TableCell(
                      child: BtnIcon(
                        padding: const EdgeInsets.all(0),
                        hoverColor: Colores.proveedor.primary69,
                        onPressed: self.onChangeAllLuz,
                        icon: Text(
                          titleTable[index],
                          textAlign: TextAlign.center,
                          style: LightModeTheme().bodyMedium,
                        ),
                      ),
                    );
                  }
                  return TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      titleTable[index],
                      textAlign: TextAlign.center,
                      style: LightModeTheme().bodyMedium,
                    ),
                  );
                })
              ])
        ]);
  }

  /// Construir la tabla con los datos dados de cada tarifa
  Widget buildTableDatos(BuildContext context) {
    final Map<int, FlexColumnWidth> columnWidth = {
      0: const FlexColumnWidth(1.2),
      1: const FlexColumnWidth(0.7),
      2: const FlexColumnWidth(0.6),
      3: const FlexColumnWidth(0.7),
      4: const FlexColumnWidth(0.9),
      5: const FlexColumnWidth(0.9),
    };
    return Expanded(
      child: SingleChildScrollView(
        child: Obx(() => Table(
            columnWidths: columnWidth,
            border: TableBorder.all(width: 1, color: const Color(0xFF5A9BEE)),
            children: List.generate(
              self.listTarifas[self.indexDias.value].length,
              (index) {
                final val = self.listTarifas[self.indexDias.value][index];
                final activeOrDesactive = self.listActive.value[index];
                return TableRow(
                  decoration: activeOrDesactive
                      ? const BoxDecoration(color: Color(0xFF93EF93))
                      : null,
                  children: [
                    // Datos Activado
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: BtnIcon(
                        padding: const EdgeInsets.all(0),
                        hoverColor: Colores.proveedor.primary69,
                        onPressed: () =>
                            self.onChangeActive(activeOrDesactive, index),
                        icon: Text(
                          activeOrDesactive ? 'Activado' : 'Desactivado',
                          textAlign: TextAlign.center,
                          style: LightModeTheme().bodyMedium,
                        ),
                      ),
                    ),
                    // Datos Clases
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Obx(() => ElevatedButton(
                            onPressed: () =>
                                self.onChangeClase(activeOrDesactive, index),
                            style: ButtonStyle(
                                overlayColor: MaterialStatePropertyAll(
                                    activeOrDesactive
                                        ? const Color.fromARGB(60, 0, 0, 0)
                                        : Colors.transparent),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                shadowColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero)),
                            child: Icon(
                              Icons.school,
                              color: self.listClase[index].value
                                  ? const Color(0xFFD241FF)
                                  : LightModeTheme().secondaryText,
                              size: 24.0,
                            ),
                          )),
                    ),
                    // Datos Luz
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Obx(() => ElevatedButton(
                            onPressed: () =>
                                self.onChangeLuz(activeOrDesactive, index),
                            style: ButtonStyle(
                                overlayColor: MaterialStatePropertyAll(
                                    activeOrDesactive
                                        ? const Color.fromARGB(60, 0, 0, 0)
                                        : Colors.transparent),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                shadowColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero)),
                            child: Icon(
                              FontAwesomeIcons.solidLightbulb,
                              color: self.listLuz[index].value
                                  ? LightModeTheme().warning
                                  : LightModeTheme().secondaryText,
                              size: 24.0,
                            ),
                          )),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        val.horaInicio!,
                        textAlign: TextAlign.center,
                        style: LightModeTheme().bodyMedium,
                      ),
                    ),
                    TableCell(
                      child: Obx(() => TextFormField(
                            maxLength: 7,
                            controller: TextEditingController(
                                text: self.listClase[index].value
                                    ? '0.00 €'
                                    : self.listLuz[index].value
                                        ? val.precioConLuzSocio
                                        : val.precioSinLuzSocio),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            obscureText: false,
                            decoration: InputDecoration(
                              counterText: '',
                              labelStyle: LightModeTheme().labelMedium,
                              hintStyle: LightModeTheme().labelMedium,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            inputFormatters: [PrecioInputFormatter()],
                            style: LightModeTheme().bodyMedium,
                            textAlign: TextAlign.center,
                            onChanged: (precio) => self.onChangePrecioSocio(
                                self.listLuz[index].value, index, precio),
                          )),
                    ),
                    TableCell(
                      child: Obx(() => TextFormField(
                            maxLength: 7,
                            controller: TextEditingController(
                                text: self.listClase[index].value
                                    ? '0.00 €'
                                    : self.listLuz[index].value
                                        ? val.precioConLuzNoSocio
                                        : val.precioSinLuzNoSocio),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            obscureText: false,
                            decoration: InputDecoration(
                              counterText: '',
                              labelStyle: LightModeTheme().labelMedium,
                              hintStyle: LightModeTheme().labelMedium,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            inputFormatters: [PrecioInputFormatter()],
                            style: LightModeTheme().bodyMedium,
                            textAlign: TextAlign.center,
                            onChanged: (precio) => self.onChangePrecioNoSocio(
                                self.listLuz[index].value, index, precio),
                          )),
                    ),
                  ],
                );
              },
            ))),
      ),
    );
  }

  // Contruir los botones
  Widget buildButton(
      BuildContext context, String text, IconData icon, bool isGuardar) {
    return ElevatedButton(
      onPressed: () async {
        if (isGuardar) {
          self.onGuardar();
        } else {
          self.selectedDias.value =
              List.generate(self.selectedDias.value.length, (e) => false);
          await showAlignedDialog(
            context: context,
            isGlobal: true,
            avoidOverflow: false,
            targetAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return ClonarDias();
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
