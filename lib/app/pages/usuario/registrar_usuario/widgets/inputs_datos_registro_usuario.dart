import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/widgets/text_inputters/inputter_registro.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/utils/animations/list_animations.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/format_number.dart';
import 'package:reservatu_pista/utils/loader/color_loader.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:reservatu_pista/utils/state_getx/state_mixin_demo.dart';
import '../registrar_usuario_c.dart';
import '../../../../../app/data/provider/usuario_node.dart';
import 'build_input.dart';

class InputsDatosRegistroUsuario extends GetView<RegistrarUsuarioController> {
  const InputsDatosRegistroUsuario({super.key});

  /// LLamar el controlador
  RegistrarUsuarioController get self => controller;
  // Definimos la animacion que viene directamente del controllador
  get anim => animVibrate(vsync: self);

  /// Contruir la lista de inputs
  ///

  List<Widget> buildListDatosPersonales() {
    return [
      BuildInput(
          labelText: 'Nombre',
          textEditingController: self.tc.nombre,
          anim: anim,
          maxLength: 40,
          onValidate: (val) => val!.length < 3 ? '' : null,
          inputFormatters: [SoloLetras()]),
      BuildInput(
          labelText: 'Apellidos',
          textEditingController: self.tc.apellidos,
          anim: anim,
          maxLength: 40,
          onValidate: (val) => val!.length < 3 ? '' : null,
          inputFormatters: [SoloLetras()]),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
        child: Row(
          children: [
            Expanded(
              child: BuildInput(
                labelText: 'Sexo',
                textEditingController: self.tc.sexo,
                isSelect: true,
                anim: anim,
                listSelect: const ['Hombre', 'Mujer'],
                isRequired: false,
                maxLength: 10,
                padding: const EdgeInsets.all(0),
              ),
            ),
            4.0.sw,
            Flexible(
              child: BuildInput(
                  labelText: 'DNI',
                  textEditingController: self.tc.dni,
                  anim: anim,
                  maxLength: 9,
                  isRequired: false,
                  inputFormatters: [
                    SinEspaciosInputFormatter(),
                    DNI8digitos1Letra()
                  ],
                  padding: const EdgeInsets.all(0),
                  onValidate: (val) => val!.length != 9 ? '' : null),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: BuildInput(
                labelText: '',
                textEditingController: self.tc.lada,
                isSelect: true,
                listSelect: const [
                  '🇪🇸 +34',
                  '🇵🇹 +351',
                  '🇲🇫 +33',
                  '🇲🇽 +52'
                ],
                anim: anim,
                maxLength: 8,
                padding: const EdgeInsets.all(0),
              ),
            ),
            4.0.sw,
            Flexible(
              child: BuildInput(
                  labelText: 'Telefono',
                  textEditingController: self.tc.telefono,
                  keyboardType: TextInputType.phone,
                  anim: anim,
                  maxLength: 9,
                  inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()],
                  padding: const EdgeInsets.all(0),
                  onValidate: (val) => val!.length != 9 ? '' : null),
            )
          ],
        ),
      ),
      BuildInput(
          labelText: 'Email',
          textEditingController: self.tc.email,
          anim: anim,
          maxLength: 40,
          inputFormatters: [SinEspaciosInputFormatter()],
          onValidate: (val) {
            // Utilizar una expresión regular para validar el formato de correo electrónico
            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                .hasMatch(val!)) {
              return '';
            }
            return null;
          }),
    ];
  }

  /// Construir la lista de datos de ubicacion
  List<Widget> buildListDatosDeUbicacion() {
    return [
      BuildInput(
          labelText: 'Empadronamiento',
          textEditingController: self.tc.empadronamiento,
          anim: anim,
          maxLength: 40,
          isRequired: false),
      BuildInput(
          labelText: 'Comunidad de vecinos',
          textEditingController: self.tc.comunidadVecinos,
          anim: anim,
          maxLength: 9,
          isRequired: false),
      BuildInput(
          labelText: 'Dirección',
          textEditingController: self.tc.direccion,
          anim: anim,
          isRequired: false,
          maxLength: 50),
      BuildInput(
          labelText: 'Código Postal',
          textEditingController: self.tc.codigoPostal,
          anim: anim,
          keyboardType: TextInputType.number,
          maxLength: 5,
          inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()],
          isFocusNode: true,
          isRequired: false,
          suffixIcon: self.apiCodigoPostal.obx(
              (state) => state!
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
              onLoading: SizedBox(
                  width: 20,
                  child: ColorLoader(
                    radius: 8,
                    padding: const EdgeInsets.only(right: 1),
                  )),
              onEmpty: const SizedBox.shrink()),
          onChanged: (val) => self.existeCodigoPostal(val),
          onValidate: (val) => val!.length != 5 ? '' : null),
      BuildInput(
          labelText: 'Localidad',
          textEditingController: self.tc.localidad,
          anim: anim,
          enabled: false,
          isRequired: false,
          maxLength: 50),
      BuildInput(
          labelText: 'Comunidad',
          textEditingController: self.tc.comunidad,
          anim: anim,
          enabled: false,
          isRequired: false,
          maxLength: 50),
      BuildInput(
          labelText: 'Provincia',
          textEditingController: self.tc.provincia,
          anim: anim,
          enabled: false,
          isRequired: false,
          maxLength: 50),
    ];
  }

  /// Construir la lista de datos del juego
  List<Widget> buildListDatosDeJuego() {
    return [
      BuildInput(
          labelText: 'Nick',
          textEditingController: self.tc.nick,
          anim: anim,
          maxLength: 20,
          inputFormatters: [SinEspaciosInputFormatter()],
          suffixIcon: self.apiExisteNick.obx(
              (state) => state!
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
              onLoading: SizedBox(
                  width: 20,
                  child: ColorLoader(
                    radius: 8,
                    padding: const EdgeInsets.only(right: 1),
                  )),
              onEmpty: const SizedBox.shrink()),
          onChanged: self.loadingNick,
          onValidate:
              (val) => // Utilizar una expresión regular para validar alfanumérico
                  RegExp(r'^[0-9]+$').hasMatch(val!) ? '' : null),
      BuildInput(
          labelText: 'Nivel',
          textEditingController: self.tc.nivel,
          isSelect: true,
          listSelect: List<String>.generate(
              40,
              (index) => FormatNumber.formatNumberWithTwoDecimals(
                  (0.25 + (index * 0.25)))),
          anim: anim,
          maxLength: 15,
          isRequired: false),
      BuildInput(
          labelText: 'Posición',
          textEditingController: self.tc.posicion,
          isSelect: true,
          listSelect: const ['Drive', 'Reves', 'Ambos'],
          anim: anim,
          maxLength: 50,
          isRequired: false),
      Obx(() => BuildInput(
          labelText: 'Marca de pala',
          textEditingController: self.tc.pala,
          anim: anim,
          isSelect: true,
          onChanged: (variable) {
            print('llegaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
            print('p0variable $variable');
            var marcaElegida = self.marcasPalas.firstWhere((e) {
              return e['marca'] == variable;
            }, orElse: () => {'': ''});
            print('marcaElegida $marcaElegida');
            buildModelosPalas(int.parse(marcaElegida['id'] ?? ''));
          },
          listSelect:
              self.marcasPalas.map((e) => e['marca'].toString()).toList(),
          maxLength: 50,
          isRequired: false)),
      Obx(() => BuildInput(
          labelText: 'Modelo de pala',
          textEditingController: TextEditingController(text: ''),
          anim: anim,
          maxLength: 50,
          listSelect: self.modelosPalas
              .map((e) => e['modelo'] != null ? e['modelo'].toString() : '')
              .toList(),
          isSelect: true,
          isRequired: false)),
      BuildInput(
          labelText: 'Juegos por semana',
          textEditingController: self.tc.juegoPorSemana,
          isSelect: true,
          listSelect: List.generate(10, (index) => (index + 1).toString()),
          anim: anim,
          maxLength: 2,
          isRequired: false),
    ];
  }

  /// Contruir los inputs de contrasena
  List<Widget> buildListContrasena() {
    final animContrasena = anim;
    final animContrasenaComprobar = anim;
    return [
      buildContrasena(
          anim: animContrasena,
          labelText: 'Contraseña',
          textEditingController: self.tc.contrasena,
          visibility: self.contrasenaVisibility,
          validator: self.validateTextFieldContrasena),
      buildContrasena(
          anim: animContrasenaComprobar,
          labelText: 'Comprobar Contraseña',
          textEditingController: self.tc.contrasenaComprobar,
          visibility: self.comprobarContrasenaVisibility,
          validator: self.validateTextFieldContrasenaComprobar),
    ];
  }

  Future<void> buildMarcasPalas() async {
    print('llega a buildMarcasPalas');
    UsuarioProvider provider = new UsuarioProvider();
    final response = await provider.getMarcasPalas();
    List<dynamic> data = response.body;
    self.marcasPalas.clear();
    Map<String, String> newMapa = {};
    data.forEach((element) {
      print('llega a buildMarcasPalas element ${jsonEncode(element)}');
      //self.marcasPalas.add(element);
      newMapa[element['marca']] = element['id'].toString();
      self.marcasPalas.add({
        'marca': element['marca'].toString(),
        'id': element['id'].toString()
      });
    });
    //self.marcasPalasMap.value = newMapa;
  }

  Future<void> buildModelosPalas(int id_marca) async {
    print('llega a buildModelosPalas $id_marca');
    UsuarioProvider provider = new UsuarioProvider();
    final response = await provider.getModelosPalas(id_marca);
    List<dynamic> data = response.body;
    print('responseresponse ${jsonEncode(data)}');

    self.modelosPalas.clear();
    data.forEach((element) {
      self.modelosPalas.add({
        'modelo': element['modelo'].toString(),
        'id': element['id_marca_pala'].toString()
      });
    });
    print('self.modelosPalas ${self.modelosPalas}');
  }

  /// Construir el input contrasena
  Widget buildContrasena(
      {required String labelText,
      required AnimationController anim,
      required RxBool visibility,
      required TextEditingController textEditingController,
      required String? Function(AnimationController, FocusNode) validator}) {
    buildMarcasPalas();
    return Obx(() => BuildInput(
        labelText: labelText,
        anim: anim,
        maxLength: 15,
        errorStyle: const TextStyle(fontSize: 12),
        obscureText: !visibility.value,
        textEditingController: textEditingController,
        prefixIcon: Icon(
          visibility.value ? Icons.lock_open : Icons.lock,
        ),
        prefixIconColor: LightModeTheme().primary,
        suffixIcon: InkWell(
          onTap: () => visibility.toggle(),
          child: Icon(
            visibility.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colores.usuario.primary,
            size: 22,
          ),
        ),
        validator: (val) => validator(anim, FocusNode())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSubtitle('Datos Personales'),
        ...buildListDatosPersonales(),
        buildSubtitle('Datos Ubicacion'),
        ...buildListDatosDeUbicacion(),
        buildSubtitle('Datos de Juego'),
        ...buildListDatosDeJuego(),
        buildSubtitle('Datos de contraseña'),
        ...buildListContrasena()
      ],
    );
  }

  Widget buildSubtitle(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
      child: Text(
        title,
        style: LightModeTheme().labelLarge.copyWith(color: Colors.black),
      ),
    );
  }
}
