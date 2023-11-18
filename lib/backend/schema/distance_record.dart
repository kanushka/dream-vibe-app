import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistanceRecord extends FirestoreRecord {
  DistanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _distance = castToType<double>(snapshotData['distance']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('distance')
          : FirebaseFirestore.instance.collectionGroup('distance');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('distance').doc();

  static Stream<DistanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DistanceRecord.fromSnapshot(s));

  static Future<DistanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DistanceRecord.fromSnapshot(s));

  static DistanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DistanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DistanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DistanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DistanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DistanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDistanceRecordData({
  double? distance,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'distance': distance,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class DistanceRecordDocumentEquality implements Equality<DistanceRecord> {
  const DistanceRecordDocumentEquality();

  @override
  bool equals(DistanceRecord? e1, DistanceRecord? e2) {
    return e1?.distance == e2?.distance && e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(DistanceRecord? e) =>
      const ListEquality().hash([e?.distance, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is DistanceRecord;
}
