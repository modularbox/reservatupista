import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'alert_versions_widget.dart';

extension SizedBoxExt on double {
  SizedBox get sh => SizedBox(height: this);
  SizedBox get sw => SizedBox(width: this);
}

class NavBarLogin extends StatelessWidget {
  const NavBarLogin({super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@reservatupista.com',
      queryParameters: {
        'subject': 'Contacto ReservatuPista',
      },
    );

    _launchInBrowser(emailLaunchUri);
  }

  void launchWhatsApp() async {
    String url = "https://wa.me/34653483483";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'No se pudo abrir WhatsApp.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 90,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width - (155),
              height: 40,
              constraints: const BoxConstraints(maxWidth: 300),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  'Premio a la Creación en la Industria del\nSoftware para la Provincia de Cáceres',
                  textAlign: TextAlign.center,
                  style: LightModeTheme().labelSmall,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          left: 5,
          child: Container(
            width: 60.0,
            height: 60.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Image.asset(
              'assets/images/logo_diputacion_caseres.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          right: 5,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: const Color(0xFF00E676),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: BtnIcon(
              hoverColor: const Color.fromARGB(117, 0, 0, 0),
              borderRadius: 30,
              onPressed: () =>
                  _launchInBrowser(Uri.parse("https://wa.me/34653483483")),
              icon: Container(
                width: 45.0,
                height: 45.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/icon_whatsapp.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: LightModeTheme().secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: LightModeTheme().primaryText,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Versions(),
                      BtnIcon(
                        hoverColor: const Color.fromARGB(144, 255, 255, 255),
                        padding: const EdgeInsets.all(0),
                        onPressed: _sendEmail,
                        icon: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: LightModeTheme().bottomBarLoginText,
                              size: 20.0,
                            ),
                            Text(
                              'info@reservatupista.com',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: LightModeTheme().bottomBarLoginText,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      BtnIcon(
                        hoverColor: const Color.fromARGB(144, 255, 255, 255),
                        padding: const EdgeInsets.all(0),
                        onPressed: () =>
                            _launchInBrowser(Uri.parse("tel:34653483483")),
                        icon: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: LightModeTheme().bottomBarLoginText,
                              size: 20.0,
                            ),
                            1.0.sw,
                            Text(
                              '653483483',
                              style: LightModeTheme().bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: LightModeTheme().bottomBarLoginText,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '© 2023 MODULARBOX S.L.${MediaQuery.sizeOf(context).width < 500 ? '\n' : ' '}TODOS LOS DERECHOS RESERVADOS',
                  textAlign: TextAlign.center,
                  style: LightModeTheme().bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
