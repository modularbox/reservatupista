import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/widgets/build_usuarios.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_theme.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_util.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'pruebas_c.dart';

class PruebasPage extends GetView<PruebasController> {
  final ScrollController _scrollController = ScrollController();

  void _handlePointerSignal(PointerSignalEvent event) {
    print("dskjnksd");
    if (event is PointerScrollEvent) {
      print(event.scrollDelta);

      // Detecta la dirección del desplazamiento
      if (event.scrollDelta.dy > 0) {
        print('Scrolling down');
      } else if (event.scrollDelta.dy < 0) {
        print('Scrolling up');
      }
    }
    print("handle");
  }

  @override
  Widget build(BuildContext context) {
    return MainApp2();
    return Scaffold(
      appBar: AppBar(
        title: Text('PruebasPage'),
      ),
      body: SafeArea(
        child: Listener(
          onPointerSignal: _handlePointerSignal,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: List.generate(
                10,
                (index) => ListTile(
                  title: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isLightTheme = true;

  Widget buildTitle(BuildContext context) {
    // double fontSize = MediaQuery.sizeOf(context).width < 400.0 ? 20.0 : 30.0;
    // fontSize = MediaQuery.sizeOf(context).width < 300.0 ? 10.0 : fontSize;

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        'Detalles Reserva',
        style: LightModeTheme()
            .displaySmall
            .copyWith(fontSize: getFontSize(context)),
      ),
    );
  }

  double getFontSize(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    if (MediaQuery.sizeOf(context).width < 300.0) {
      return 10.0;
    }
    if (MediaQuery.sizeOf(context).width < 400.0) {
      return 20.0;
    }
    return 30.0;
  }

  Widget buildListaDetalles() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 15.0),
        //   child: Text(
        //     'Detalles Reserva',
        //     textAlign: TextAlign.center,
        //     style: LightModeTheme().bodyLarge.copyWith(fontSize: 30),
        //   ),
        // ),
        BuildUsuarios(
          capacidad: 4,
          reservasUsuarios: ReservasUsuarios(
              message: 'Bien',
              plazasReservadasTotales: 2,
              usuarios: [
                ReservaUsuario(
                    idUsuario: 1,
                    imagen: 'djfn',
                    nick: 'dskjnk',
                    plazasReservadas: 2,
                    nivel: '1.0',
                    precio: 40)
              ]),
          divide: 20.0,
        ),
        20.0.sh,
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Column(
                children: [
                  buildDetalles(),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCancelarReserva(),
            20.0.sw,
            buildWhatsappButton(3).visible((true)),
          ],
        ),
        20.0.sh,
      ],
    );
  }

//ayuntamiento
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
//ayuntamiento
  // @override
  // Widget build(BuildContext context) {
  //   SliverWoltModalSheetPage page1(
  //       BuildContext modalSheetContext, TextTheme textTheme) {
  //     return WoltModalSheetPage(
  //         hasSabGradient: true,
  //         stickyActionBar: Padding(
  //           padding: const EdgeInsets.all(_pagePadding),
  //           child: Column(
  //             children: [
  //               ElevatedButton(
  //                 onPressed: Navigator.of(modalSheetContext).pop,
  //                 child: const SizedBox(
  //                   height: _buttonHeight,
  //                   width: double.infinity,
  //                   child: Center(child: Text('Cancel')),
  //                 ),
  //               ),
  //               const SizedBox(height: 8),
  //               ElevatedButton(
  //                 onPressed: () => {},
  //                 // WoltModalSheet.of(modalSheetContext).showNext,
  //                 child: const SizedBox(
  //                   height: _buttonHeight,
  //                   width: double.infinity,
  //                   child: Center(child: Text('Next page')),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         topBarTitle: buildTitle(modalSheetContext),
  //         isTopBarLayerAlwaysVisible: true,
  //         trailingNavBarWidget: Padding(
  //           padding: const EdgeInsets.only(right: 15),
  //           child: BtnIcon(
  //             borderColor: Colors.black87,
  //             borderRadius: 10,
  //             borderWidth: 2,
  //             fillColor: const Color(0xFFF77066),
  //             hoverColor: const Color.fromARGB(62, 0, 0, 0),
  //             buttonSize: 40,
  //             padding: const EdgeInsets.all(0),
  //             icon: const Icon(
  //               Icons.close_rounded,
  //               color: Colors.black87,
  //               size: 30,
  //             ),
  //             onPressed: Navigator.of(modalSheetContext).pop,
  //           ),
  //         ),
  //         child: buildDetalles());
  //   }

