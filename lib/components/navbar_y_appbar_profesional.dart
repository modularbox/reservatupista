import 'package:reservatu_pista/utils/responsive_web.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../components/appbar_profesional.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_profesional/nav_bar_profesional_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavbarYAppbarProfesional extends StatelessWidget {
  const NavbarYAppbarProfesional(
      {super.key,
      required this.child,
      required this.title,
      this.page,
      this.isTitle = false,
      this.isTitleBack = false,
      this.isNavBar = true});
  final String title;
  final bool isTitle;
  final bool isTitleBack;
  final Widget child;
  final TypePage? page;
  final bool isNavBar;
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
    EdgeInsets padding = MediaQuery.of(context).padding;
    double paddingTop = padding.top;
    return Scaffold(
      body: SafeArea(
        top: false,
        right: false,
        left: false,
        bottom: true,
        child: Stack(
          children: [
            Column(
              children: [
                paddingTop.sh,
                ResponsiveWeb(
                  child: AppbarProfesional(
                    title: title,
                    isTitle: isTitle,
                    isTitleBack: isTitleBack,
                  ),
                ),
                child,
              ],
            ),
            ResponsiveWeb(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: NavBarProfesionalWidget(
                tipoDePagina: page,
              ),
            )).visible(isNavBar),
          ],
        ),
      ),
    );
  }
}
