// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_p.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/anadir_pista_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_p.dart';
import 'package:reservatu_pista/app/pages/usuario/reserva_compartida_page/reserva_compartida_b.dart';
import 'package:reservatu_pista/app/pages/usuario/reserva_compartida_page/reserva_compartida_p.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/eliminar_cuenta_b.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/eliminar_cuenta_p.dart';
import 'package:reservatu_pista/app/ui/pages/validar_email_page/validar_email_b.dart';
import 'package:reservatu_pista/app/ui/pages/validar_email_page/validar_email_p.dart';
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
import '../ui/pages/olvide_contrasena/olvide_contrasena_p.dart';
import '../ui/pages/olvide_contrasena/olvide_contrasena_b.dart';
import '../pages/profesional/tarifas_pista/tarifas_pista.dart';
import '../pages/profesional/tarifas_pista/tarifas_pista_b.dart';

extension ExtRoutesType on RoutesType {
  String get getRoute => '/${toString().split('.').last}';
}

// End imports
enum RoutesType {
  login_usuario,
  registrar_usuario,
  perfil,
  mis_reservas,
  datos,
  perfil_proveedor,
  monedero,
  caja,
  anadir_pista,
  tarifas,
  mis_pistas,
  notificaciones,
  notificaciones_proveedor,
  inicio_profesional,
  inicio,
  reservar_pista,
  pagos_tarjeta,
  registrar_proveedor,
  mis_socios,
  datos_proveedor,
  prueba_proveedor,
  chat,
  resultados_estadisticas,
  chat_proveedor,
  reserva_tu_pista,
  datos_usuario,
  olvide_contrasena,
  tarifas_pista,
  pago_tpv,
  pruebas,
  eliminar_cuenta,
  validar_email,
  reserva_compartida,
  administrador
}

/// Names Routes
abstract class Routes {
  static final LOGIN_USUARIO = RoutesType.login_usuario.getRoute;
  static final REGISTRAR_USUARIO = RoutesType.registrar_usuario.getRoute;
  static final PERFIL = RoutesType.perfil.getRoute;
  static final MIS_RESERVAS = RoutesType.mis_reservas.getRoute;
  static final DATOS = RoutesType.datos.getRoute;
  static final PERFIL_PROVEEDOR = RoutesType.perfil_proveedor.getRoute;
  static final MONEDERO = RoutesType.monedero.getRoute;
  static final CAJA = RoutesType.caja.getRoute;
  static final ANADIR_PISTA = RoutesType.anadir_pista.getRoute;
  static final TARIFAS = RoutesType.tarifas.getRoute;
  static final MIS_PISTAS = RoutesType.mis_pistas.getRoute;
  static final NOTIFICACIONES = RoutesType.notificaciones.getRoute;
  static final NOTIFICACIONES_PROVEEDOR =
      RoutesType.notificaciones_proveedor.getRoute;
  static final INICIO_PROVEEDOR = RoutesType.inicio_profesional.getRoute;
  static final INICIO = RoutesType.inicio.getRoute;
  static final RESERVAR_PISTA = RoutesType.reservar_pista.getRoute;
  static final PAGOS_TARJETA = RoutesType.pagos_tarjeta.getRoute;
  static final REGISTRAR_PROVEEDOR = RoutesType.registrar_proveedor.getRoute;
  static final MIS_SOCIOS = RoutesType.mis_socios.getRoute;
  static final DATOS_PROVEEDOR = RoutesType.datos_proveedor.getRoute;
  static final PRUEBA_PROVEEDOR = RoutesType.prueba_proveedor.getRoute;
  static final CHAT = RoutesType.chat.getRoute;
  static final RESULTADOS_ESTADISTICAS =
      RoutesType.resultados_estadisticas.getRoute;
  static final CHAT_PROVEEDOR = RoutesType.chat_proveedor.getRoute;
  static final RESERVA_TU_PISTA = RoutesType.reserva_tu_pista.getRoute;
  static final DATOS_USUARIO = RoutesType.datos_usuario.getRoute;
  static final OLVIDE_CONTRASENA = RoutesType.olvide_contrasena.getRoute;
  static final TARIFAS_PISTA = RoutesType.tarifas_pista.getRoute;
  static final PAGO_TPV = RoutesType.pago_tpv.getRoute;
  static final PRUEBAS = RoutesType.pruebas.getRoute;
  static final ELIMINAR_CUENTA = RoutesType.eliminar_cuenta.getRoute;
  static final VALIDAR_EMAIL = RoutesType.validar_email.getRoute;
  static final RESERVA_COMPARTIDA = RoutesType.reserva_compartida.getRoute;
  static final ADMINISTRADOR = RoutesType.administrador.getRoute;
}

/// Get Routes
class AppPages {
  static final INITIAL = Routes.LOGIN_USUARIO;
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

    /// Reserva Compartida por Usuario
    GetPage(
      name: Routes.RESERVA_COMPARTIDA,
      page: () => ReservaCompartidaPage(),
      binding: ReservaCompartidaBinding(),
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

    /// Eliminar cuenta, ya sea de usuario o proveedor
    GetPage(
      name: Routes.ELIMINAR_CUENTA,
      page: () => const EliminarCuentaPage(),
      binding: EliminarCuentaBinding(),
    ),

    /// Validar email
    GetPage(
      name: Routes.VALIDAR_EMAIL,
      page: () => ValidarEmailPage(),
      binding: ValidarEmailBinding(),
    ),

    /// Validar email
    GetPage(
      name: Routes.ADMINISTRADOR,
      page: () => const AdminPageWidget(),
    ),
  ];
}
