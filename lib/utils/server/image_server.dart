import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';

class ImageServer extends StatelessWidget {
  ImageServer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
  });
  final double? width;
  final double? height;
  final BoxFit? fit;
  final DBService db = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Image.network(
          db.fotoServer,
          width: width,
          height: height,
          fit: fit,
        ));
  }
}

class ImageProveedor extends StatelessWidget {
  const ImageProveedor({
    super.key,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    required this.foto,
  });
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String foto;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${DatosServer.urlServer}/images_proveedor/$foto.png',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