  //   SliverWoltModalSheetPage page2(
  //       BuildContext modalSheetContext, TextTheme textTheme) {
  //     return SliverWoltModalSheetPage(
  //       mainContentSlivers: [],
  //       pageTitle: Padding(
  //         padding: const EdgeInsets.all(_pagePadding),
  //         child: Text(
  //           'Material Colors',
  //           style:
  //               textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       heroImage: Image(
  //         image: NetworkImage(
  //           'https://raw.githubusercontent.com/woltapp/wolt_modal_sheet/main/example/lib/assets/images/material_colors_hero${_isLightTheme ? '_light' : '_dark'}.png',
  //         ),
  //         fit: BoxFit.cover,
  //       ),
  //       leadingNavBarWidget: IconButton(
  //         padding: const EdgeInsets.all(_pagePadding),
  //         icon: const Icon(Icons.arrow_back_rounded),
  //         onPressed: WoltModalSheet.of(modalSheetContext).showPrevious,
  //       ),
  //       trailingNavBarWidget: IconButton(
  //         padding: const EdgeInsets.all(_pagePadding),
  //         icon: const Icon(Icons.close),
  //         onPressed: Navigator.of(modalSheetContext).pop,
  //       ),
  //       mainContentSliversBuilder: (context) => [
  //         SliverGrid(
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 10.0,
  //             crossAxisSpacing: 10.0,
  //             childAspectRatio: 2.0,
  //           ),
  //           delegate: SliverChildBuilderDelegate(
  //             (_, index) => ColorTile(color: materialColorsInGrid[index]),
  //             childCount: materialColorsInGrid.length,
  //           ),
  //         ),
  //         SliverList(
  //           delegate: SliverChildBuilderDelegate(
  //             (_, index) => ColorTile(color: materialColorsInSliverList[index]),
  //             childCount: materialColorsInSliverList.length,
  //           ),
  //         ),
  //       ],
  //     );
  //   }

