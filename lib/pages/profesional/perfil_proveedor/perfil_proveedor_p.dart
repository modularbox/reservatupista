import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/dialog/link_dialog.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../app/routes/app_pages.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../components/navbar_y_appbar_profesional.dart';
import '../../../utils/btn_icon.dart';
import '../../../utils/colores.dart';
import '../../../utils/server/image_server.dart';
import '../../../utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import './perfil_proveedor_c.dart';

class PerfilProveedorPage extends GetView<PerfilProveedorController> {
  PerfilProveedorController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final keyColumn = GlobalKey<ScaffoldState>();
  PerfilProveedorPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(Get.context!).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return NavbarYAppbarProfesional(
        title: 'Perfil',
        page: TypePage.Perfil,
        isTitle: true,
        child: Expanded(
            child: self.nombreClub.obx(
                (nombreClub) => Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: 100.h <= 745
                                ? datosPerfil(
                                    space: spaceSizedBoxBtnCerrarRes(),
                                    subAppBar:
                                        subAppBar(true, nombreClub ?? ''),
                                    height: 50,
                                    top: 10,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2))
                                : datosPerfil(
                                    space: spaceSizedBoxBtnCerrar(),
                                    subAppBar:
                                        subAppBar(false, nombreClub ?? ''))),
                        buildBtnCerrar()
                      ],
                    ),
                onLoading: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: SizedBox(
                        width: 100,
                        child: ColorLoader(
                          radius: 12,
                          padding: const EdgeInsets.only(right: 10),
                        )),
                  ),
                ),
                onEmpty: Center(
                  child: Text('\nNo se encontraron pistas.',
                      style: LightModeTheme().bodyMedium.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ))));
  }

  Widget scrollPerfil({required Widget child}) {
    if (isWeb) {
      return SingleChildScrollView(child: child);
    } else {
      return child;
    }
  }

  Widget subAppBar(bool responsive, String nombreClub) {
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
                        nombreClub,
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
        child: ResponsiveWeb(
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
                        child: AutoSizeText(
                      nombreClub,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(Get.context!).headlineSmall,
                    )),
                  ),
                ),
              ],
            ),
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
    final botones = Expanded(
      child: SingleChildScrollView(
        child: ResponsiveWeb(
          child: Column(children: [
            ButtonPerfil(
              title: 'Caja',
              icon: Icons.credit_card,
              top: top,
              height: height,
              padding: padding,
              onPressed: () async {
                Get.toNamed(Routes.CAJA);
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
              title: 'Mi Club',
              icon: Icons.people,
              top: top,
              height: height,
              padding: padding,
              onPressed: () async {
                Get.toNamed(Routes.NOTIFICACIONES_PROVEEDOR);
              },
            ),
            ButtonPerfil(
              title: 'Términos de servicio',
              icon: Icons.privacy_tip_rounded,
              top: top,
              height: height,
              padding: padding,
              onPressed: () async {
                Get.dialog(LinkDialog(
                  alertTitle: richTitleLink('¿Deseas ir al enlace externo?',
                      fontSize: 20.0),
                  alertSubtitle: richSubtitleLink(
                      'https://reservatupista.com/politica-de-privacidad-proteccion-de-datos-y-politica-de-cookies'),
                ));
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
            100.0.sh
          ]),
        ),
      ),
    );
    return [subAppBar, botones];
  }

  Widget buildBtnCerrar() {
    return SizedBox(
      width: Get.width,
      child: Align(
        alignment: Get.width >= 1000
            ? const Alignment(0.9, -0.9)
            : Alignment.bottomCenter,
        child: Container(
          width: 200,
          height: 50,
          margin: EdgeInsets.only(
              bottom: 60.0 + (isiOS ? 15.0 : 0.0) + (isWeb ? 10.0 : 0.0)),
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
              Get.offAllNamed(Routes.LOGIN_USUARIO);
            },
            hoverColor: Colores.usuario.primary69,
            borderRadius: 12,
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    'Cerrar Sesión',
                    style: LightModeTheme().bodyLarge,
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
  final Color hoverColor = Colores.usuario.primary69;
  final Color iconColor = Colores.usuario.primary;
  final String title;
  final IconData? icon;
  final TypeIcon? typeIcon;
  final String? pathAsset;
  final double? top;
  final double? height;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, top ?? 12, 16, 0),
      child: Container(
        width: double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
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
                buildIcon(context),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      title,
                      style: LightModeTheme().bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: LightModeTheme().secondaryText,
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

  Widget buildIcon(BuildContext context) {
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

Widget datos(String title, String dato) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
      text: '$title: ',
      style: LightModeTheme().bodyMedium.copyWith(fontWeight: FontWeight.bold),
    ),
    TextSpan(
      text: dato,
      style:
          LightModeTheme().bodyMedium.copyWith(fontWeight: FontWeight.normal),
    ),
  ]));
}
