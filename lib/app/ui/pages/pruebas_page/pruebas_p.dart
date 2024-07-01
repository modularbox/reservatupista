import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pruebas_c.dart';
import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PruebasPage extends GetView<PruebasController> {
  final ScrollController _scrollController = ScrollController();

  void _handlePointerSignal(PointerSignalEvent event) {
    print("dskjnksd");
    if (event is PointerScrollEvent) {
      print(event.scrollDelta);

      // Detecta la dirección del desplazamiento
      if (event.scrollDelta.dy > 0) {
        print('Scrolling down');
      } else if (event.scrollDelta.dy < 0) {
        print('Scrolling up');
      }
    }
    print("handle");
  }

  @override
  Widget build(BuildContext context) {
    // return HomePage(title: 'fdsjhfjs');
    return Scaffold(
      body: Obx(() => SafeArea(
            child: controller.imageElegir.imageFile.value != null
                ? mostrarImagen()
                : Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () => controller.imageElegir
                            .dialogSeleccionarImage(context),
                        splashColor: Colors.blueGrey,
                        child: const Text(
                          'Seleccionar Imagen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }

  Widget mostrarImagen() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 500,
        width: 400,
        color: Colors.black,
        child: Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(width: 1, color: Colors.white)),
            child: Image.file(
              File(controller.imageElegir.imageFile.value!),
            )),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   final String title;

//   const HomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   XFile? _pickedFile;
//   CroppedFile? _croppedFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (kIsWeb)
//             Padding(
//               padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
//               child: Text(
//                 widget.title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .displayMedium!
//                     .copyWith(color: Theme.of(context).highlightColor),
//               ),
//             ),
//           Expanded(child: _body()),
//         ],
//       ),
//     );
//   }

//   Widget _body() {
//     if (_croppedFile != null || _pickedFile != null) {
//       return _imageCard();
//     } else {
//       return _uploaderCard();
//     }
//   }

//   Widget _imageCard() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: kIsWeb ? 24.0 : 16.0),
//             child: Card(
//               elevation: 4.0,
//               child: _image(),
//             ),
//           ),
//           const SizedBox(height: 24.0),
//           _pickedFile != null
//               ? Container(
//                   width: 108,
//                   height: 65,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                     image: FileImage(
//                       File(_pickedFile!.path),
//                     ),
//                     fit: BoxFit.fill,
//                   )),
//                 )
//               : const SizedBox.shrink(),
//           _menu(),
//         ],
//       ),
//     );
//   }

//   Widget _image() {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     if (_croppedFile != null) {
//       final path = _croppedFile!.path;
//       return ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: 0.8 * screenWidth,
//           maxHeight: 0.7 * screenHeight,
//         ),
//         child: kIsWeb
//             ? Image.network(path)
//             : Image.file(
//                 File(path),
//               ),
//       );
//     } else if (_pickedFile != null) {
//       final path = _pickedFile!.path;
//       return ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: 0.8 * screenWidth,
//           maxHeight: 0.7 * screenHeight,
//         ),
//         child: kIsWeb
//             ? Image.network(path)
//             : Image.file(
//                 File(path),
//               ),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }

//   Widget _menu() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         FloatingActionButton(
//           onPressed: () {
//             _clear();
//           },
//           backgroundColor: Colors.redAccent,
//           tooltip: 'Delete',
//           child: const Icon(Icons.delete),
//         ),
//         if (_croppedFile == null)
//           Padding(
//             padding: const EdgeInsets.only(left: 32.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 _cropImage();
//               },
//               backgroundColor: const Color(0xFFBC764A),
//               tooltip: 'Crop',
//               child: const Icon(Icons.crop),
//             ),
//           )
//       ],
//     );
//   }

//   Widget _uploaderCard() {
//     return Center(
//       child: Card(
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: SizedBox(
//           width: kIsWeb ? 380.0 : 320.0,
//           height: 300.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Container(
//                     color: Theme.of(context).highlightColor.withOpacity(0.4),
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.image,
//                             color: Theme.of(context).highlightColor,
//                             size: 80.0,
//                           ),
//                           const SizedBox(height: 24.0),
//                           Text(
//                             'Upload an image to start',
//                             style: kIsWeb
//                                 ? Theme.of(context)
//                                     .textTheme
//                                     .headlineSmall!
//                                     .copyWith(
//                                         color: Theme.of(context).highlightColor)
//                                 : Theme.of(context)
//                                     .textTheme
//                                     .bodyMedium!
//                                     .copyWith(
//                                         color:
//                                             Theme.of(context).highlightColor),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 24.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _uploadImage();
//                   },
//                   style:
//                       ElevatedButton.styleFrom(foregroundColor: Colors.white),
//                   child: const Text('Upload'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _cropImage() async {
//     print('_cropImage');
//     if (_pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: _pickedFile!.path,
//         compressFormat: ImageCompressFormat.png,
//         compressQuality: 100,
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.square,
//             lockAspectRatio: true,
//             aspectRatioPresets: [
//               CropAspectRatioPreset.square,
//               CropAspectRatioPresetCustom(),
//             ],
//           ),
//           IOSUiSettings(
//             title: 'Cropper',
//             aspectRatioPresets: [
//               CropAspectRatioPreset.square,
//               CropAspectRatioPresetCustom(),
//             ],
//           ),
//           WebUiSettings(
//             context: context,
//             presentStyle: WebPresentStyle.dialog,
//             size: const CropperSize(
//               width: 520,
//               height: 520,
//             ),
//           ),
//         ],
//       );

//       if (croppedFile != null) {
//         // Aquí puedes mostrar la imagen recortada o hacer más acciones con ella
//         showDialog(
//           context: context,
//           builder: (context) => Dialog(
//             child: Image.file(File(croppedFile.path)),
//           ),
//         );
//       }
//     }

//     return;
//     if (_pickedFile != null) {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: _pickedFile!.path,
//         compressFormat: ImageCompressFormat.jpg,
//         compressQuality: 100,
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.square,
//             lockAspectRatio: false,
//             aspectRatioPresets: [
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPresetCustom(),
//             ],
//           ),
//           IOSUiSettings(
//             title: 'Cropper',
//             aspectRatioPresets: [
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPresetCustom(),
//             ],
//           ),
//           WebUiSettings(
//             context: context,
//             presentStyle: WebPresentStyle.dialog,
//             size: const CropperSize(
//               width: 520,
//               height: 520,
//             ),
//           ),
//         ],
//       );
//       if (croppedFile != null) {
//         setState(() {
//           _croppedFile = croppedFile;
//         });
//       }
//     }
//   }

//   Future<void> _uploadImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _pickedFile = pickedFile;
//       });
//     }
//   }

//   void _clear() {
//     setState(() {
//       _pickedFile = null;
//       _croppedFile = null;
//     });
//   }
// }

// class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
//   @override
//   (int, int)? get data => (2, 3);

//   @override
//   String get name => '2x3 (customized)';
// }