  //   return MaterialApp(
  //     themeMode: _isLightTheme ? ThemeMode.light : ThemeMode.dark,
  //     theme: ThemeData.light(useMaterial3: true).copyWith(
  //       extensions: const <ThemeExtension>[
  //         WoltModalSheetThemeData(
  //           heroImageHeight: _heroImageHeight,
  //           topBarShadowColor: _lightThemeShadowColor,
  //           modalBarrierColor: Colors.black54,
  //           mainContentScrollPhysics: ClampingScrollPhysics(),
  //         ),
  //       ],
  //     ),
  //     darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
  //       extensions: const <ThemeExtension>[
  //         WoltModalSheetThemeData(
  //           topBarShadowColor: _darkThemeShadowColor,
  //           modalBarrierColor: Colors.white12,
  //           sabGradientColor: _darkSabGradientColor,
  //           dialogShape: BeveledRectangleBorder(),
  //           bottomSheetShape: BeveledRectangleBorder(),
  //           mainContentScrollPhysics: ClampingScrollPhysics(),
  //         ),
  //       ],
  //     ),
  //     home: Scaffold(
  //       body: Builder(
  //         builder: (context) {
  //           return Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               // Row(
  //               //   mainAxisAlignment: MainAxisAlignment.center,
  //               //   children: [
  //               //     const Text('Light Theme'),
  //               //     Padding(
  //               //       padding: const EdgeInsets.all(_pagePadding),
  //               //       child: Switch(
  //               //         value: !_isLightTheme,
  //               //         onChanged: (_) =>
  //               //             setState(() => _isLightTheme = !_isLightTheme),
  //               //       ),
  //               //     ),
  //               //     const Text('Dark Theme'),
  //               //   ],
  //               // ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   WoltModalSheet.show<void>(
  //                     context: context,
  //                     pageListBuilder: (modalSheetContext) {
  //                       final textTheme = Theme.of(context).textTheme;
  //                       return [
  //                         page1(modalSheetContext, textTheme),
  //                         // page2(modalSheetContext, textTheme),
  //                       ];
  //                     },
  //                     modalTypeBuilder: (context) {
  //                       final size = MediaQuery.sizeOf(context).width;
  //                       if (size < 600) {
  //                         return WoltModalType.bottomSheet;
  //                       } else {
  //                         return WoltModalType.dialog;
  //                       }
  //                     },
  //                     onModalDismissedWithBarrierTap: () {
  //                       debugPrint('Closed modal sheet with barrier tap');
  //                       Navigator.of(context).pop();
  //                     },
  //                     maxDialogWidth: 560,
  //                     minDialogWidth: 400,
  //                     minPageHeight: 0.0,
  //                     maxPageHeight: 0.9,
  //                   );
  //                 },
  //                 child: const SizedBox(
  //                   height: _buttonHeight,
  //                   width: _buttonWidth,
  //                   child: Center(child: Text('Show Modal Sheet')),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  DateTime construirDatetime(DateTime fecha, String horaInicio) {
    final hora = int.parse(horaInicio.substring(0, 2));
    final minutos = int.parse(horaInicio.substring(3, 5));
    DateTime fechaConHora = DateTime(
      fecha.year,
      fecha.month,
      fecha.day,
      hora, // Hora
      minutos, // Minuto
      0, // Segundo
    );
    print('fechaConHora $fechaConHora');
    return fechaConHora;
  }

  Widget buildCancelarReserva() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: null,
          icon: Text(
            'Cancelar Reserva',
            style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
          ),
          fillColor: LightModeTheme().error,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Future<void> compartirReservaWhatsapp(int id_reserva) async {
    String message = "https://app.reservatupista.com?id_reserva=$id_reserva";
    String phoneNumber =
        "34653483483"; // Número de teléfono al que se enviará el mensaje

    var whatsappUrl =
        "https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";
    // if (!await launchUrl(
    //   Uri.parse(whatsappUrl),
    //   mode: LaunchMode.externalApplication,
    // )) {
    //   throw Exception('Could not launch $whatsappUrl');
    // }
  }

  Widget buildWhatsappButton(int id_reserva) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BtnIcon(
          onPressed: () async {
            await compartirReservaWhatsapp(id_reserva);
          },
          icon: Row(children: [
            Text(
              'Compartir',
              style: LightModeTheme().bodyMedium.copyWith(fontSize: 18),
            ),
            5.0.sw,
            Image.asset(
              "assets/images/icon_whatsapp.png",
              width: 20,
              height: 20,
            )
          ]),
          fillColor: LightModeTheme().successGeneral,
          padding: const EdgeInsets.all(10.0),
          hoverColor: Colores.usuario.primary69,
          borderColor: Colores.sucessGeneral,
          borderWidth: 1,
          borderRadius: 8.0,
        ),
      ],
    );
  }

  Widget buildDetalles() {
    final List<List<String>> detalles = [
      ['Nº Reserva', '# state.referencia'],
      ['Nivel', 'Libre'],
      ['Total precio', 'state.dineroPagado.euro'],
      ['Localidad', 'state.localidad'],
      ['Ayuntamiento', 'state.nombrePatrocinador'],
      ['Deporte', 'deporte'],
      ['Nº de Pista', 'numPista'],
      ['Luz', 'Si'],
      ['Iluminación', 'iluminacion'],
      ['Automatizada', 'Si'],
      ['Pista', 'pista'],
      ['Comienza', 'horaInicio'],
      ['Finaliza', 'horaFin'],
      ['Duración', '30Minutos'],
      ['Para cancelar con antelacion', '24 horas'],
    ];
    List<Widget> titles = [];
    List<Widget> descripcion = [];

    /// Terminar de agregar tiempo de cancelacion
    for (final element in detalles) {
      titles.add(
        Text(
          '${element[0]}:',
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontWeight: FontWeight.w800,
              ),
        ),
      );
      titles.add(10.0.sh);
      descripcion.add(
        Text(
          element[1],
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
      );
      descripcion.add(10.0.sh);
    }

    /// Agregar tiempo de cancelacion
    titles.add(
      Container(
        color: Colors.red,
        width: 300,
        child: Text(
          'Tiempo cancelación:',
          textAlign: TextAlign.start,
          style: LightModeTheme().bodyMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
    titles.add(10.0.sh);
    descripcion.add(
      // Obx(buildTextHorario),
      buildTextHorario(),
    );
    descripcion.add(10.0.sh);
    // detalles
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: titles),
          ),
          Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descripcion)
        ]);
  }

  Widget buildTextHorario() {
    final days = 10;
    final hour = 4;
    // int nuevoTiempoRestante = self.tiempo_restante - (hour * 1000 * 60 * 60);
    // //tiempoRestante = tiempoRestante - (hour * 1000 * 60 * 60);
    final minute = 25;
    // nuevoTiempoRestante = nuevoTiempoRestante - (minute * 1000 * 60);
    final second = 04;
    // print('tiempoRestante $self.tiempo_restante');
    // print('hour $hour');
    // print('minute $minute');
    // print('second $second');
    return Text(
      'Quedan $days Días, $hour horas, $minute minutos, $second segundos',
      style: LightModeTheme().displayMedium.override(
            fontFamily: 'Outfit',
            color: LightModeTheme().accent1,
            fontSize: 12,
            letterSpacing: 0,
          ),
    );
  }
}

