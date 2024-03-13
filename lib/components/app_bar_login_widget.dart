import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_login_model.dart';
export 'app_bar_login_model.dart';

class AppBarLoginWidget extends StatefulWidget {
  const AppBarLoginWidget({Key? key}) : super(key: key);

  @override
  _AppBarLoginWidgetState createState() => _AppBarLoginWidgetState();
}

class _AppBarLoginWidgetState extends State<AppBarLoginWidget> {
  late AppBarLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarLoginModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 1.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  generateTitle(),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      '.com',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 25.0,
                            color: const Color(0xFF000088),
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logo_min_size.gif',
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget generateTitle() {
    final title1 = ['R', 'eserva', 't', 'u', 'p', 'ista'];
    final generateTitle1 = List.generate(
      title1.length,
      (index) => index == 0
          ? TextSpan(
              text: title1[index],
              style: const TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
              ),
            )
          : index % 2 != 0
              ? TextSpan(
                  text: title1[index],
                )
              : TextSpan(
                  text: title1[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
    );
    return RichText(
        text: TextSpan(
          children: generateTitle1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: const Color(0xFF000088),
                fontSize: 25.0,
              ),
        ),
        textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor));
  }
}
