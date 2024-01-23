import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_page_model.dart';
export 'add_page_model.dart';

class AddPageWidget extends StatefulWidget {
  const AddPageWidget({Key? key}) : super(key: key);

  @override
  _AddPageWidgetState createState() => _AddPageWidgetState();
}

class _AddPageWidgetState extends State<AddPageWidget> {
  late AddPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPageModel());

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
            '今日のシーシャ屋さん体験を入力',
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
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '①店名',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: '店名を入力',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
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
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: 400.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '②場所',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey: '',
                            androidGoogleMapsApiKey: '',
                            webGoogleMapsApiKey: '',
                            onSelect: (place) async {
                              setState(() => _model.placePickerValue = place);
                            },
                            defaultText: '位置情報を選択',
                            icon: Icon(
                              Icons.place,
                              color: FlutterFlowTheme.of(context).info,
                              size: 16.0,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200.0,
                              height: 40.0,
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '③今日のシーシャ',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: '画像をアップロード',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 399.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '④曜日',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: ['月〜金', '土日祝'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController1 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 160.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⑤時間帯',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: [
                            '5:00〜15:00',
                            '15:00〜18:00',
                            '18:00〜22:00',
                            '22:00〜5:00'
                          ].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController2 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 160.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⑥椅子の座り心地',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: ['ソファと一体化', 'フカフカ', '固い', 'お尻が痛い'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController3 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⑦店員さん(注文時以外)',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: ['話しかけられた', '話しかけられなかった'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController4 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⑧話し声',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: ['話し声が多い', '話し声が少ない'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController5 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⑨BGM',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: ['元気系の曲', 'ゆったり系の曲', 'なし'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController6 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⑩明るさ',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FlutterFlowRadioButton(
                          options: ['明るい', '程よい暗さ', '暗い'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController7 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await MochmatchDataRecord.collection.doc().set({
                      ...createMochmatchDataRecordData(
                        name: _model.textController.text,
                        dayOfWeek: _model.radioButtonValue1 == '月〜金' ? 1 : 2,
                        timeframe: () {
                          if (_model.radioButtonValue2 == '5:00〜15:00') {
                            return 1;
                          } else if (_model.radioButtonValue2 ==
                              '15:00〜18:00') {
                            return 2;
                          } else if (_model.radioButtonValue2 ==
                              '18:00〜22:00') {
                            return 3;
                          } else {
                            return 4;
                          }
                        }(),
                        softnessOfChair: () {
                          if (_model.radioButtonValue3 == 'ソファと一体化') {
                            return 4;
                          } else if (_model.radioButtonValue3 == 'フカフカ') {
                            return 3;
                          } else if (_model.radioButtonValue3 == '固い') {
                            return 2;
                          } else {
                            return 1;
                          }
                        }(),
                        friendlinessOfStaffs:
                            _model.radioButtonValue4 == '話しかけられた' ? 4 : 1,
                        noisiness: _model.radioButtonValue5 == '話し声が多い' ? 2 : 1,
                        bgm: () {
                          if (_model.radioButtonValue6 == '元気系の曲') {
                            return 3;
                          } else if (_model.radioButtonValue6 == 'ゆったり系の曲') {
                            return 2;
                          } else {
                            return 1;
                          }
                        }(),
                        brightness: () {
                          if (_model.radioButtonValue7 == '明るい') {
                            return 3;
                          } else if (_model.radioButtonValue7 == '程よい暗さ') {
                            return 2;
                          } else {
                            return 1;
                          }
                        }(),
                        shishaPicture: '',
                      ),
                      ...mapToFirestore(
                        {
                          'timestamp': FieldValue.serverTimestamp(),
                        },
                      ),
                    });
                  },
                  text: '登録',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