const double _bottomPaddingForButton = 150.0;
const double _buttonHeight = 56.0;
const double _buttonWidth = 200.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;
const double _heroImageHeight = 250.0;
const Color _lightThemeShadowColor = Color(0xFFE4E4E4);
const Color _darkThemeShadowColor = Color(0xFF121212);
const Color _darkSabGradientColor = Color(0xFF313236);
final materialColorsInGrid = allMaterialColors.take(20).toList();
final materialColorsInSliverList = allMaterialColors.sublist(20, 25);
final materialColorsInSpinner = allMaterialColors.sublist(30, 50);

class MainApp2 extends StatefulWidget {
  const MainApp2({super.key});

  @override
  State<MainApp2> createState() => _MainAppState2();
}

class _MainAppState2 extends State<MainApp2> {
  bool _isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);

    SliverWoltModalSheetPage page1(
        BuildContext modalSheetContext, TextTheme textTheme) {
      return WoltModalSheetPage(
        hasSabGradient: false,
        stickyActionBar: Padding(
          padding: const EdgeInsets.all(_pagePadding),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(modalSheetContext).pop(),
                child: const SizedBox(
                  height: _buttonHeight,
                  width: double.infinity,
                  child: Center(child: Text('Cancel')),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () =>
                    pageIndexNotifier.value = pageIndexNotifier.value + 1,
                child: const SizedBox(
                  height: _buttonHeight,
                  width: double.infinity,
                  child: Center(child: Text('Next page')),
                ),
              ),
            ],
          ),
        ),
        topBarTitle: buildTitle(context),
        isTopBarLayerAlwaysVisible: false,
        trailingNavBarWidget: buildCerrar(modalSheetContext),
        child: const Padding(
            padding: EdgeInsets.fromLTRB(
              _pagePadding,
              _pagePadding,
              _pagePadding,
              _bottomPaddingForButton,
            ),
            child: Text(
              '''
Pagination involves a sequence of screens the user navigates sequentially. We chose a lateral motion for these transitions. When proceeding forward, the next screen emerges from the right; moving backward, the screen reverts to its original position. We felt that sliding the next screen entirely from the right could be overly distracting. As a result, we decided to move and fade in the next page using 30% of the modal side.
''',
            )),
      );
    }

    SliverWoltModalSheetPage page2(
        BuildContext modalSheetContext, TextTheme textTheme) {
      return SliverWoltModalSheetPage(
        pageTitle: Padding(
          padding: const EdgeInsets.all(_pagePadding),
          child: Text(
            'Material Colors',
            style:
                textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        heroImage: Image(
          image: NetworkImage(
            'https://raw.githubusercontent.com/woltapp/wolt_modal_sheet/main/example/lib/assets/images/material_colors_hero${_isLightTheme ? '_light' : '_dark'}.png',
          ),
          fit: BoxFit.cover,
        ),
        leadingNavBarWidget: IconButton(
          padding: const EdgeInsets.all(_pagePadding),
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () =>
              pageIndexNotifier.value = pageIndexNotifier.value - 1,
        ),
        trailingNavBarWidget: IconButton(
          padding: const EdgeInsets.all(_pagePadding),
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(modalSheetContext).pop();
            pageIndexNotifier.value = 0;
          },
        ),
        mainContentSlivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) => ColorTile(color: materialColorsInGrid[index]),
              childCount: materialColorsInGrid.length,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ColorTile(color: materialColorsInSliverList[index]),
              childCount: materialColorsInSliverList.length,
            ),
          ),
          // ...materialColorsInSpinner
          //     .map((e) => Shifter(child: ColorTile(color: e)))
          //     .toList(),
          SliverPadding(
            padding: const EdgeInsets.all(_pagePadding),
            sliver: SliverToBoxAdapter(
              child: TextButton(
                onPressed: Navigator.of(modalSheetContext).pop,
                child: const Text('Close'),
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      themeMode: _isLightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        extensions: const <ThemeExtension>[
          WoltModalSheetThemeData(
            heroImageHeight: _heroImageHeight,
            topBarShadowColor: _lightThemeShadowColor,
            modalBarrierColor: Colors.black54,
            mainContentScrollPhysics: ClampingScrollPhysics(),
          ),
        ],
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        extensions: const <ThemeExtension>[
          WoltModalSheetThemeData(
            topBarShadowColor: _darkThemeShadowColor,
            modalBarrierColor: Colors.white12,
            sabGradientColor: _darkSabGradientColor,
            dialogShape: BeveledRectangleBorder(),
            bottomSheetShape: BeveledRectangleBorder(),
            mainContentScrollPhysics: ClampingScrollPhysics(),
          ),
        ],
      ),
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Light Theme'),
                    Padding(
                      padding: const EdgeInsets.all(_pagePadding),
                      child: Switch(
                        value: !_isLightTheme,
                        onChanged: (_) =>
                            setState(() => _isLightTheme = !_isLightTheme),
                      ),
                    ),
                    const Text('Dark Theme'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    WoltModalSheet.show<void>(
                      pageIndexNotifier: pageIndexNotifier,
                      context: context,
                      pageListBuilder: (modalSheetContext) {
                        final textTheme = Theme.of(context).textTheme;
                        return [
                          page1(modalSheetContext, textTheme),
                          page2(modalSheetContext, textTheme),
                        ];
                      },
                      modalTypeBuilder: (context) {
                        final size = MediaQuery.of(context).size.width;
                        // if (size < _pageBreakpoint) {
                        //   return WoltModalType.bottomSheet;
                        // } else {
                        return WoltModalType.dialog;
                        // }
                      },
                      onModalDismissedWithBarrierTap: () {
                        debugPrint('Closed modal sheet with barrier tap');
                        Navigator.of(context).pop();
                        pageIndexNotifier.value = 0;
                      },
                      barrierDismissible: false,
                      maxDialogWidth: 560,
                      minDialogWidth: 200,
                      minPageHeight: 0.0,
                      maxPageHeight: 0.9,
                    );
                  },
                  child: const SizedBox(
                    height: _buttonHeight,
                    width: _buttonWidth,
                    child: Center(child: Text('Show Modal Sheet')),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        'Detalles Reserva',
        style: LightModeTheme().displaySmall,
      ),
    );
  }

  Widget buildCerrar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: BtnIcon(
        borderColor: Colors.black87,
        borderRadius: 10,
        borderWidth: 2,
        fillColor: const Color(0xFFF77066),
        hoverColor: const Color.fromARGB(62, 0, 0, 0),
        buttonSize: 40,
        padding: const EdgeInsets.all(0),
        icon: const Icon(
          Icons.close_rounded,
          color: Colors.black87,
          size: 30,
        ),
        onPressed: Navigator.of(context).pop,
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final Color color;

  const ColorTile({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 600,
      child: Center(
        child: Text(
          color.toString(),
          style: TextStyle(
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

List<Color> get allMaterialColors {
  List<Color> allMaterialColorsWithShades = [];

  for (MaterialColor color in Colors.primaries) {
    allMaterialColorsWithShades.add(color.shade100);
    allMaterialColorsWithShades.add(color.shade200);
    allMaterialColorsWithShades.add(color.shade300);
    allMaterialColorsWithShades.add(color.shade400);
    allMaterialColorsWithShades.add(color.shade500);
    allMaterialColorsWithShades.add(color.shade600);
    allMaterialColorsWithShades.add(color.shade700);
    allMaterialColorsWithShades.add(color.shade800);
    allMaterialColorsWithShades.add(color.shade900);
  }
  return allMaterialColorsWithShades;
}
