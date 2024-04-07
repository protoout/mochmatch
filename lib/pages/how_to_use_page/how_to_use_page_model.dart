import '/flutter_flow/flutter_flow_util.dart';
import 'how_to_use_page_widget.dart' show HowToUsePageWidget;
import 'package:flutter/material.dart';

class HowToUsePageModel extends FlutterFlowModel<HowToUsePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
