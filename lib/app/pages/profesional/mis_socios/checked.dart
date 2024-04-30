import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checked extends StatelessWidget {
  const Checked({super.key});

  @override
  Widget build(BuildContext context) {
    // Crea una nueva instancia de RxBool cada vez que se crea un nuevo widget Checked
    final RxBool check = false.obs;
    return Obx(
        () => Checkbox(value: check.value, onChanged: (val) => check.toggle()));
  }
}
