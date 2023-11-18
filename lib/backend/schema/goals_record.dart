import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsRecord extends FirestoreRecord {
  GoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "step_count" field.
  int? _stepCount;
  int get stepCount => _stepCount ?? 0;
  bool hasStepCount() => _stepCount != null;

  // "sleep_hours" field.
  int? _sleepHours;
  int get sleepHours => _sleepHours ?? 0;
  bool hasSleepHours() => _sleepHours != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  // "exercise_minutes" field.
  int? _exerciseMinutes;
  int get exerciseMinutes => _exerciseMinutes ?? 0;
  bool hasExerciseMinutes() => _exerciseMinutes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _stepCount = castToType<int>(snapshotData['step_count']);
    _sleepHours = castToType<int>(snapshotData['sleep_hours']);
    _calories = castToType<double>(snapshotData['calories']);
    _exerciseMinutes = castToType<int>(snapshotData['exercise_minutes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('goals')
          : FirebaseFirestore.instance.collectionGroup('goals');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('goals').doc();

  static Stream<GoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalsRecord.fromSnapshot(s));

  static Future<GoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalsRecord.fromSnapshot(s));

  static GoalsRecord fromSnapshot(DocumentSnapshot snapshot) => GoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalsRecordData({
  int? stepCount,
  int? sleepHours,
  double? calories,
  int? exerciseMinutes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'step_count': stepCount,
      'sleep_hours': sleepHours,
      'calories': calories,
      'exercise_minutes': exerciseMinutes,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalsRecordDocumentEquality implements Equality<GoalsRecord> {
  const GoalsRecordDocumentEquality();

  @override
  bool equals(GoalsRecord? e1, GoalsRecord? e2) {
    return e1?.stepCount == e2?.stepCount &&
        e1?.sleepHours == e2?.sleepHours &&
        e1?.calories == e2?.calories &&
        e1?.exerciseMinutes == e2?.exerciseMinutes;
  }

  @override
  int hash(GoalsRecord? e) => const ListEquality()
      .hash([e?.stepCount, e?.sleepHours, e?.calories, e?.exerciseMinutes]);

  @override
  bool isValidKey(Object? o) => o is GoalsRecord;
}
