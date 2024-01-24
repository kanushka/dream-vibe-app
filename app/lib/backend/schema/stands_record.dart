import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StandsRecord extends FirestoreRecord {
  StandsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "stand_time" field.
  int? _standTime;
  int get standTime => _standTime ?? 0;
  bool hasStandTime() => _standTime != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _standTime = castToType<int>(snapshotData['stand_time']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('stands')
          : FirebaseFirestore.instance.collectionGroup('stands');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('stands').doc();

  static Stream<StandsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StandsRecord.fromSnapshot(s));

  static Future<StandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StandsRecord.fromSnapshot(s));

  static StandsRecord fromSnapshot(DocumentSnapshot snapshot) => StandsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StandsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StandsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StandsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StandsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStandsRecordData({
  int? standTime,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stand_time': standTime,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class StandsRecordDocumentEquality implements Equality<StandsRecord> {
  const StandsRecordDocumentEquality();

  @override
  bool equals(StandsRecord? e1, StandsRecord? e2) {
    return e1?.standTime == e2?.standTime && e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(StandsRecord? e) =>
      const ListEquality().hash([e?.standTime, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is StandsRecord;
}
