import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '../animations/add_animation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../sizer.dart';

class SeleccionarImagen extends StatelessWidget {
  const SeleccionarImagen(
      {super.key,
      required this.pickImage,
      // this.galeria,
      // this.imageLocal,
      this.isProveedor = false});
  final Future<void> Function(ImageSource, {String? path}) pickImage;
  // final void Function()? galeria;
  // final void Function(String)? imageLocal;
  final bool isProveedor;
  @override
  Widget build(BuildContext context) {
    final listaIconsGrid = [
      'icon_sport_padel',
      'icon_sport_sports_women',
      'icon_sport_sports_men',
      'icon_sport_baseball',
      'icon_sport_basketball',
      'icon_sport_football',
      'icon_sport_rugby',
      'icon_sport_sports_bottle',
      'icon_sport_swimming',
      'icon_sport_table_tennis',
      'icon_sport_tennis',
      'icon_sport_trophy',
      'icon_sport_wistle',
    ];

    Widget buildListIcons() {
      return Expanded(
        child: GridView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          scrollDirection: Axis.vertical,
          children: List.generate(
            listaIconsGrid.length,
            (i) => BtnIcon(
              onPressed: () =>
                  pickImage(ImageSource.camera, path: listaIconsGrid[i]),
              padding: const EdgeInsets.all(0),
              borderColor: const Color.fromARGB(255, 226, 6, 255),
              borderWidth: 3,
              borderRadius: 30,
              hoverColor: const Color.fromARGB(255, 226, 6, 255),
              icon: Image.asset(
                'assets/images/${listaIconsGrid[i]}.png',
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 100.h,
      width: Get.width,
      child: Center(
        child: AddAnimationWidget(
          height: isProveedor ? 350 : 50.h,
          child: Container(
            width: 100.w,
            height: isProveedor ? 350 : 100.h,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x3B1D2429),
                  offset: Offset(0, -3),
                )
              ],
              borderRadius: isProveedor
                  ? const BorderRadius.all(Radius.circular(16))
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isiOS ? 40 : 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Elige la foto',
                    style: FlutterFlowTheme.of(context)
                        .titleLarge
                        .copyWith(decoration: TextDecoration.none),
                  ),
                  5.0.sh,
                  isProveedor ? 0.0.sh : buildListIcons(),
                  buildBtnsImage(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBtnsImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          isWeb
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () => pickImage(ImageSource.camera),
                    text: 'Camara',
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 25,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge,
                      elevation: 2,
                      splashColor: const Color.fromARGB(65, 0, 0, 0),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () => pickImage(ImageSource.gallery),
              text: 'Galería',
              icon: const Icon(
                Icons.collections,
                size: 25,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                elevation: 2,
                splashColor: const Color.fromARGB(65, 0, 0, 0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Cancel',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).errorGeneral,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
