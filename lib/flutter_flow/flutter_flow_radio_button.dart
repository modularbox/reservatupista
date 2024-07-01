import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:reservatu_pista/app/global_widgets/radio_button.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/sizer.dart';

class FlutterFlowRadioButton extends StatelessWidget {
  FlutterFlowRadioButton(this._selectedRadio, {super.key});
  // Variable para mantener el valor seleccionado
  final RxInt _selectedRadio;
  final niveles = ['±0.25', '±0.50', 'Libre'];
  void _handleRadioValueChange(int? value) {
    _selectedRadio.value = value!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Obx(
          () =>
              // Stack(
              //   children: [
              CustomRadioButton(
            value: index,
            groupValue: _selectedRadio.value,
            onChanged: _handleRadioValueChange,
            label: niveles[index],

            // Positioned(
            //   left: -5,
            //   top: -13,
            //   child: Radio<int>(
            //     value: index,
            //     groupValue: _selectedRadio.value,
            //     onChanged: _handleRadioValueChange,
            //   ),
            // ),
            // Positioned(
            //   right: 0,
            //   child: Row(
            //     children: <Widget>[
            //       Text(niveles[index]),
            //     ],
            //   ),
            // ),
            // ],
            // ),
          ),
        ),
      ).divide(3.0.sw),
    );
  }
}
