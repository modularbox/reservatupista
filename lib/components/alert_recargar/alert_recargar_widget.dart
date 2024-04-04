import 'package:get/get.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_c.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '../../utils/format_number.dart';
import '../../flutter_flow/flutter_flow_animations.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../utils/sizer.dart';
import 'alert_recargar_model.dart';

class AlertRecargarWidget extends StatefulWidget {
  AlertRecargarWidget({Key? key, this.isTransferir = false}) : super(key: key);
  bool isTransferir;

  @override
  _AlertRecargarWidgetState createState() => _AlertRecargarWidgetState();
}

class _AlertRecargarWidgetState extends State<AlertRecargarWidget>
    with TickerProviderStateMixin {
  late AlertRecargarModel _model;
  late String title;
  MonederoController self = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool hasImageTriggered = false;
  bool anim5 = false;
  bool anim50 = false;
  bool anim10 = false;
  bool anim100 = false;
  bool anim20 = false;
  bool anim200 = false;
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 180.ms,
          begin: const Offset(-10, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'anim5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'anim50': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'anim10': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'anim100': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'anim20': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'anim200': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertRecargarModel());

    title = widget.isTransferir ? 'Transferir' : 'Recargar';
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

    return GestureDetector(
      onTap: () => {},
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 503,
                      decoration: BoxDecoration(
                        color: LightModeTheme().secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x320E151B),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100.w - 45,
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    title,
                                    style: LightModeTheme().displaySmall,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.9, 0),
                                  child: BtnIcon(
                                    borderColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: 12,
                                    borderWidth: 3,
                                    fillColor: const Color(0xFFF77066),
                                    buttonSize: 45,
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      self.clickButton.playButton();
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildBtnBillete(5),
                                  buildBtnBillete(50),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildBtnBillete(10),
                                  buildBtnBillete(100),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildBtnBillete(20),
                                  buildBtnBillete(200),
                                ],
                              ),
                            ].divide(const SizedBox(height: 5)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: Column(
                              children: [
                                Text(
                                  '${FormatNumber.formatNumberWithTwoDecimals(_model.money)} €',
                                  style: LightModeTheme().displaySmall,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  self.clickButton.playButton();
                                  setState(() => _model.money = 0.0);
                                },
                                text: 'Borrar',
                                options: FFButtonOptions(
                                  width: 140,
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: LightModeTheme().error,
                                  textStyle:
                                      LightModeTheme().titleSmall.override(
                                            fontFamily: 'Readex Pro',
                                            color: LightModeTheme().primaryText,
                                          ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  self.clickButton.playButton();
                                  if (_model.money > 0) {
                                    self.moneyMonederoVirtual.value +=
                                        _model.money;
                                  }
                                  Get.back();
                                },
                                text: 'Confirmar',
                                options: FFButtonOptions(
                                  width: 140,
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                  color: LightModeTheme().successGeneral,
                                  textStyle:
                                      LightModeTheme().titleSmall.override(
                                            fontFamily: 'Readex Pro',
                                            color: LightModeTheme().primaryText,
                                          ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBtnBillete(int number) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onTap(number),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.asset(
          'assets/images/${number.toString()}.jpg',
          width: MediaQuery.sizeOf(context).width * 0.4,
          fit: BoxFit.cover,
        ),
      ),
    ).animateOnActionTrigger(animationsMap['anim${number.toString()}']!,
        hasBeenTriggered: getAnim(number));
  }

  bool getAnim(int number) {
    switch (number) {
      case 5:
        return anim5;
      case 10:
        return anim10;
      case 20:
        return anim20;
      case 50:
        return anim50;
      case 100:
        return anim100;
      case 200:
        return anim200;
      default:
        return false;
    }
  }

  void onTap(int number) async {
    self.clickButton.playBell();
    if (animationsMap['anim${number.toString()}'] != null) {
      double newNumber = _model.money += number;
      if (widget.isTransferir) {
        if (newNumber > self.moneyMonederoVirtual.value) {
          newNumber = self.moneyMonederoVirtual.value;
        } else {}
      } else {
        if (newNumber < 1000.0) {
        } else {
          newNumber = 1000.0;
        }
      }
      setState(() {
        switch (number) {
          case 5:
            anim5 = true;
            break;
          case 10:
            anim10 = true;
            break;
          case 20:
            anim20 = true;
            break;
          case 50:
            anim50 = true;
            break;
          case 100:
            anim100 = true;
            break;
          case 200:
            anim200 = true;
            break;
          default:
            break;
        }
        _model.money = newNumber;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) async =>
          await animationsMap['anim${number.toString()}']!
              .controller
              .forward(from: 0.0));
    }
  }
}
