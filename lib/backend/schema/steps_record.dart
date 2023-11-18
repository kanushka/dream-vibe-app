import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepsRecord extends FirestoreRecord {
  StepsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  bool hasSteps() => _steps != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _steps = castToType<int>(snapshotData['steps']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('steps')
          : FirebaseFirestore.instance.collectionGroup('steps');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('steps').doc();

  static Stream<StepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StepsRecord.fromSnapshot(s));

  static Future<StepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StepsRecord.fromSnapshot(s));

  static StepsRecord fromSnapshot(DocumentSnapshot snapshot) => StepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStepsRecordData({
  int? steps,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'steps': steps,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class StepsRecordDocumentEquality implements Equality<StepsRecord> {
  const StepsRecordDocumentEquality();

  @override
  bool equals(StepsRecord? e1, StepsRecord? e2) {
    return e1?.steps == e2?.steps && e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(StepsRecord? e) =>
      const ListEquality().hash([e?.steps, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is StepsRecord;
}
