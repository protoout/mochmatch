import '/flutter_flow/flutter_flow_util.dart';
import 'supporter_page_widget.dart' show SupporterPageWidget;
import 'package:flutter/material.dart';

class SupporterPageModel extends FlutterFlowModel<SupporterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
