import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pruebas_c.dart';

class PruebasPage extends GetView<PruebasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PruebasPage'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('PruebasController'),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => controller.pruebas(),
              splashColor: Colors.blueGrey,
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
