import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservatu_pista/app/data/provider/image_node.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/image/seleccionar_imagen.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';

class FuncionesImage {
  FuncionesImage({this.isProveedor = false});
  // Guardar imagen del usuario
  final imageFile = Rxn<String>();
  // Obtener imagen en Web
  final imageBytes = Rxn<Uint8List>();
  // Controllador para ver el cambio de estado de la imagen
  final controller = TextEditingController();
  // Obtener imagen en Web
  final bool isProveedor;

  /// Reducir imagen
  Future<File> imageResize(String path) async {
    // Imagen decoded
    img.Image image = img.decodeImage(File(path).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 150,
      height: 300,
    );
    // Regresar la imagen comprimida
    return File(path)
      ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 60));
  }

  /// Reducir imagen en bytes
  Future<Uint8List> imageResizeBytes(Uint8List imageData) async {
    // Decodificar la imagen desde Uint8List
    img.Image image = img.decodeImage(imageData)!;

    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 150,
      height: 300,
    );

    // Codificar la imagen como Uint8List
    Uint8List compressedImageData =
        Uint8List.fromList(img.encodeJpg(compressedImage, quality: 60));

    // Devolver la imagen comprimida
    return compressedImageData;
  }

  /// Guardar el asset en el servidor
  Future<File> copiarAssetAFile(String path) async {
    try {
      // Especifica el path relativo del activo
      String pathAsset = 'assets/images/$path.png';
      // Obtiene el contenido del activo como bytes
      List<int> bytes = await rootBundle
          .load(pathAsset)
          .then((byteData) => byteData.buffer.asUint8List());
      // Obtiene el directorio temporal del sistema
      Directory tempDir = await getTemporaryDirectory();
      // Crea un archivo temporal con el contenido del activo
      File tempFile = File('${tempDir.path}/image_asset.png');
      return await tempFile.writeAsBytes(bytes);
    } catch (error) {
      throw ('Error al copiar el activo a un archivo: $error');
    }
  }

  Future<bool> convertirSubirImagen(String destination, String nameFoto) async {
    if (imageBytes.value != null) {
      // Subir Imagen en nodejs y reducir su tamano en bytes
      return ImageNodeProvider.subirImageBytes(
          await imageResizeBytes(imageBytes.value!),
          destination: destination,
          nameFoto: nameFoto);
    } else if (imageFile.value != null) {
      if (imageFile.value![0] == '@') {
        // Subir Imagen en nodejs y copiarAssetLocal
        return await ImageNodeProvider.subirImageFile(
            await copiarAssetAFile(imageFile.value!.substring(1)),
            destination: destination,
            nameFoto: nameFoto);
      } else {
        // Subir Imagen en nodejs y reducir su tamano
        return await ImageNodeProvider.subirImageFile(
            await imageResize(imageFile.value!),
            destination: destination,
            nameFoto: nameFoto);
      }
    }
    return false;
  }

  Future<void> pickImage(ImageSource source, {String? path}) async {
    if (path != null) {
      imageFile.value = '@$path';
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        if (isWeb) {
          imageBytes.value = await pickedFile.readAsBytes();
        } else {
          imageFile.value = pickedFile.path;
        }
      }
    }
    Get.back();
  }

  Widget getImageWidget() {
    if (imageBytes.value != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.memory(
          imageBytes.value!,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: getImageOrAsset(imageFile.value,
          isRegristro: true, isProveedor: isProveedor),
    );
  }

  Widget getImageOrAsset(String? nameFile,
      {bool isRegristro = false,
      bool isProveedor = false,
      double? width,
      double? height,
      IconData? icon}) {
    if (isRegristro) {
      return nameFile != null
          ? nameFile[0] == '@'
              ? Image.asset(
                  'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(nameFile),
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
          : Icon(icon ?? Icons.edit_square,
              color: isProveedor
                  ? Colores.proveedor.primary
                  : Colores.usuario.primary,
              size: 40);
    } else {
      return nameFile != null
          ? nameFile[0] == '@'
              ? Image.asset(
                  'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(nameFile),
                  width: width ?? 100.0,
                  height: height ?? 100.0,
                  fit: BoxFit.cover,
                )
          : Image.asset(
              isProveedor
                  ? 'assets/images/logo_reservatupista.png'
                  : 'assets/images/foto_avatar.png',
              width: width ?? 100.0,
              height: height ?? 100.0,
              fit: BoxFit.cover,
            );
    }
  }

  void dialogSeleccionarImage() => Get.dialog(
      SeleccionarImagen(pickImage: pickImage, isProveedor: isProveedor));

  /// Validator para TextEditingController
  String? validatorImage(String? val) {
    print(imageFile.value != null || imageBytes.value != null ? null : '');
    return imageFile.value != null || imageBytes.value != null ? null : '';
  }

  /// Existe imagen
  bool existeImagen() {
    return imageFile.value != null || imageBytes.value != null;
  }

  /// Widget para mostrar la imagen en file o en bytes
  Widget widgetImage({
    final double? width,
    final double? height,
    final BoxFit? fit,
  }) {
    if (imageFile.value != null) {
      Image.file(File(imageFile.value!),
          height: height, width: width, fit: fit);
    }
    if (imageBytes.value != null) {
      Image.memory(imageBytes.value!, height: height, width: width, fit: fit);
    }
    return const SizedBox.shrink();
  }

  /// Widget para mostrar la imagen en file o en bytes
  ImageProvider<Object>? widgetBackgroundImage() {
    if (imageFile.value != null) {
      FileImage(
        File(imageFile.value!),
      );
    }
    if (imageBytes.value != null) {
      MemoryImage(imageBytes.value!);
    }
    return null;
  }
}
