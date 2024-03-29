import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/routes/app_pages.dart';
import '../../../app/routes/database.dart';
import '../../../app/widgets/terminos_condiciones.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../components/navbar_y_appbar_profesional.dart';
import '../../../utils/auto_size_text/auto_size_text.dart';
import '../../../utils/btn_icon.dart';
import '../../../utils/colores.dart';
import '../../../utils/server/image_server.dart';
import '../../../utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PerfilProfesionalWidget extends StatelessWidget {
  PerfilProfesionalWidget({super.key});
  final btnSize = GlobalKey<ScaffoldState>();
  final keyLogo = GlobalKey<ScaffoldState>();
  final DatabaseController db = Get.find();

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    return NavbarYAppbarProfesional(
        title: 'Perfil Proveedor',
        page: TypePage.Perfil,
        isTitle: true,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 100.h <= 745
                ? datosPerfil(
                    space: spaceSizedBoxBtnCerrarRes(),
                    subAppBar: subAppBar(true),
                    height: 50,
                    top: 10,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2))
                : datosPerfil(
                    space: spaceSizedBoxBtnCerrar(),
                    subAppBar: subAppBar(false))));
  }

  Widget subAppBar(bool responsive) {
    if (responsive) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(Get.context!).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(Get.context!).tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(Get.context!).secondary,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: BtnIcon(
                    onPressed: () {
                      Get.dialog(GestureDetector(
                          onTap: () => Get.back(),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageServer(
                                  width: 200,
                                  height: 400,
                                ),
                              ])));
                    },
                    borderRadius: 50,
                    padding: const EdgeInsets.all(0),
                    fillColor: Colors.transparent,
                    hoverColor: const Color.fromARGB(68, 255, 255, 255),
                    icon: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ImageServer()),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Center(
                  child: SizedBox(
                      width: 100.w - 138,
                      child: AutoSizeText(
                        db.datosProveedor!.nombreComercial,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(Get.context!).headlineSmall,
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(Get.context!).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(Get.context!).tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(Get.context!).secondary,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: BtnIcon(
                    onPressed: () {
                      Get.dialog(GestureDetector(
                          onTap: () => Get.back(),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: ImageServer(
                                    width: null,
                                    height: null,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ])));
                    },
                    borderRadius: 50,
                    padding: const EdgeInsets.all(0),
                    fillColor: Colors.transparent,
                    hoverColor: const Color.fromARGB(68, 255, 255, 255),
                    icon: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ImageServer()),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Center(
                  child: SizedBox(
                      width: 100.w - 138,
                      child: AutoSizeText(
                        db.datosProveedor!.nombreComercial,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(Get.context!).headlineSmall,
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  SizedBox spaceSizedBoxBtnCerrar() {
    const sizeLogo = 122;
    const sizeBtns = 72 * 6;
    const sizeAppbar = 55;
    const sizeBtnCerrar = 45;
    const sizeNavBar = 65;
    const paddingBottom = 10;
    final sizeTotal = 100.h -
        (sizeLogo +
            sizeBtns +
            sizeAppbar +
            sizeBtnCerrar +
            sizeNavBar +
            paddingBottom);
    return sizeTotal.sh;
  }

  SizedBox spaceSizedBoxBtnCerrarRes() {
    const sizeLogo = 86;
    const sizeBtns = 60 * 6;
    const sizeAppbar = 55;
    const sizeBtnCerrar = 45;
    const sizeNavBar = 65;
    const paddingBottom = 10;
    final sizeTotal = 100.h -
        (sizeLogo +
            sizeBtns +
            sizeAppbar +
            sizeBtnCerrar +
            sizeNavBar +
            paddingBottom);
    return sizeTotal <= 0 ? const SizedBox() : sizeTotal.sh;
  }

  List<Widget> datosPerfil(
      {required Widget subAppBar,
      required SizedBox space,
      double? top,
      double? height,
      EdgeInsetsGeometry? padding}) {
    return [
      subAppBar,
      ButtonPerfil(
        title: 'Banco Virtual',
        icon: Icons.credit_card,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.BANCOVIRTUAL);
        },
      ),
      ButtonPerfil(
        title: 'Datos',
        icon: Icons.dehaze,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.DATOS_PROVEEDOR);
        },
      ),
      ButtonPerfil(
        title: 'Socio',
        icon: Icons.safety_divider,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.MIS_SOCIOS);
        },
      ),
      ButtonPerfil(
        title: 'Notificaciones',
        icon: Icons.notifications_none,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.NOTIFICACIONESPROFESIONAL);
        },
      ),
      ButtonPerfil(
        title: 'Términos de servicio',
        icon: Icons.privacy_tip_rounded,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.dialog(const TerminosCondiciones());
        },
      ),
      ButtonPerfil(
        title: 'Invitar a amigos',
        icon: Icons.ios_share,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          await Share.share(
            'https://reservatupista.com/',
          );
        },
      ),
      isiOS
          ? const SizedBox(
              height: 25,
            )
          : space,
      buildBtnCerrar()
    ];
  }

  Widget buildBtnCerrar() {
    return Container(
      width: 200,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF77066),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3416202A),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: BtnIcon(
        onPressed: () async {
          Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 1);
        },
        hoverColor: Colores().usuario.primary69,
        borderRadius: 12,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Cerrar Sesión',
                style: FlutterFlowTheme.of(Get.context!).bodyLarge,
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(0.9, 0),
              child: Icon(
                Icons.logout,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum TypeIcon { svg, image, icon }

class ButtonPerfil extends StatelessWidget {
  ButtonPerfil(
      {super.key,
      required this.onPressed,
      required this.title,
      this.padding,
      this.typeIcon,
      this.top,
      this.pathAsset,
      this.height,
      this.icon});
  final void Function() onPressed;
  final Color hoverColor = Colores().proveedor.primary69;
  final String title;
  final IconData? icon;
  final TypeIcon? typeIcon;
  final String? pathAsset;
  final double? top;
  final double? height;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final iconColor = Colores().proveedor.primary;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, top ?? 12, 16, 0),
      child: Container(
        width: double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: BtnIcon(
          onPressed: onPressed,
          hoverColor: hoverColor,
          borderRadius: 12,
          icon: Padding(
            padding: padding ?? EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                buildIcon(context, iconColor),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      title,
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(BuildContext context, Color iconColor) {
    switch (typeIcon) {
      case TypeIcon.svg:
        return SvgPicture.asset(
          'assets/images/${pathAsset!}.svg',
          height: 26,
          width: 26,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      case TypeIcon.image:
        return Image.asset('assets/images/${pathAsset!}');
      default:
        return Icon(
          icon,
          color: iconColor,
          size: 24,
        );
    }
  }
}
