import 'package:get/get.dart';
import '../../../components/appbar_profesional.dart';
import '../app/routes/app_pages.dart';
import '../utils/dialog/rich_alert.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_profesional/nav_bar_profesional_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NavbarYAppbarProfesional extends StatelessWidget {
  const NavbarYAppbarProfesional(
      {super.key,
      required this.child,
      required this.title,
      this.page,
      this.isTitle = false,
      this.isTitleBack = false});
  final String title;
  final bool isTitle;
  final bool isTitleBack;
  final Widget child;
  final TypePage? page;
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

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: isTitleBack
          ? SafeArea(
              top: true,
              child: Column(
                children: [
                  AppbarProfesional(
                    title: title,
                    isTitle: isTitle,
                    isTitleBack: isTitleBack,
                  ),
                  child,
                ],
              ),
            )
          : WillPopScope(
              onWillPop: () async {
                /// Mensaje para saber si el usuario quiere cerrar sesion
                await Get.dialog(RichAlertDialog(
                  alertTitle: richTitle("Cerrar Sesión"),
                  alertSubtitle:
                      richSubtitle("¿Estás seguro de cerrar la sesión?"),
                  textButton: "Aceptar",
                  actions: [
                    defaultAction(Colors.red, () => Get.back(), 'Cancelar'),
                    const SizedBox(
                      width: 20,
                    ),
                    defaultAction(
                        Colors.blue,
                        () =>
                            Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 1),
                        'Aceptar')
                  ],
                  alertType: RichAlertType.WARNING,
                  onPressed: () => Get.back(),
                ));
                return false;
              },
              child: SafeArea(
                top: true,
                child: Column(
                  children: [
                    AppbarProfesional(
                      title: title,
                      isTitle: isTitle,
                      isTitleBack: isTitleBack,
                    ),
                    child,
                  ],
                ),
              ),
            ),
      bottomNavigationBar: page != null
          ? NavBarProfesionalWidget(
              tipoDePagina: page!,
            )
          : const SizedBox(),
    );
  }
}
