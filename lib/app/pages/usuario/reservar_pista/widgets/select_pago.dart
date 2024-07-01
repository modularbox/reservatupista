import 'package:flutter/material.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '../reservar_pista_c.dart';

class SelectPago extends StatelessWidget {
  final String label;
  final String value;
  final SelectionController controller;
  final ReservarPistaController self;
  const SelectPago(
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
            } else if (value == '00') {
              if (self.plazas_a_reservar.value != self.capacidad_pista) {
                self.dm.metodoPagoErrorTarjeta();
              }
            } else if (value == '0') {
              //if(db.plazasLibres)
              if (self.db.dineroTotal <= 0) {
                // es igual que value == '0' ya que comparo lo mismo al enviarle el value

                self.dm.faltaCreditosError();
              } else if (self.db.dineroTotal < self.precio_a_mostrar.value) {
                self.dm.saldoInsuficienteError();
              }
            }
            if (value != '0' && value != '00')
              controller.selectedOption.value = value;
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
                Visible(
                  isVisible: value == 'monedero',
                  child: Text(
                    self.db.dineroTotal.euro,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
