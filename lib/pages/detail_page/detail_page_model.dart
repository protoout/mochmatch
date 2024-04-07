import '/flutter_flow/flutter_flow_util.dart';
import 'detail_page_widget.dart' show DetailPageWidget;
import 'package:flutter/material.dart';

class DetailPageModel extends FlutterFlowModel<DetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
