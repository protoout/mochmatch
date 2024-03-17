import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MochmatchDataRecord extends FirestoreRecord {
  MochmatchDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "dayOfWeek" field.
  int? _dayOfWeek;
  int get dayOfWeek => _dayOfWeek ?? 0;
  bool hasDayOfWeek() => _dayOfWeek != null;

  // "timeframe" field.
  int? _timeframe;
  int get timeframe => _timeframe ?? 0;
  bool hasTimeframe() => _timeframe != null;

  // "softnessOfChair" field.
  int? _softnessOfChair;
  int get softnessOfChair => _softnessOfChair ?? 0;
  bool hasSoftnessOfChair() => _softnessOfChair != null;

  // "friendlinessOfStaffs" field.
  int? _friendlinessOfStaffs;
  int get friendlinessOfStaffs => _friendlinessOfStaffs ?? 0;
  bool hasFriendlinessOfStaffs() => _friendlinessOfStaffs != null;

  // "noisiness" field.
  int? _noisiness;
  int get noisiness => _noisiness ?? 0;
  bool hasNoisiness() => _noisiness != null;

  // "bgm" field.
  int? _bgm;
  int get bgm => _bgm ?? 0;
  bool hasBgm() => _bgm != null;

  // "brightness" field.
  int? _brightness;
  int get brightness => _brightness ?? 0;
  bool hasBrightness() => _brightness != null;

  // "twitterUrl" field.
  String? _twitterUrl;
  String get twitterUrl => _twitterUrl ?? '';
  bool hasTwitterUrl() => _twitterUrl != null;

  // "instagramUrl" field.
  String? _instagramUrl;
  String get instagramUrl => _instagramUrl ?? '';
  bool hasInstagramUrl() => _instagramUrl != null;

  // "webSiteUrl" field.
  String? _webSiteUrl;
  String get webSiteUrl => _webSiteUrl ?? '';
  bool hasWebSiteUrl() => _webSiteUrl != null;

  // "isClosed" field.
  bool? _isClosed;
  bool get isClosed => _isClosed ?? false;
  bool hasIsClosed() => _isClosed != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "shishaPicture" field.
  String? _shishaPicture;
  String get shishaPicture => _shishaPicture ?? '';
  bool hasShishaPicture() => _shishaPicture != null;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _dayOfWeek = castToType<int>(snapshotData['dayOfWeek']);
    _timeframe = castToType<int>(snapshotData['timeframe']);
    _softnessOfChair = castToType<int>(snapshotData['softnessOfChair']);
    _friendlinessOfStaffs =
        castToType<int>(snapshotData['friendlinessOfStaffs']);
    _noisiness = castToType<int>(snapshotData['noisiness']);
    _bgm = castToType<int>(snapshotData['bgm']);
    _brightness = castToType<int>(snapshotData['brightness']);
    _twitterUrl = snapshotData['twitterUrl'] as String?;
    _instagramUrl = snapshotData['instagramUrl'] as String?;
    _webSiteUrl = snapshotData['webSiteUrl'] as String?;
    _isClosed = snapshotData['isClosed'] as bool?;
    _location = snapshotData['location'] as LatLng?;
    _shishaPicture = snapshotData['shishaPicture'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mochmatch_data');

  static Stream<MochmatchDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MochmatchDataRecord.fromSnapshot(s));

  static Future<MochmatchDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MochmatchDataRecord.fromSnapshot(s));

  static MochmatchDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MochmatchDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MochmatchDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MochmatchDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MochmatchDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MochmatchDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMochmatchDataRecordData({
  DateTime? timestamp,
  String? name,
  int? dayOfWeek,
  int? timeframe,
  int? softnessOfChair,
  int? friendlinessOfStaffs,
  int? noisiness,
  int? bgm,
  int? brightness,
  String? twitterUrl,
  String? instagramUrl,
  String? webSiteUrl,
  bool? isClosed,
  LatLng? location,
  String? shishaPicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'name': name,
      'dayOfWeek': dayOfWeek,
      'timeframe': timeframe,
      'softnessOfChair': softnessOfChair,
      'friendlinessOfStaffs': friendlinessOfStaffs,
      'noisiness': noisiness,
      'bgm': bgm,
      'brightness': brightness,
      'twitterUrl': twitterUrl,
      'instagramUrl': instagramUrl,
      'webSiteUrl': webSiteUrl,
      'isClosed': isClosed,
      'location': location,
      'shishaPicture': shishaPicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class MochmatchDataRecordDocumentEquality
    implements Equality<MochmatchDataRecord> {
  const MochmatchDataRecordDocumentEquality();

  @override
  bool equals(MochmatchDataRecord? e1, MochmatchDataRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.name == e2?.name &&
        e1?.dayOfWeek == e2?.dayOfWeek &&
        e1?.timeframe == e2?.timeframe &&
        e1?.softnessOfChair == e2?.softnessOfChair &&
        e1?.friendlinessOfStaffs == e2?.friendlinessOfStaffs &&
        e1?.noisiness == e2?.noisiness &&
        e1?.bgm == e2?.bgm &&
        e1?.brightness == e2?.brightness &&
        e1?.twitterUrl == e2?.twitterUrl &&
        e1?.instagramUrl == e2?.instagramUrl &&
        e1?.webSiteUrl == e2?.webSiteUrl &&
        e1?.isClosed == e2?.isClosed &&
        e1?.location == e2?.location &&
        e1?.shishaPicture == e2?.shishaPicture;
  }

  @override
  int hash(MochmatchDataRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.name,
        e?.dayOfWeek,
        e?.timeframe,
        e?.softnessOfChair,
        e?.friendlinessOfStaffs,
        e?.noisiness,
        e?.bgm,
        e?.brightness,
        e?.twitterUrl,
        e?.instagramUrl,
        e?.webSiteUrl,
        e?.isClosed,
        e?.location,
        e?.shishaPicture
      ]);

  @override
  bool isValidKey(Object? o) => o is MochmatchDataRecord;
}
