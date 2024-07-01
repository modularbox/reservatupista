import 'package:get/get.dart';

// /*WEB
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'dart:html' as html;
import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'dart:js' as js;

void clearBrowserCache() {
  js.context.callMethod('clearCache');
}

bool isSafari() {
  // Obtener el userAgent del navegador
  String userAgent = html.window.navigator.userAgent.toLowerCase();
  // Verificar si el navegador es Safari
  return userAgent.contains('safari') && !userAgent.contains('chrome');
}

Future<void> openUrlInSafari(String url) async {
  print('---------_openUrlInSafari ');
  html.window.open(url, '_self');
}

void quitarAlmohadilla() {
  // Configurar la estrategia de URL sin hash
  setUrlStrategy(PathUrlStrategy());
  clearBrowserCache();
}

void moverRoutes() {
  /// Si la ruta no existe volvemos a la pagina que deberia ser
  String getRouteNotParameters(String route) {
    final splitRoute = route.split('?');
    if (splitRoute.isNotEmpty) {
      return splitRoute[0];
    }
    return route;
  }

  /// Regresar a la pagina anterior
  void backPage(String getRoute, String newRoute) {
    if (getRouteNotParameters(Get.currentRoute) == getRoute) {
      Get.offNamed(newRoute);
    }
  }

  backPage(
      RoutesType.pistas_proveedor.getRoute, RoutesType.anadir_pista.getRoute);
  backPage(RoutesType.registrar_proveedor.getRoute,
      RoutesType.login_usuario.getRoute);
  backPage(
      RoutesType.registrar_usuario.getRoute, RoutesType.login_usuario.getRoute);
  backPage(
      RoutesType.olvide_contrasena.getRoute, RoutesType.login_usuario.getRoute);
  backPage(RoutesType.registrar_proveedor.getRoute,
      RoutesType.login_usuario.getRoute);
  backPage(RoutesType.datos_usuario.getRoute, RoutesType.perfil.getRoute);
  backPage(RoutesType.datos_usuario.getRoute, RoutesType.perfil.getRoute);
  backPage(RoutesType.datos_proveedor.getRoute,
      RoutesType.perfil_proveedor.getRoute);
  backPage(RoutesType.notificaciones.getRoute, RoutesType.inicio.getRoute);
  backPage(RoutesType.notificaciones_proveedor.getRoute,
      RoutesType.inicio_proveedor.getRoute);
  backPage(RoutesType.chat.getRoute, RoutesType.inicio.getRoute);
  backPage(
      RoutesType.chat_proveedor.getRoute, RoutesType.inicio_proveedor.getRoute);
  backPage(
      RoutesType.resultados_estadisticas.getRoute, RoutesType.perfil.getRoute);
}
// WEB*/
/*
bool isSafari() {
  return false;
}

Future<void> openUrlInSafari(String url) async {}

void quitarAlmohadilla() {}

void moverRoutes() {
  Get.back();
}
*/