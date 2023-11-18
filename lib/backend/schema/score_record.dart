import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScoreRecord extends FirestoreRecord {
  ScoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _score = castToType<int>(snapshotData['score']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('score')
          : FirebaseFirestore.instance.collectionGroup('score');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('score').doc();

  static Stream<ScoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScoreRecord.fromSnapshot(s));

  static Future<ScoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScoreRecord.fromSnapshot(s));

  static ScoreRecord fromSnapshot(DocumentSnapshot snapshot) => ScoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScoreRecordData({
  int? score,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'score': score,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScoreRecordDocumentEquality implements Equality<ScoreRecord> {
  const ScoreRecordDocumentEquality();

  @override
  bool equals(ScoreRecord? e1, ScoreRecord? e2) {
    return e1?.score == e2?.score && e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(ScoreRecord? e) =>
      const ListEquality().hash([e?.score, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is ScoreRecord;
}
