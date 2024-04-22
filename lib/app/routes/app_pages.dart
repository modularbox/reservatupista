import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/anadir_pista_widget.dart';
import 'package:reservatu_pista/app/pages/usuario/amigos/amigos_p.dart';
import 'package:reservatu_pista/app/pages/usuario/amigos/amigos_usuario_b.dart';
import 'package:reservatu_pista/app/pages/usuario/misBonos/mis_bonos_b.dart';
import 'package:reservatu_pista/app/pages/usuario/misBonos/mis_bonos_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas_page/mis_reservas_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas_page/mis_reservas_p.dart';
import 'package:reservatu_pista/pages/profesional/perfil_profesional/perfil_profesional_widget.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_b.dart';
import 'package:reservatu_pista/pages/usuario/notificaciones/notificaciones_model.dart';
// import '../../pages/profesional/datos_profesional/datos_profesional_widget.dart';
// import '../../pages/profesional/login_profesional/login_profesional_widget.dart';
// import '../../pages/profesional/registro_profesional/registro_profesional_widget.dart';
// import '../../pages/usuario/datos/datos_widget.dart';
// import '../../pages/usuario/mis_reservas/mis_reservas_widget.dart';
// import '../../pages/usuario/perfil/perfil_widget.dart';
// import '../../pages/usuario/registro_usuario/registro_usuario_widget.dart';
// import '../../pages/usuario/reservar_pista/reservar_pista_widget.dart';
import '../../pages/usuario/datos/ldatos_b.dart';
import '../pages/profesional/anadir_pista/anadir_pista_b.dart';
import '../pages/usuario/login_usuario/login_usuario.dart';
import '../pages/usuario/login_usuario/login_usuario_b.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario_b.dart';
import '../ui/pages/pagotpv_page/pagotpv_b.dart';
import '../ui/pages/pagotpv_page/pagotpv_p.dart';
import './index.dart';
import '../pages/usuario/reservar_pista/reservar_pista.dart';
import '../pages/usuario/reservar_pista/reservar_pista_b.dart';
import '../pages/profesional/registro_proveedor/registro_proveedor.dart';
import '../pages/profesional/registro_proveedor/registro_proveedor_b.dart';
import '../pages/Profesional/mis_socios/mis_socios.dart';
import '../pages/Profesional/mis_socios/mis_socios_b.dart';
import '../pages/Profesional/datos_proveedor/datos_proveedor.dart';
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
import '../pages/usuario/datos_usuario/datos_usuario.dart';
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
  static const LOGINPROFESIONAL = '/loginProfesional';
  static const RESERVARPISTA = '/reservarPista';
  static const MIS_RESERVAS = '/mis_reservas';
  static const DATOS = '/datos';
  static const DATOSPROFESIONAL = '/datosProfesional';
  static const REGISTROUSUARIO = '/registroUsuario';
  static const REGISTROPROFESIONAL = '/registroProfesional';
  static const PERFIL_PROVEEDOR = '/perfil_proveedor';
  static const MONEDERO = '/monedero';
  static const CAJA = '/caja';
  static const ANADIR_PISTA = '/anadir_pista';
  static const TARIFAS = '/tarifas';
  static const MIS_PISTAS = '/mis_pistas';
  static const NOTIFICACIONES = '/notificaciones';
  static const NOTIFICACIONES_PROVEEDOR = '/notificaciones_proveedor';
  static const INICIOPROFESIONAL = '/inicioProfesional';
  static const INICIO = '/inicio';
  static const LOGIN_PROFESIONAL = '/login_profesional';
  static const RESERVAR_PISTA = '/reservar_pista';
  static const PAGOS_TARJETA = '/pagos_tarjeta';
  static const REGISTRO_PROVEEDOR = '/registro_proveedor';
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
  static const AMIGOS = '/amigos_usuario';
  static const MIS_BONOS = '/bonos';
}

