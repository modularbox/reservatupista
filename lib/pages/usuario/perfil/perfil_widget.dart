import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/dialog/link_dialog.dart';
import 'package:reservatu_pista/utils/loader/color_loader_3.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../../../app/routes/app_pages.dart';
import '../../../app/routes/database.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../components/navbar_y_appbar_usuario.dart';
import '../../../utils/btn_icon.dart';
import '../../../utils/colores.dart';
import '../../../utils/server/image_server.dart';
import '../../../utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class PerfilWidget extends StatefulWidget {
  const PerfilWidget({super.key});

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  DatabaseController db = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final keyColumn = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.getDatosUsuarioId();
  }

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

    return NavbarYAppbarUsuario(
        title: 'Perfil',
        page: TypePage.Perfil,
        isTitle: true,
        child: db.datosPerfilUsuario.obx(
            (state) => Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: 100.h <= 745
                                ? datosPerfil(
                                    space: spaceSizedBoxBtnCerrarRes(),
                                    subAppBar: subAppBar(true),
                                    height: 50,
                                    top: 10,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2))
                                : datosPerfil(
                                    space: spaceSizedBoxBtnCerrar(),
                                    subAppBar: subAppBar(false))),
                      ),
                      Positioned(bottom: 0, child: buildBtnCerrar())
                    ],
                  ),
                ),
            onLoading: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ColorLoader3(),
            ),
            onEmpty: const SizedBox.shrink()));
  }

  Widget scrollPerfil({required Widget child}) {
    return SingleChildScrollView(child: child);
    if (isWeb) {
      return SingleChildScrollView(child: child);
    } else {
      return child;
    }
  }

  Widget subAppBar(bool responsive) {
    final nombre = db.datosUsuarioPerfil!.nombre;
    final apellidos = db.datosUsuarioPerfil!.apellidos;
    final nick = db.datosUsuarioPerfil!.nick;
    final nivel = db.datosUsuarioPerfil!.nivel == ''
        ? '0.0'
        : db.datosUsuarioPerfil!.nivel;
    if (responsive) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
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
                  color: LightModeTheme().tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: LightModeTheme().secondary,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 100.w - 138,
                        child: AutoSizeText(
                          '$nombre $apellidos',
                          textAlign: TextAlign.center,
                          style: LightModeTheme().headlineSmall,
                        )),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 4.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 100.w - 138,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            datos('Nick', nick),
                            5.0.sw,
                            datos('Nivel', nivel),
                          ],
                        ),
                      ),
                    ),
                  ],
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
          color: LightModeTheme().secondaryBackground,
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
                  color: LightModeTheme().tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: LightModeTheme().secondary,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 100.w - 138,
                        child: AutoSizeText(
                          '$nombre $apellidos',
                          textAlign: TextAlign.center,
                          style: LightModeTheme().headlineSmall,
                        )),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 4.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 100.w - 138,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            datos('Nick', nick),
                            10.0.sw,
                            datos('Nivel', nivel),
                          ],
                        ),
                      ),
                    ),
                  ],
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
        title: 'Monedero',
        icon: Icons.credit_card,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.MONEDERO);
        },
      ),
      ButtonPerfil(
        title: 'Datos',
        icon: Icons.dehaze,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.DATOS_USUARIO);
        },
      ),
      ButtonPerfil(
        title: 'Resultados/Estadísticas',
        icon: Icons.bar_chart_outlined,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.RESULTADOS_ESTADISTICAS);
        },
      ),
      ButtonPerfil(
        title: 'Detalles Club',
        icon: Icons.people,
        top: top,
        height: height,
        padding: padding,
        onPressed: () async {
          Get.toNamed(Routes.NOTIFICACIONES);
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
            alertTitle:
                richTitleLink('¿Deseas ir al enlace externo?', fontSize: 20.0),
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
    ];
  }

  Widget buildBtnCerrar() {
    return SizedBox(
      width: Get.width,
      child: Center(
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
            hoverColor: Colores().usuario.primary69,
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
  final Color hoverColor = Colores().usuario.primary69;
  final Color iconColor = Colores().usuario.primary;
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
