import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayOfWeekRecord extends FirestoreRecord {
  DayOfWeekRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dayOfWeek" field.
  String? _dayOfWeek;
  String get dayOfWeek => _dayOfWeek ?? '';
  bool hasDayOfWeek() => _dayOfWeek != null;

  // "sortNo" field.
  int? _sortNo;
  int get sortNo => _sortNo ?? 0;
  bool hasSortNo() => _sortNo != null;

  void _initializeFields() {
    _dayOfWeek = snapshotData['dayOfWeek'] as String?;
    _sortNo = castToType<int>(snapshotData['sortNo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dayOfWeek');

  static Stream<DayOfWeekRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DayOfWeekRecord.fromSnapshot(s));

  static Future<DayOfWeekRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DayOfWeekRecord.fromSnapshot(s));

  static DayOfWeekRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DayOfWeekRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DayOfWeekRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DayOfWeekRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DayOfWeekRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DayOfWeekRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDayOfWeekRecordData({
  String? dayOfWeek,
  int? sortNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dayOfWeek': dayOfWeek,
      'sortNo': sortNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DayOfWeekRecordDocumentEquality implements Equality<DayOfWeekRecord> {
  const DayOfWeekRecordDocumentEquality();

  @override
  bool equals(DayOfWeekRecord? e1, DayOfWeekRecord? e2) {
    return e1?.dayOfWeek == e2?.dayOfWeek && e1?.sortNo == e2?.sortNo;
  }

  @override
  int hash(DayOfWeekRecord? e) =>
      const ListEquality().hash([e?.dayOfWeek, e?.sortNo]);

  @override
  bool isValidKey(Object? o) => o is DayOfWeekRecord;
}
