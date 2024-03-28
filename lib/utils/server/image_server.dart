import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import '../../app/routes/database.dart';

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
  final DatabaseController db = Get.find();

  @override
  Widget build(BuildContext context) {
    if (isWeb) {
      db.getImageServer();
    }
    return Obx(() => Image.network(
          db.imageServer.value,
          width: width,
          height: height,
          fit: fit,
        ));
  }
}
