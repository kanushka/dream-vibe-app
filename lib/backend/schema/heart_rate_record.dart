import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeartRateRecord extends FirestoreRecord {
  HeartRateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  // "resting_rate" field.
  int? _restingRate;
  int get restingRate => _restingRate ?? 0;
  bool hasRestingRate() => _restingRate != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rate = castToType<int>(snapshotData['rate']);
    _restingRate = castToType<int>(snapshotData['resting_rate']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('heart_rate')
          : FirebaseFirestore.instance.collectionGroup('heart_rate');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('heart_rate').doc();

  static Stream<HeartRateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HeartRateRecord.fromSnapshot(s));

  static Future<HeartRateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HeartRateRecord.fromSnapshot(s));

  static HeartRateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HeartRateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HeartRateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HeartRateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HeartRateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HeartRateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHeartRateRecordData({
  int? rate,
  int? restingRate,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rate': rate,
      'resting_rate': restingRate,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class HeartRateRecordDocumentEquality implements Equality<HeartRateRecord> {
  const HeartRateRecordDocumentEquality();

  @override
  bool equals(HeartRateRecord? e1, HeartRateRecord? e2) {
    return e1?.rate == e2?.rate &&
        e1?.restingRate == e2?.restingRate &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(HeartRateRecord? e) =>
      const ListEquality().hash([e?.rate, e?.restingRate, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is HeartRateRecord;
}
