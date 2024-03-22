// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/routes/database.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class DatosVersion {
  DatosVersion({required this.v, required this.info, required this.fecha});
  final String v;
  final String info;
  final String fecha;
}

class Versions extends GetView<DatabaseController> {
  final double getWidth;
  final void Function()? onPressed;
  Versions({super.key, required this.getWidth, required this.onPressed});
  final List<DatosVersion> arrayVersion2 = [
    DatosVersion(
        v: '2.1.4',
        info: '''Acceso con usuario de prueba.''',
        fecha: '13/03/2024'),
    DatosVersion(
        v: '2.1.3',
        info: '''Corrección de botones.
Tokens Autenticacion login proveedor.
Login con acceso de tokens proveedor.
Email mas largo.
Registro de proveedor ajuste en certificado.
Obtencion de los datos mediante tokens.''',
        fecha: '13/03/2024'),
    DatosVersion(
        v: '2.1.2',
        info: '''Corrección de botones.
Tokens Autenticacion login.
Login con acceso de tokens.
Email mas largo.
Registro quitar datos establecidos.
Obtencion de los datos mediante tokens.''',
        fecha: '12/03/2024'),
    DatosVersion(
        v: '2.1.1',
        info: '''Corrección de botones.
Recargar Monedero Virtual.
Ajustes en Reservar Pista, Cancelar, Reservar Todo.''',
        fecha: '22/02/2024'),
    DatosVersion(
        v: '2.1.0',
        info:
            '''Corrección de ver términos y condiciones y inicio de sesión.''',
        fecha: '21/02/2024'),
    DatosVersion(
        v: '2.0.0',
        info: '''Correcciòn de botones mal cuadrados y eliminaciòn de datos.''',
        fecha: '20/02/2024'),
  ];
  final List arrayVersion = [
    {
      "version": "1.1.14",
      "list": """
- Subir la aplicacion a play store."""
    },
    {
      "version": "1.1.13",
      "list": """
- Subir la aplicacion a app store.  """
    },
    {
      "version": "1.1.12",
      "list": """
- Ficha del trabajador social al dar click en la imagen.  
- Botones de continuar a siguiente en registro y datos.
- Poder mover la pantalla en el inicio.
- Dependencia agregado grado 1 2 3.
- Añadir personas de contacto.
- Agregar importe en monedero, modificacion de los botones y que se agregue los decimales automaticamente.
- Registro no permitir pasar si aun no se han rellenado los campos.
- Confirmacion para ir a los enlaces.
- Pantallas de login para el profesiona."""
    },
    {
      "version": "1.1.11",
      "list": """
- Ajustar botones de login.  
- Contraseña que desaparezca despues de 2 segundos.
- Ajustar derechos y la version de bajo del titulo de riolobos.
- Check en Terminos y Condiciones.
- Diferente sonido al pedir una comida suena una campana.
- Total de comida en vez del boton.
- Cambio en los estados de comida, campana amarilla. Y boton para ir al monedero con el filtro de Comida.
- Las citas de los trabajadores cambio de solicitado a ocupado, agregacion del descanso en gris, y cambio del color de la X a Rojo."""
    },
    {
      "version": "1.1.10",
      "list": """
- Pantalla de datos y ajustes.  
- Pantalla de registro.
- Ajustes en monedero y historial.
- Ajustes pantalla de login."""
    },
    {
      "version": "1.1.9",
      "list": """
- Pantalla de lavanderia.  
- Pantalla de Monedero.
- Pantalla de Perfil.
- Ajustes pantalla material ortoprotesico."""
    },
    {
      "version": "1.1.8",
      "list": """
- Sonido de los botones.  
- Pantalla de Material Ortoprotesico
- Ajustes para el movimiento de pantallas y optimizacion. 
- Pantalla principal de Login."""
    },
    {
      "version": "1.1.7",
      "list":
          "- Pantalla Comida a Domicilio creada. \n- Ajustes de botones y de texto en Login \n- Agregacion de la lista de versiones."
    },
    {
      "version": "1.1.6",
      "list": """
- Pantalla de Cita con trabajadores.
' Ajustar de las pantallas de cita de trabajadores."""
    },
    {
      "version": "1.1.5",
      "list": """
- Pasar pantallas Adobe XD a Flutter.
- Creación de pantalla Login.
- Creación de pantalla de Servicos Sociales.
- Links mover a url externas."""
    },
    {
      "version": "1.1.4",
      "list": """
- Movimiento de pantallas.
- Ajustes de diseño."""
    },
    {
      "version": "1.1.3",
      "list": """
- Cambiar diseno de login.
- Agregacion de icono de modular.
- Movimiento de pantallas."""
    },
    {
      "version": "1.1.2",
      "list": """
- Ajustar pantallas en Adobe XD.  
- Cambio de colores en pantallas de servicios sociales."""
    },
    {
      "version": "1.1.1",
      "list": """
- Diseño Adobe XD
- Ajusted del diseño."""
    },
  ];
  Widget buildContainerVersion(BuildContext context, DatosVersion data) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 5,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              data.v,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF15161E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              data.fecha,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF606A85),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            data.info,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF606A85),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildVersions(BuildContext context) {
    final List<Widget> result = [
      // Generated code for this Container Widget...
    ];
    for (var element in arrayVersion2) {
      result.add(buildContainerVersion(context, element));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Center(
                child: Text(
                  "VERSIONES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff4285d0),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontFamily: "Roboto",
                      decoration: TextDecoration.none),
                ),
              ),
              RichText(
                text: TextSpan(
                    text: "Actual: ",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "Roboto",
                        fontSize: 25,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: controller.version,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.none,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: buildVersions(context)),
            ),
          ),
          Center(
            child: SizedBox(
              width: getWidth * 0.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff4285d0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 3, color: Color(0xff4285d0)),
                        borderRadius: BorderRadius.circular(
                            20.0), // Ajusta el radio de los bordes según tus necesidades
                      ),
                    ),
                  ),
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Regresar",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(239, 255, 255, 255),
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
