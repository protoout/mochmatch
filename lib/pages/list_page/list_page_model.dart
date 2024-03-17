import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_page_widget.dart' show ListPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListPageModel extends FlutterFlowModel<ListPageWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MochmatchDataRecord>? allShops;
  // Stores action output result for [Custom Action - searchShops] action in IconButton widget.
  List<MochmatchDataRecord>? filteredShops;
  // Stores action output result for [Custom Action - addDaradaraSearch] action in Button widget.
  String? addDaradara;
  // Stores action output result for [Custom Action - removeDaradaraSearch] action in Button widget.
  String? removeDaradara;
  // Stores action output result for [Custom Action - addWaiwaiSearch] action in Button widget.
  String? addWaiwai;
  // Stores action output result for [Custom Action - removeWaiwaiSearch] action in Button widget.
  String? removeWaiwai;
  // Stores action output result for [Custom Action - addMattariSearch] action in Button widget.
  String? addMattari;
  // Stores action output result for [Custom Action - removeMattariSearch] action in Button widget.
  String? removeMattari;
  // Stores action output result for [Custom Action - addShuchuSearch] action in Button widget.
  String? addShuchu;
  // Stores action output result for [Custom Action - removeShuchuSearch] action in Button widget.
  String? removeShuchu;
  // Stores action output result for [Custom Action - addShoshinshaSearch] action in Button widget.
  String? addShoshinsha;
  // Stores action output result for [Custom Action - removeShoshinshaSearch] action in Button widget.
  String? removeShoshinsha;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
