import 'package:reservatu_pista/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'appbar_usuario.dart';

class NavbarYAppbarUsuario extends StatelessWidget {
  const NavbarYAppbarUsuario({
    super.key,
    required this.child,
    required this.title,
    this.page,
    this.isTitle = false,
    this.isTitleBack = false,
    this.isNavBar = true,
  });
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
        body: Stack(
          children: [
            Column(
              children: [
                paddingTop.sh,
                AppbarUsuario(
                    title: title, isTitle: isTitle, isTitleBack: isTitleBack),
                child,
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: NavBarUsuarioWidget(
                tipoDePagina: page,
              ),
            ).visible(isNavBar)
          ],
        ),
        bottomNavigationBar: Container(
          height: 0.0,
          margin: isiOS ? const EdgeInsets.only(bottom: 10.0) : null,
        ));
  }
}
