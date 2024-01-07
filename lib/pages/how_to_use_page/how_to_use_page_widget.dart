import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'how_to_use_page_model.dart';
export 'how_to_use_page_model.dart';

class HowToUsePageWidget extends StatefulWidget {
  const HowToUsePageWidget({Key? key}) : super(key: key);

  @override
  _HowToUsePageWidgetState createState() => _HowToUsePageWidgetState();
}

class _HowToUsePageWidgetState extends State<HowToUsePageWidget> {
  late HowToUsePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HowToUsePageModel());

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
            'つかいかた',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    'https://res.cloudinary.com/glide/image/fetch/f_auto,w_450,h_150,c_lfill/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2FWnXYZz3BUD7R1SDpfRJG%2Fpub%2FZmwTfthHdXomI1TPIAoC.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 80.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '☁️もくまっちはその日の目的や気分にピッタリのシーシャ屋さんを見つけるアプリです',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                            ),
                      ),
                      Text(
                        '☁️全国のシーシャ好きが登録したシーシャ屋さんの情報が掲載されています',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                            ),
                      ),
                      Text(
                        'シーシャ屋さんを探す',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '①「一覧」を選択',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/d/1V3fw-HJshRfGoggKtoraxehZzQlL25hb=w361?authuser=0',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '②その日の目的や気分で検索',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/d/1C0B9nPR_NwsNdqiVzF9rrULiNZ05CYJb=w361?authuser=0',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '③ぴったりのシーシャ屋さんが見つかる',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/d/12znFA5zVi2XUJHoSEjMegg7OsLzymmst=w470?authuser=0',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
