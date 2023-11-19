import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SleepRecord extends FirestoreRecord {
  SleepRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "in_bed" field.
  int? _inBed;
  int get inBed => _inBed ?? 0;
  bool hasInBed() => _inBed != null;

  // "asleep" field.
  int? _asleep;
  int get asleep => _asleep ?? 0;
  bool hasAsleep() => _asleep != null;

  // "awake" field.
  int? _awake;
  int get awake => _awake ?? 0;
  bool hasAwake() => _awake != null;

  // "deep_sleep" field.
  int? _deepSleep;
  int get deepSleep => _deepSleep ?? 0;
  bool hasDeepSleep() => _deepSleep != null;

  // "rem" field.
  int? _rem;
  int get rem => _rem ?? 0;
  bool hasRem() => _rem != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _inBed = castToType<int>(snapshotData['in_bed']);
    _asleep = castToType<int>(snapshotData['asleep']);
    _awake = castToType<int>(snapshotData['awake']);
    _deepSleep = castToType<int>(snapshotData['deep_sleep']);
    _rem = castToType<int>(snapshotData['rem']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _startTime = snapshotData['start_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sleep')
          : FirebaseFirestore.instance.collectionGroup('sleep');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('sleep').doc();

  static Stream<SleepRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SleepRecord.fromSnapshot(s));

  static Future<SleepRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SleepRecord.fromSnapshot(s));

  static SleepRecord fromSnapshot(DocumentSnapshot snapshot) => SleepRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SleepRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SleepRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SleepRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SleepRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSleepRecordData({
  int? inBed,
  int? asleep,
  int? awake,
  int? deepSleep,
  int? rem,
  DateTime? createdTime,
  DateTime? startTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'in_bed': inBed,
      'asleep': asleep,
      'awake': awake,
      'deep_sleep': deepSleep,
      'rem': rem,
      'created_time': createdTime,
      'start_time': startTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SleepRecordDocumentEquality implements Equality<SleepRecord> {
  const SleepRecordDocumentEquality();

  @override
  bool equals(SleepRecord? e1, SleepRecord? e2) {
    return e1?.inBed == e2?.inBed &&
        e1?.asleep == e2?.asleep &&
        e1?.awake == e2?.awake &&
        e1?.deepSleep == e2?.deepSleep &&
        e1?.rem == e2?.rem &&
        e1?.createdTime == e2?.createdTime &&
        e1?.startTime == e2?.startTime;
  }

  @override
  int hash(SleepRecord? e) => const ListEquality().hash([
        e?.inBed,
        e?.asleep,
        e?.awake,
        e?.deepSleep,
        e?.rem,
        e?.createdTime,
        e?.startTime
      ]);

  @override
  bool isValidKey(Object? o) => o is SleepRecord;
}
