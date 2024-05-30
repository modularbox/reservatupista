import 'package:aligned_dialog/aligned_dialog.dart';
import '../../../../components/alert_recargar/alert_recargar_widget.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../utils/format_number.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'banco_virtual_model.dart';
export 'banco_virtual_model.dart';

class BancoVirtualWidget extends StatefulWidget {
  const BancoVirtualWidget({Key? key}) : super(key: key);

  @override
  _BancoVirtualWidgetState createState() => _BancoVirtualWidgetState();
}

class _BancoVirtualWidgetState extends State<BancoVirtualWidget>
    with TickerProviderStateMixin {
  late BancoVirtualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BancoVirtualModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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

    context.watch<FFAppState>();

    return NavbarYAppbarProfesional(
      title: 'Caja',
      page: TypePage.None,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  color: LightModeTheme().secondary,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 250.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                          color: LightModeTheme().secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 28.0,
                      decoration: BoxDecoration(
                        color: LightModeTheme().secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              '${FormatNumber.formatNumberWithTwoDecimals(FFAppState().moneyBancoVirtual).toString()} €',
                              style: LightModeTheme().headlineLarge.override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF14181B),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await showAlignedDialog(
                                context: context,
                                isGlobal: true,
                                avoidOverflow: false,
                                targetAnchor:
                                    const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                followerAnchor:
                                    const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child:
                                        AlertRecargarWidget(isTransferir: true),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: FFLocalizations.of(context).getText(
                              'yigsy672' /* Transferir */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: LightModeTheme().successGeneral,
                              textStyle: LightModeTheme().titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: LightModeTheme().primaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      setState(() {});
                      (() {
                        _model.isFiltrar = !_model.isFiltrar;
                      });
                    },
                    text: FFLocalizations.of(context).getText(
                      'ixj01blz' /* Filtrar */,
                    ),
                    icon: const Icon(
                      Icons.line_weight_rounded,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 106.0,
                      height: 30.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: LightModeTheme().successGeneral,
                      textStyle: LightModeTheme().titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: LightModeTheme().primaryText,
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Builder(builder: (context) {
                    final tipoText = (_model.type == TypeHistorial.reserva)
                        ? 'Reservas'
                        : (_model.type == TypeHistorial.tranferencia
                            ? 'Transferencias'
                            : 'Todo');
                    return Text(
                      tipoText,
                      style: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: LightModeTheme().primaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                    );
                  }),
                ],
              ),
            ),
            _model.isFiltrar
                ? Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      FFButtonWidget(
                          text: 'Reservas',
                          onPressed: () {
                            setState(() {
                              _model.type = TypeHistorial.reserva;
                            });
                          },
                          options: FFButtonOptions(
                              color: _model.type != TypeHistorial.reserva
                                  ? LightModeTheme().accent3
                                  : LightModeTheme().successGeneral,
                              borderRadius: BorderRadius.circular(30))),
                      FFButtonWidget(
                          text: 'Transferencia',
                          onPressed: () {
                            setState(() {
                              _model.type = TypeHistorial.tranferencia;
                            });
                          },
                          options: FFButtonOptions(
                              color: _model.type != TypeHistorial.tranferencia
                                  ? LightModeTheme().accent3
                                  : LightModeTheme().successGeneral,
                              borderRadius: BorderRadius.circular(30))),
                      FFButtonWidget(
                          text: 'Todo',
                          onPressed: () {
                            setState(() {
                              _model.type = TypeHistorial.all;
                            });
                          },
                          options: FFButtonOptions(
                              color: _model.type != TypeHistorial.all
                                  ? LightModeTheme().accent3
                                  : LightModeTheme().successGeneral,
                              borderRadius: BorderRadius.circular(30))),
                    ].divide(const SizedBox(width: 5.0)),
                  )
                : const SizedBox(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _model.type != TypeHistorial.reserva
                          ? buildTransferencia()
                          : const SizedBox(),
                      _model.type != TypeHistorial.tranferencia
                          ? buildReserva()
                          : const SizedBox(),
                      // buildTransferencia(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReserva() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 2.0,
            // color: Color(0xFF00BC13),
            color: const Color(0xFF00BC13),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            2.0, 0.0, 2.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/icon_monedero_virtual.png',
                            width: 38.0,
                            height: 38.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '79goxc5l' /* Reserva de pista */,
                              ),
                              style: const TextStyle(),
                            ),
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                color: LightModeTheme().primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                          style: LightModeTheme().bodyLarge.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '25j5609z' /* Lunes 3 Enero 2024 */,
                          ),
                          style: LightModeTheme().labelMedium,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'bp9a1059' /* Hora: 11:34 */,
                        ),
                        style: LightModeTheme().labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+ 1,50 €',
                    textAlign: TextAlign.end,
                    style: LightModeTheme().headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFF00BC13),
                          fontSize: 18.0,
                        ),
                  ),
                  Container(
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'trwmi9k3' /* Monedero
            Virtual */
                      ,
                    ),
                    textAlign: TextAlign.center,
                    style: LightModeTheme().bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: LightModeTheme().primary,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransferencia() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: LightModeTheme().secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            // color: Color(0xFF00BC13),
            color: const Color(0xFFE74C3C),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            2.0, 0.0, 2.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/icon_recarga.png',
                            width: 30.0,
                            height: 30.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Transferencia',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                color: LightModeTheme().primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                          style: LightModeTheme().bodyLarge.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hqviv308' /* Lunes 8 Enero 2024 */,
                          ),
                          style: LightModeTheme().labelMedium,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'lmsv2yhg' /* Hora: 11:34 */,
                        ),
                        style: LightModeTheme().labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 12.0),
                    child: Text(
                      '- 100,00 €',
                      textAlign: TextAlign.end,
                      style: LightModeTheme().headlineSmall.override(
                            fontFamily: 'Outfit',
                            color: const Color(0xFFE74C3C),
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Transferencia',
                      style: LightModeTheme().bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: LightModeTheme().primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
