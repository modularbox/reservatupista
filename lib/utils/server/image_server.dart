import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/database.dart';

class ImageServer extends StatefulWidget {
  ImageServer(
      {super.key,
      this.width = 100,
      this.height = 100,
      this.fit = BoxFit.cover,
      this.changeImage});
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? changeImage;

  @override
  State<ImageServer> createState() => _ImageServerState();
}

class _ImageServerState extends State<ImageServer> {
  final DatabaseController db = DatabaseController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.getImageUsuario(widget.changeImage);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => db.imageServer.value == ''
        ? const SizedBox.shrink()
        : Image.network(
            db.imageServer.value,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
          ));
  }
}
