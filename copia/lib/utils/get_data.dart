import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:reservatu_pista/app/routes/database.dart';

class GetData extends GetView<DatabaseController> {
  final Widget Function(dynamic value) data;
// Almacena la función como miembro de la clase

  GetData(this.data);
// Constructor que recibe la función

  @override
  Widget build(BuildContext context) {
    return Obx(() => data(controller.dineroTotal));
  }
}
