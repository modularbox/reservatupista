import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/Socio.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_socios/chip_data.dart';

class AdminUsuariosController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final unfocusNode = FocusNode();
  int socioSeleccionado = -1;
  final List chips = [
    ChipData(label: 'Nombre'),
    ChipData(label: 'Nivel'),
    ChipData(label: 'Localidad')
  ];
  List socios = [
    Socio(
        0,
        "José Martinez Durán",
        "NickUno",
        "123456789A",
        "4.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Tarde",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1592245734204-6561336cbc6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxpZCUyMHBob3RvfGVufDB8fHx8MTcxMTQ2OTI2OHww&ixlib=rb-4.0.3&q=80&w=1080",
        true,
        72),
    Socio(
        1,
        "Nuria Garcia Robledo",
        "NickDos",
        "123456789A",
        "2.00",
        "Calle Falsa nº1",
        43,
        "Revés",
        "Mañana",
        "jose@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1593529467220-9d721ceb9a78?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8ZmFjZXxlbnwwfHx8fDE3MTM0MTc1MTJ8MA&ixlib=rb-4.0.3&q=80&w=1080",
        true,
        10),
    Socio(
        2,
        "Manolo Martinez Soria",
        "NickTres",
        "123456789A",
        "3.00",
        "Calle Falsa nº1",
        7,
        "Revés",
        "Mañana",
        "manolo@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxmYWNlJTIwY2xvc2UlMjB8ZW58MHx8fHwxNzExNDY5NTAwfDA&ixlib=rb-4.0.3&q=80&w=1080",
        true,
        86),
    Socio(
        3,
        "Isabel García García",
        "NickCuatro",
        "123456789B",
        "5.50",
        "Calle Falsa nº6",
        24,
        "Revés",
        "Mañana",
        "isabel@reservatupista.com",
        "678123456",
        "15/04/2024",
        "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYWNlJTIwY2xvc2UlMjB1cHxlbnwwfHx8fDE3MTE0Njk1NzZ8MA&ixlib=rb-4.0.3&q=80&w=400",
        true,
        22),
  ].obs;

  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  bool? checkboxValue1;
  bool? checkboxValue2;
  bool? checkboxValue3;
  bool? checkboxValue4;

  final _selectChip = (-1).obs;
  int get selectChip => _selectChip.value;
  set selectChip(int value) => _selectChip.value = value;

  void cambiarChip() {
    switch (selectChip) {
      case 0:
        socios.sort((a, b) => a.nombre.compareTo(b.nombre));
      case 1:
        socios.sort((a, b) => a.nivel.compareTo(b.nivel));
      case 2:
      //Implementar por localidad
      default:
        socios.sort((a, b) => a.id.compareTo(b.id));
    }
  }

  void borrarChip() {
    if (selectChip != -1) {
      selectChip = -1;
      socios.sort((a, b) => a.id.compareTo(b.id));
    }
  }
}
