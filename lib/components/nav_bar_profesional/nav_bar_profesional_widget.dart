import 'package:get/route_manager.dart';
import '../../app/routes/app_pages.dart';
import '../../utils/btn_icon.dart';
import '../../utils/colores.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NavBarProfesionalWidget extends StatefulWidget {
  const NavBarProfesionalWidget({
    super.key,
    this.tipoDePagina,
  });

  final TypePage? tipoDePagina;

  @override
  // ignore: library_private_types_in_public_api
  _NavBarProfesionalWidgetState createState() =>
      _NavBarProfesionalWidgetState();
}

class _NavBarProfesionalWidgetState extends State<NavBarProfesionalWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 550.ms,
          begin: 0.155,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 550.ms,
          begin: const Offset(0.0, -17.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isiOS ? 75.0 : 65.0,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: isiOS ? 60.0 : 50.0,
                  decoration: BoxDecoration(
                    color: LightModeTheme().primaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(0.0, -10.0),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.INICIO_PROVEEDOR);
                },
                isPage: widget.tipoDePagina == TypePage.Inicio,
                icon: Icons.home_rounded,
                title: 'Inicio',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.MIS_PISTAS);
                },
                isPage: widget.tipoDePagina == TypePage.MisReservas,
                icon: Icons.calendar_month,
                title: 'Mis Pistas',
              ),
              buildIconCenter(
                onPressed: () async {
                  Get.offAllNamed(Routes.ANADIR_PISTA);
                },
                isPage: widget.tipoDePagina == TypePage.ReservarPista,
                icon: Icons.add,
                title: 'Crear Pista',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.MIS_SOCIOS);
                },
                isPage: widget.tipoDePagina == TypePage.Monedero,
                icon: Icons.safety_divider,
                title: 'Mis Socios',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.PERFIL_PROVEEDOR);
                },
                isPage: widget.tipoDePagina == TypePage.Perfil,
                icon: Icons.person,
                title: 'Perfil',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIconCenter(
      {required String title,
      required IconData icon,
      required void Function() onPressed,
      isPage = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isiOS ? 15.0 : 5.0),
      child: Column(
        children: [
          isPage
              ? FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: Colores.proveedor.primary,
                  hoverColor: Colores.proveedor.primary69,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ).animateOnPageLoad(
                  animationsMap['iconButtonOnPageLoadAnimation1']!)
              : BtnIcon(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  hoverColor: Colores.proveedor.primary69,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: const Color(0xFF9299A1),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: LightModeTheme().bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: isPage
                      ? Colores.proveedor.primary
                      : LightModeTheme().primaryText,
                  fontSize: 10.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButtonMin(
      {required String title,
      required IconData icon,
      required void Function() onPressed,
      isPage = false}) {
    return Padding(
      padding: isiOS
          ? const EdgeInsets.only(bottom: 8.0)
          : const EdgeInsets.only(top: 10.0),
      child: BtnIcon(
        onPressed: onPressed,
        hoverColor: Colores.proveedor.primary69,
        borderRadius: 12,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isPage
                ? Icon(
                    icon,
                    color: Colores.proveedor.primary,
                    size: 24.0,
                  ).animateOnPageLoad(
                    animationsMap['iconButtonOnPageLoadAnimation1']!)
                : Icon(
                    icon,
                    color: const Color(0xFF9299A1),
                    size: 24.0,
                  ),
            Text(
              title,
              style: LightModeTheme().bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: isPage
                        ? Colores.proveedor.primary
                        : LightModeTheme().primaryText,
                    fontSize: 10.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
