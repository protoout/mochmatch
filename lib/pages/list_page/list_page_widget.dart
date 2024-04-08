import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'list_page_model.dart';
export 'list_page_model.dart';

class ListPageWidget extends StatefulWidget {
  const ListPageWidget({super.key});

  @override
  State<ListPageWidget> createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  late ListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      setState(() {});
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
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
    context.watch<FFAppState>();
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
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(1.0, 0.6),
          child: FloatingActionButton(
            onPressed: () async {
              if (_model.isShowFullList) {
                await _model.listViewController1?.animateTo(
                  0,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.ease,
                );
              } else {
                await _model.listViewController2?.animateTo(
                  0,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.ease,
                );
              }
            },
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            elevation: 8.0,
            child: Icon(
              Icons.arrow_upward,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          '一覧',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('AddPage');
                              },
                              child: Icon(
                                Icons.add_box,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 32.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('ログアウト'),
                                              content: const Text('ログアウトしますか'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: const Text('キャンセル'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: const Text('ログアウト'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.pushNamedAuth(
                                      'AuthPage', context.mounted);
                                } else {
                                  context.goNamedAuth(
                                      'ListPage', context.mounted);
                                }
                              },
                              child: Icon(
                                Icons.logout,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 32.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            hintText: '#初心者 #ワイワイ 店名',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          minLines: null,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 6.0, 0.0),
                    child: StreamBuilder<List<MochmatchDataRecord>>(
                      stream: queryMochmatchDataRecord(
                        singleRecord: true,
                      ),
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
                        List<MochmatchDataRecord>
                            iconButtonMochmatchDataRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final iconButtonMochmatchDataRecord =
                            iconButtonMochmatchDataRecordList.isNotEmpty
                                ? iconButtonMochmatchDataRecordList.first
                                : null;
                        return FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.search_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: const LatLng(0.0, 0.0));
                            _model.allShops =
                                await queryMochmatchDataRecordOnce(
                              queryBuilder: (mochmatchDataRecord) =>
                                  mochmatchDataRecord.where(
                                'location',
                                isNotEqualTo: null?.toGeoPoint(),
                              ),
                            );
                            setState(() {
                              _model.isShowFullList = false;
                            });
                            _model.filteredShops = await actions.searchShops(
                              _model.allShops!.toList(),
                              _model.textController.text,
                              currentUserLocationValue!,
                            );

                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (valueOrDefault<bool>(
                          FFAppState().disableDaradaraSearch,
                          true,
                        )) {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.addDaradara =
                                  await actions.addDaradaraSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.addDaradara!;
                              });
                              FFAppState().disableDaradaraSearch = false;

                              setState(() {});
                            },
                            text: 'ダラダラ',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.removeDaradara =
                                  await actions.removeDaradaraSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.removeDaradara!;
                              });
                              FFAppState().disableDaradaraSearch = true;

                              setState(() {});
                            },
                            text: 'ダラダラ',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().disableWaiwaiSearch) {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.addWaiwai = await actions.addWaiwaiSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text = _model.addWaiwai!;
                              });
                              setState(() {
                                FFAppState().disableWaiwaiSearch = false;
                              });

                              setState(() {});
                            },
                            text: 'ワイワイ',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.removeWaiwai =
                                  await actions.removeWaiwaiSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.removeWaiwai!;
                              });
                              FFAppState().disableWaiwaiSearch = true;

                              setState(() {});
                            },
                            text: 'ワイワイ',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().disableMattariSearch) {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.addMattari =
                                  await actions.addMattariSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.addMattari!;
                              });
                              setState(() {
                                FFAppState().disableMattariSearch = false;
                              });

                              setState(() {});
                            },
                            text: 'まったり',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.removeMattari =
                                  await actions.removeMattariSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.removeMattari!;
                              });
                              setState(() {
                                FFAppState().disableMattariSearch = true;
                              });

                              setState(() {});
                            },
                            text: 'まったり',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().disableShuchuSearch) {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.addShuchu = await actions.addShuchuSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text = _model.addShuchu!;
                              });
                              FFAppState().disableShuchuSearch = false;

                              setState(() {});
                            },
                            text: '集中',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.removeShuchu =
                                  await actions.removeShuchuSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.removeShuchu!;
                              });
                              FFAppState().disableShuchuSearch = true;

                              setState(() {});
                            },
                            text: '集中',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (FFAppState().disableShoshinshaSearch) {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.addShoshinsha =
                                  await actions.addShoshinshaSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.addShoshinsha!;
                              });
                              FFAppState().disableShoshinshaSearch = false;

                              setState(() {});
                            },
                            text: '初心者',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        } else {
                          return FFButtonWidget(
                            onPressed: () async {
                              _model.removeShoshinsha =
                                  await actions.removeShoshinshaSearch(
                                context,
                                _model.textController.text,
                              );
                              setState(() {
                                _model.textController?.text =
                                    _model.removeShoshinsha!;
                              });
                              FFAppState().disableShoshinshaSearch = true;

                              setState(() {});
                            },
                            text: '初心者',
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          );
                        }
                      },
                    ),
                  ]
                      .divide(const SizedBox(width: 3.0))
                      .addToStart(const SizedBox(width: 3.0))
                      .addToEnd(const SizedBox(width: 3.0)),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.isShowFullList) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 70.0),
                          child: FutureBuilder<List<MochmatchDataRecord>>(
                            future: queryMochmatchDataRecordOnce(
                              queryBuilder: (mochmatchDataRecord) =>
                                  mochmatchDataRecord.orderBy('location'),
                            ),
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
                              List<MochmatchDataRecord>
                                  listViewMochmatchDataRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewMochmatchDataRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewMochmatchDataRecord =
                                      listViewMochmatchDataRecordList[
                                          listViewIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            tablet: false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'DetailPage',
                                                  queryParameters: {
                                                    'name': serializeParam(
                                                      listViewMochmatchDataRecord
                                                          .name,
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
                                                    'softnessOfChair':
                                                        serializeParam(
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
                                                      listViewMochmatchDataRecord
                                                          .bgm,
                                                      ParamType.int,
                                                    ),
                                                    'brightness':
                                                        serializeParam(
                                                      listViewMochmatchDataRecord
                                                          .brightness,
                                                      ParamType.int,
                                                    ),
                                                    'twitterUrl':
                                                        serializeParam(
                                                      listViewMochmatchDataRecord
                                                          .twitterUrl,
                                                      ParamType.String,
                                                    ),
                                                    'instagramUrl':
                                                        serializeParam(
                                                      listViewMochmatchDataRecord
                                                          .instagramUrl,
                                                      ParamType.String,
                                                    ),
                                                    'isClosed': serializeParam(
                                                      listViewMochmatchDataRecord
                                                          .isClosed,
                                                      ParamType.bool,
                                                    ),
                                                    'webSiteUrl':
                                                        serializeParam(
                                                      listViewMochmatchDataRecord
                                                          .webSiteUrl,
                                                      ParamType.String,
                                                    ),
                                                    'shishaPicture':
                                                        serializeParam(
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
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -0.5, 0.0),
                                                          child: AutoSizeText(
                                                            listViewMochmatchDataRecord
                                                                .name
                                                                .maybeHandleOverflow(
                                                              maxChars: 22,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${formatNumber(
                                                                functions.calculateDistanceAsDouble(
                                                                    listViewMochmatchDataRecord
                                                                        .location,
                                                                    currentUserLocationValue!),
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              )} km',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              listViewMochmatchDataRecord
                                                                      .isClosed
                                                                  ? '閉店'
                                                                  : '  ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 15.0)),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 2.0)),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          Divider(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                controller: _model.listViewController1,
                              );
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 70.0),
                          child: Builder(
                            builder: (context) {
                              final searchResult =
                                  _model.filteredShops!.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResult.length,
                                itemBuilder: (context, searchResultIndex) {
                                  final searchResultItem =
                                      searchResult[searchResultIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
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
                                                    searchResultItem.name,
                                                    ParamType.String,
                                                  ),
                                                  'location': serializeParam(
                                                    searchResultItem.location,
                                                    ParamType.LatLng,
                                                  ),
                                                  'dayOfWeek': serializeParam(
                                                    searchResultItem.dayOfWeek,
                                                    ParamType.int,
                                                  ),
                                                  'timeframe': serializeParam(
                                                    searchResultItem.timeframe,
                                                    ParamType.int,
                                                  ),
                                                  'softnessOfChair':
                                                      serializeParam(
                                                    searchResultItem
                                                        .softnessOfChair,
                                                    ParamType.int,
                                                  ),
                                                  'friendlinessOfStaffs':
                                                      serializeParam(
                                                    searchResultItem
                                                        .friendlinessOfStaffs,
                                                    ParamType.int,
                                                  ),
                                                  'noisiness': serializeParam(
                                                    searchResultItem.noisiness,
                                                    ParamType.int,
                                                  ),
                                                  'bgm': serializeParam(
                                                    searchResultItem.bgm,
                                                    ParamType.int,
                                                  ),
                                                  'brightness': serializeParam(
                                                    searchResultItem.brightness,
                                                    ParamType.int,
                                                  ),
                                                  'twitterUrl': serializeParam(
                                                    searchResultItem.twitterUrl,
                                                    ParamType.String,
                                                  ),
                                                  'instagramUrl':
                                                      serializeParam(
                                                    searchResultItem
                                                        .instagramUrl,
                                                    ParamType.String,
                                                  ),
                                                  'isClosed': serializeParam(
                                                    searchResultItem.isClosed,
                                                    ParamType.bool,
                                                  ),
                                                  'webSiteUrl': serializeParam(
                                                    searchResultItem.webSiteUrl,
                                                    ParamType.String,
                                                  ),
                                                  'shishaPicture':
                                                      serializeParam(
                                                    searchResultItem
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -0.5, 0.0),
                                                      child: AutoSizeText(
                                                        searchResultItem.name
                                                            .maybeHandleOverflow(
                                                          maxChars: 22,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions.calculateMochmatch(
                                                            searchResultItem
                                                                .softnessOfChair,
                                                            searchResultItem
                                                                .friendlinessOfStaffs,
                                                            searchResultItem
                                                                .noisiness,
                                                            searchResultItem
                                                                .bgm,
                                                            searchResultItem
                                                                .brightness),
                                                        'default',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          '${formatNumber(
                                                            functions.calculateDistanceAsDouble(
                                                                searchResultItem
                                                                    .location,
                                                                currentUserLocationValue!),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          )} km',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          searchResultItem
                                                                  .isClosed
                                                              ? '閉店'
                                                              : '  ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                  ],
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
                                  );
                                },
                                controller: _model.listViewController2,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
