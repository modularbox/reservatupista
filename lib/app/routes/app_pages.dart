// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/anadir_pista_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_p.dart';
import 'package:reservatu_pista/pages/profesional/banco_virtual/banco_virtual_b.dart';
import 'package:reservatu_pista/pages/profesional/banco_virtual/banco_virtual_p.dart';
import 'package:reservatu_pista/pages/profesional/inicio_profesional/inicio_proveedor_b.dart';
import 'package:reservatu_pista/pages/profesional/inicio_profesional/inicio_proveedor_p.dart';
import 'package:reservatu_pista/pages/profesional/notificaciones_profesional/notificaciones_profesional_widget.dart';
import 'package:reservatu_pista/pages/profesional/perfil_proveedor/perfil_proveedor_b.dart';
import 'package:reservatu_pista/pages/profesional/perfil_proveedor/perfil_proveedor_p.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_b.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_p.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_b.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_p.dart';
import 'package:reservatu_pista/pages/usuario/notificaciones/notificaciones_widget.dart';
import 'package:reservatu_pista/pages/usuario/perfil/perfil_b.dart';
import 'package:reservatu_pista/pages/usuario/perfil/perfil_p.dart';
import '../pages/profesional/anadir_pista/anadir_pista_b.dart';
import '../pages/usuario/login_usuario/login_usuario.dart';
import '../pages/usuario/login_usuario/login_usuario_b.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario_p.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario_b.dart';
import '../ui/pages/pagotpv_page/pagotpv_b.dart';
import '../ui/pages/pagotpv_page/pagotpv_p.dart';
import '../pages/usuario/reservar_pista/reservar_pista.dart';
import '../pages/usuario/reservar_pista/reservar_pista_b.dart';
import '../pages/profesional/registro_proveedor/registrar_proveedor_p.dart';
import '../pages/profesional/registro_proveedor/registrar_proveedor_b.dart';
import '../pages/Profesional/mis_socios/mis_socios.dart';
import '../pages/Profesional/mis_socios/mis_socios_b.dart';
import '../pages/Profesional/datos_proveedor/datos_proveedor_p.dart';
import '../pages/Profesional/datos_proveedor/datos_proveedor_b.dart';
import '../pages/Profesional/prueba_proveedor/prueba_proveedor.dart';
import '../pages/Profesional/prueba_proveedor/prueba_proveedor_b.dart';
import '../pages/usuario/chat/chat.dart';
import '../pages/usuario/chat/chat_b.dart';
import '../pages/usuario/resultados_estadisticas/resultados_estadisticas.dart';
import '../pages/usuario/resultados_estadisticas/resultados_estadisticas_b.dart';
import '../pages/profesional/chat_proveedor/chat_proveedor.dart';
import '../pages/profesional/chat_proveedor/chat_proveedor_b.dart';
import '../pages/profesional/mis_pistas/mis_pistas_p.dart';
import '../pages/profesional/mis_pistas/mis_pistas_b.dart';
import '../pages/usuario/datos_usuario/datos_usuario_p.dart';
import '../pages/usuario/datos_usuario/datos_usuario_b.dart';
import '../pages/usuario/olvide_contrasena/olvide_contrasena.dart';
import '../pages/usuario/olvide_contrasena/olvide_contrasena_b.dart';
import '../pages/profesional/tarifas_pista/tarifas_pista.dart';
import '../pages/profesional/tarifas_pista/tarifas_pista_b.dart';
// End imports

/// Names Routes
abstract class Routes {
  static const LOGIN_USUARIO = '/login_usuario';
  static const REGISTRAR_USUARIO = '/registrar_usuario';
  static const PERFIL = '/perfil';
  static const MIS_RESERVAS = '/mis_reservas';
  static const DATOS = '/datos';
  static const PERFIL_PROVEEDOR = '/perfil_proveedor';
  static const MONEDERO = '/monedero';
  static const CAJA = '/caja';
  static const ANADIR_PISTA = '/anadir_pista';
  static const TARIFAS = '/tarifas';
  static const MIS_PISTAS = '/mis_pistas';
  static const NOTIFICACIONES = '/notificaciones';
  static const NOTIFICACIONES_PROVEEDOR = '/notificaciones_proveedor';
  static const INICIO_PROVEEDOR = '/inicio_profesional';
  static const INICIO = '/inicio';
  static const RESERVAR_PISTA = '/reservar_pista';
  static const PAGOS_TARJETA = '/pagos_tarjeta';
  static const REGISTRAR_PROVEEDOR = '/registrar_proveedor';
  static const MIS_SOCIOS = '/mis_socios';
  static const DATOS_PROVEEDOR = '/datos_proveedor';
  static const PRUEBA_PROVEEDOR = '/prueba_proveedor';
  static const CHAT = '/chat';
  static const RESULTADOS_ESTADISTICAS = '/resultados_estadisticas';
  static const CHAT_PROVEEDOR = '/chat_proveedor';
  static const RESERVA_TU_PISTA = '/reserva_tu_pista';
  static const DATOS_USUARIO = '/datos_usuario';
  static const OLVIDE_CONTRASENA = '/olvide_contrasena';
  static const TARIFAS_PISTA = '/tarifas_pista';
  static const PAGO_TPV = '/pago_tpv';
  static const PRUEBAS = '/pruebas';
}