/// Get Routes
class AppPages {
  static const INITIAL = Routes.LOGIN_USUARIO;
  static final routes = [
    GetPage(
      name: Routes.LOGIN_USUARIO,
      page: () => LoginUsuarioPage(),
      binding: LoginUsuarioBinding(),
    ),
    GetPage(
      name: Routes.REGISTRAR_USUARIO,
      page: () => RegistrarUsuarioPage(),
      binding: RegistrarUsuarioBinding(),
    ),
    GetPage(
      name: Routes.REGISTRAR_USUARIO,
      page: () => RegistrarUsuarioPage(),
      binding: RegistrarUsuarioBinding(),
    ),
    GetPage(
      name: Routes.PERFIL,
      page: () => PerfilWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PERFIL_PROVEEDOR,
      page: () => PerfilProfesionalWidget(),
      transition: Transition.noTransition,
    ),
    // GetPage(
    //   name: '/loginProfesional',
    //   page: () => LoginProfesionalWidget(),
    // ),
    GetPage(
      name: '/reservarPista',
      page: () => ReservarPistaWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.MIS_RESERVAS,
      page: () => MisReservasPage(),
      binding: MisReservasBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/datos',
      page: () => DatosWidget(),
      binding: DatosBinding(),
    ),
    GetPage(
      name: '/datosProfesional',
      page: () => DatosProfesionalWidget(),
    ),
    GetPage(
      name: '/registroProfesional',
      page: () => RegistroProfesionalWidget(),
    ),
    GetPage(
      name: Routes.MONEDERO,
      page: () => MonederoVirtualWidget(),
      binding: MonederoBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.CAJA,
      page: () => BancoVirtualWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ANADIR_PISTA,
      page: () => AnadirPistaWidget(),
      binding: AnadirPistaBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.NOTIFICACIONES,
      page: () => NotificacionesProfesionalWidget(),
    ),
    GetPage(
      name: Routes.NOTIFICACIONES_PROVEEDOR,
      page: () => NotificacionesProfesionalWidget(),
    ),
    GetPage(
      name: '/inicioProfesional',
      page: () => InicioProfesionalWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/inicio',
      page: () => InicioWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.RESERVAR_PISTA,
      page: () => ReservarPistaPage(),
      binding: ReservarPistaBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.REGISTRO_PROVEEDOR,
      page: () => RegistroProveedorPage(),
      binding: RegistroProveedorBinding(),
    ),
    GetPage(
      name: Routes.MIS_SOCIOS,
      page: () => MisSociosPage(),
      binding: MisSociosBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DATOS_PROVEEDOR,
      page: () => DatosProveedorPage(),
      binding: DatosProveedorBinding(),
    ),
    GetPage(
      name: Routes.PRUEBA_PROVEEDOR,
      page: () => PruebaProveedorPage(),
      binding: PruebaProveedorBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.RESULTADOS_ESTADISTICAS,
      page: () => ResultadosEstadisticasPage(),
      binding: ResultadosEstadisticasBinding(),
    ),
    GetPage(
      name: Routes.CHAT_PROVEEDOR,
      page: () => ChatProveedorPage(),
      binding: ChatProveedorBinding(),
    ),
    GetPage(
      name: Routes.MIS_PISTAS,
      page: () => MisPistasPage(),
      binding: MisPistasBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DATOS_USUARIO,
      page: () => DatosUsuarioPage(),
      binding: DatosUsuarioBinding(),
    ),
    GetPage(
      name: Routes.OLVIDE_CONTRASENA,
      page: () => OlvideContrasenaPage(),
      binding: OlvideContrasenaBinding(),
    ),
    GetPage(
      name: Routes.TARIFAS_PISTA,
      page: () => TarifasPistaPage(),
      binding: TarifasPistaBinding(),
    ),
    GetPage(
      name: Routes.PAGO_TPV,
      page: () => PagoTpvPage(),
      binding: PagoTpvBinding(),
    ),
    GetPage(
      name: Routes.AMIGOS,
      page: () => AmigosPage(),
      binding: AmigosBinding(),
    ),
    GetPage(
      name: Routes.MIS_BONOS,
      page: () => MisBonosPage(),
      binding: MisBonosBinding(),
    ),
  ];
}
