import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/provider/datos_server.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';

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
  final _imageInfo = Rxn<ImageInfo>();

  @override
  Widget build(BuildContext context) {
    if (isWeb) {
      return Image.network(
        db.fotoServer,
        width: 200,
        height: 200,
        fit: fit,
      );
    }
    final ImageStream newStream = Image.network(
      db.fotoServer, // Reemplaza con la URL de tu imagen
    ).image.resolve(ImageConfiguration.empty);

    newStream.addListener(ImageStreamListener((info, _) {
      _imageInfo.value = info;
    }));
    return Obx(() => Visible(
          isVisible: db.fotoServer != '' && _imageInfo.value != null,
          child: mostrarImage(),
        ));
  }

  Widget mostrarImage() {
    if (_imageInfo.value!.image.width < 200) {
      return Image.network(
        db.fotoServer,
        width: 200,
        height: 200,
        fit: fit,
      );
    } else {
      return Image.network(
        db.fotoServer,
        width: width,
        height: height,
        fit: fit,
      );
    }
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