/// Get Routes
class AppPages {
  static const INITIAL = Routes.LOGIN_USUARIO;
  static final routes = [
    /// Login Usuario
    GetPage(
      name: Routes.LOGIN_USUARIO,
      page: () => LoginUsuarioPage(),
      binding: LoginUsuarioBinding(),
    ),

    /// Registrar Usuario
    GetPage(
      name: Routes.REGISTRAR_USUARIO,
      page: () => RegistrarUsuarioPage(),
      binding: RegistrarUsuarioBinding(),
    ),

    /// Registrar Proveedor
    GetPage(
      name: Routes.REGISTRAR_PROVEEDOR,
      page: () => RegistrarProveedorPage(),
      binding: RegistrarProveedorBinding(),
    ),

    /// Inicio Usuario
    GetPage(
      name: Routes.INICIO,
      binding: InicioBinding(),
      page: () => InicioPage(),
      transition: Transition.noTransition,
    ),

    /// Mis Reservas
    GetPage(
      name: Routes.MIS_RESERVAS,
      page: () => MisReservasPage(),
      binding: MisReservasBinding(),
      transition: Transition.noTransition,
    ),

    /// Reservar pista
    GetPage(
      name: Routes.RESERVAR_PISTA,
      page: () => ReservarPistaPage(),
      binding: ReservarPistaBinding(),
      transition: Transition.noTransition,
    ),

    /// Monedero
    GetPage(
      name: Routes.MONEDERO,
      page: () => MonederoPage(),
      binding: MonederoBinding(),
      transition: Transition.noTransition,
    ),

    /// Perfil Usuario
    GetPage(
      name: Routes.PERFIL,
      binding: PerfilBinding(),
      page: () => PerfilPage(),
      transition: Transition.noTransition,
    ),

    /// Datos Usuario
    GetPage(
      name: Routes.DATOS_USUARIO,
      page: () => DatosUsuarioPage(),
      binding: DatosUsuarioBinding(),
    ),

    /// Notificaciones Usuario
    GetPage(
        name: Routes.NOTIFICACIONES,
        page: () => const NotificacionesWidget(),
        transition: Transition.zoom),

    /// Chat Usuario
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),

    /// Inicio Proveedor
    GetPage(
      name: Routes.INICIO_PROVEEDOR,
      binding: InicioProveedorBinding(),
      page: () => InicioProveedorPage(),
      transition: Transition.noTransition,
    ),

    /// Mis Pistas
    GetPage(
      name: Routes.MIS_PISTAS,
      page: () => MisPistasPage(),
      binding: MisPistasBinding(),
      transition: Transition.noTransition,
    ),

    /// Anadir Pista
    GetPage(
      name: Routes.ANADIR_PISTA,
      page: () => AnadirPistaPage(),
      binding: AnadirPistaBinding(),
      transition: Transition.noTransition,
    ),

    /// Mis Socios
    GetPage(
      name: Routes.MIS_SOCIOS,
      page: () => MisSociosPage(),
      binding: MisSociosBinding(),
      transition: Transition.noTransition,
    ),

    /// Perfil Proveedor
    GetPage(
      name: Routes.PERFIL_PROVEEDOR,
      binding: PerfilProveedorBinding(),
      page: () => PerfilProveedorPage(),
      transition: Transition.noTransition,
    ),

    /// Datos Proveedor
    GetPage(
        name: Routes.DATOS_PROVEEDOR,
        binding: DatosProveedorBinding(),
        page: () => DatosProveedorPage()),

    /// Caja
    GetPage(
      name: Routes.CAJA,
      binding: BancoVirtualBinding(),
      page: () => BancoVirtualPage(),
      transition: Transition.noTransition,
    ),

    /// Notificaciones Proveedor
    GetPage(
      name: Routes.NOTIFICACIONES_PROVEEDOR,
      page: () => const NotificacionesProfesionalWidget(),
    ),

    /// Resultados Estadisticas
    GetPage(
      name: Routes.RESULTADOS_ESTADISTICAS,
      page: () => ResultadosEstadisticasPage(),
      binding: ResultadosEstadisticasBinding(),
    ),

    /// Chat Proveedor
    GetPage(
      name: Routes.CHAT_PROVEEDOR,
      page: () => ChatProveedorPage(),
      binding: ChatProveedorBinding(),
    ),

    /// Olvide Contrasena
    GetPage(
      name: Routes.OLVIDE_CONTRASENA,
      page: () => OlvideContrasenaPage(),
      binding: OlvideContrasenaBinding(),
    ),

    /// Tarifas pista
    GetPage(
      name: Routes.TARIFAS_PISTA,
      page: () => const TarifasPistaPage(),
      binding: TarifasPistaBinding(),
    ),

    /// Pago TPV
    GetPage(
      name: Routes.PAGO_TPV,
      page: () => PagoTpvPage(),
      binding: PagoTpvBinding(),
    ),
  ];
}
