import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredictedScoreRecord extends FirestoreRecord {
  PredictedScoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _score = castToType<double>(snapshotData['score']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('predicted_score')
          : FirebaseFirestore.instance.collectionGroup('predicted_score');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('predicted_score').doc();

  static Stream<PredictedScoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PredictedScoreRecord.fromSnapshot(s));

  static Future<PredictedScoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PredictedScoreRecord.fromSnapshot(s));

  static PredictedScoreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PredictedScoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PredictedScoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PredictedScoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PredictedScoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PredictedScoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPredictedScoreRecordData({
  DateTime? createdTime,
  double? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class PredictedScoreRecordDocumentEquality
    implements Equality<PredictedScoreRecord> {
  const PredictedScoreRecordDocumentEquality();

  @override
  bool equals(PredictedScoreRecord? e1, PredictedScoreRecord? e2) {
    return e1?.createdTime == e2?.createdTime && e1?.score == e2?.score;
  }

  @override
  int hash(PredictedScoreRecord? e) =>
      const ListEquality().hash([e?.createdTime, e?.score]);

  @override
  bool isValidKey(Object? o) => o is PredictedScoreRecord;
}
