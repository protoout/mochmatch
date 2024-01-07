import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'supporter_page_model.dart';
export 'supporter_page_model.dart';

class SupporterPageWidget extends StatefulWidget {
  const SupporterPageWidget({Key? key}) : super(key: key);

  @override
  _SupporterPageWidgetState createState() => _SupporterPageWidgetState();
}

class _SupporterPageWidgetState extends State<SupporterPageWidget> {
  late SupporterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupporterPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'もくまっちサポーター',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL('https://twitter.com/8g_shisha');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://pbs.twimg.com/profile_images/765761796896657408/-bHWK04-_400x400.jpg',
                                    width: 105.0,
                                    height: 105.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'はちグラム',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 260.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'はちグラムは、東京のややオシャレタウン、高円寺と吉祥寺と祐天寺にあるシーシャ(水タバコ)の吸える専門店です。',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL('https://twitter.com/shishawosuuinnu');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://pbs.twimg.com/profile_images/1672473298461147136/LK14MfY1_400x400.jpg',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'S(3000円アイコン指定可)',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 275.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'プレミアムサポーター',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL('https://twitter.com/chiiirotty');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://pbs.twimg.com/profile_images/1647878586416893952/0CdiwJYC_400x400.jpg',
                                  width: 75.0,
                                  height: 75.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'A(1000円アイコン指定可)',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 290.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'サポーター',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://pbs.twimg.com/profile_images/1673692042919292928/U0a0Tb8U_400x400.jpg',
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'B(500円アイコンもくまっち)',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 305.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    'サポーター',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
