import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_page_model.dart';
export 'list_page_model.dart';

class ListPageWidget extends StatefulWidget {
  const ListPageWidget({Key? key}) : super(key: key);

  @override
  _ListPageWidgetState createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  late ListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPageModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      '一覧',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_Qmq93GFGfBbaSVayxB3PJcDzIV28GyYKAPaGC48OaXbyNkenl2CfVqPk7nMNqrO9ZUU&usqp=CAU',
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'ダラダラ、ワイワイ、まったり、集中、初心者',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<MochmatchDataRecord>>(
                  stream: queryMochmatchDataRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<MochmatchDataRecord> listViewMochmatchDataRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMochmatchDataRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewMochmatchDataRecord =
                            listViewMochmatchDataRecordList[listViewIndex];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'DetailPage',
                                        queryParameters: {
                                          'name': serializeParam(
                                            listViewMochmatchDataRecord.name,
                                            ParamType.String,
                                          ),
                                          'location': serializeParam(
                                            listViewMochmatchDataRecord
                                                .location,
                                            ParamType.LatLng,
                                          ),
                                          'dayOfWeek': serializeParam(
                                            listViewMochmatchDataRecord
                                                .dayOfWeek,
                                            ParamType.int,
                                          ),
                                          'timeframe': serializeParam(
                                            listViewMochmatchDataRecord
                                                .timeframe,
                                            ParamType.int,
                                          ),
                                          'softnessOfChair': serializeParam(
                                            listViewMochmatchDataRecord
                                                .softnessOfChair,
                                            ParamType.int,
                                          ),
                                          'friendlinessOfStaffs':
                                              serializeParam(
                                            listViewMochmatchDataRecord
                                                .friendlinessOfStaffs,
                                            ParamType.int,
                                          ),
                                          'noisiness': serializeParam(
                                            listViewMochmatchDataRecord
                                                .noisiness,
                                            ParamType.int,
                                          ),
                                          'bgm': serializeParam(
                                            listViewMochmatchDataRecord.bgm,
                                            ParamType.int,
                                          ),
                                          'brightness': serializeParam(
                                            listViewMochmatchDataRecord
                                                .brightness,
                                            ParamType.int,
                                          ),
                                          'twitterUrl': serializeParam(
                                            listViewMochmatchDataRecord
                                                .twitterUrl,
                                            ParamType.String,
                                          ),
                                          'instagramUrl': serializeParam(
                                            listViewMochmatchDataRecord
                                                .instagramUrl,
                                            ParamType.String,
                                          ),
                                          'isClosed': serializeParam(
                                            listViewMochmatchDataRecord
                                                .isClosed,
                                            ParamType.bool,
                                          ),
                                          'webSiteUrl': serializeParam(
                                            listViewMochmatchDataRecord
                                                .webSiteUrl,
                                            ParamType.String,
                                          ),
                                          'shishaPicture': serializeParam(
                                            listViewMochmatchDataRecord
                                                .shishaPicture,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.5, 0.0),
                                              child: AutoSizeText(
                                                listViewMochmatchDataRecord.name
                                                    .maybeHandleOverflow(
                                                  maxChars: 30,
                                                  replacement: '…',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.calculateMochmatch(
                                                    listViewMochmatchDataRecord
                                                        .softnessOfChair,
                                                    listViewMochmatchDataRecord
                                                        .friendlinessOfStaffs,
                                                    listViewMochmatchDataRecord
                                                        .noisiness,
                                                    listViewMochmatchDataRecord
                                                        .bgm,
                                                    listViewMochmatchDataRecord
                                                        .brightness),
                                                'default',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              functions.calculateDistance(
                                                  listViewMochmatchDataRecord
                                                      .location!,
                                                  currentUserLocationValue!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  listViewMochmatchDataRecord
                                                      .shishaPicture,
                                                  'https://media.discordapp.net/attachments/1177153383119994942/1188715756750381097/7294e0c6a45f6d6b.png?ex=659b88d1&is=658913d1&hm=a9b7e467351720378e5d4658a1f9aa4f4eec517d6a0fbace5b1a441ea542217a&=&format=webp&quality=lossless&width=625&height=625',
                                                ),
                                                width: 65.0,
                                                height: 65.0,
                                                fit: BoxFit.contain,
                                                alignment: Alignment(1.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
