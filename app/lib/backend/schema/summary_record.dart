import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SummaryRecord extends FirestoreRecord {
  SummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "total_steps" field.
  int? _totalSteps;
  int get totalSteps => _totalSteps ?? 0;
  bool hasTotalSteps() => _totalSteps != null;

  // "total_distance" field.
  double? _totalDistance;
  double get totalDistance => _totalDistance ?? 0.0;
  bool hasTotalDistance() => _totalDistance != null;

  // "total_burned_calories" field.
  double? _totalBurnedCalories;
  double get totalBurnedCalories => _totalBurnedCalories ?? 0.0;
  bool hasTotalBurnedCalories() => _totalBurnedCalories != null;

  // "avg_heart_rate" field.
  int? _avgHeartRate;
  int get avgHeartRate => _avgHeartRate ?? 0;
  bool hasAvgHeartRate() => _avgHeartRate != null;

  // "total_exercise_minutes" field.
  int? _totalExerciseMinutes;
  int get totalExerciseMinutes => _totalExerciseMinutes ?? 0;
  bool hasTotalExerciseMinutes() => _totalExerciseMinutes != null;

  // "bed_in_time" field.
  DateTime? _bedInTime;
  DateTime? get bedInTime => _bedInTime;
  bool hasBedInTime() => _bedInTime != null;

  // "asleep_time" field.
  DateTime? _asleepTime;
  DateTime? get asleepTime => _asleepTime;
  bool hasAsleepTime() => _asleepTime != null;

  // "awake_time" field.
  DateTime? _awakeTime;
  DateTime? get awakeTime => _awakeTime;
  bool hasAwakeTime() => _awakeTime != null;

  // "deep_sleep_time" field.
  int? _deepSleepTime;
  int get deepSleepTime => _deepSleepTime ?? 0;
  bool hasDeepSleepTime() => _deepSleepTime != null;

  // "predicted_score" field.
  double? _predictedScore;
  double get predictedScore => _predictedScore ?? 0.0;
  bool hasPredictedScore() => _predictedScore != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _totalSteps = castToType<int>(snapshotData['total_steps']);
    _totalDistance = castToType<double>(snapshotData['total_distance']);
    _totalBurnedCalories =
        castToType<double>(snapshotData['total_burned_calories']);
    _avgHeartRate = castToType<int>(snapshotData['avg_heart_rate']);
    _totalExerciseMinutes =
        castToType<int>(snapshotData['total_exercise_minutes']);
    _bedInTime = snapshotData['bed_in_time'] as DateTime?;
    _asleepTime = snapshotData['asleep_time'] as DateTime?;
    _awakeTime = snapshotData['awake_time'] as DateTime?;
    _deepSleepTime = castToType<int>(snapshotData['deep_sleep_time']);
    _predictedScore = castToType<double>(snapshotData['predicted_score']);
    _score = castToType<double>(snapshotData['score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('summary');

  static Stream<SummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SummaryRecord.fromSnapshot(s));

  static Future<SummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SummaryRecord.fromSnapshot(s));

  static SummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSummaryRecordData({
  String? uid,
  DateTime? date,
  int? totalSteps,
  double? totalDistance,
  double? totalBurnedCalories,
  int? avgHeartRate,
  int? totalExerciseMinutes,
  DateTime? bedInTime,
  DateTime? asleepTime,
  DateTime? awakeTime,
  int? deepSleepTime,
  double? predictedScore,
  double? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'date': date,
      'total_steps': totalSteps,
      'total_distance': totalDistance,
      'total_burned_calories': totalBurnedCalories,
      'avg_heart_rate': avgHeartRate,
      'total_exercise_minutes': totalExerciseMinutes,
      'bed_in_time': bedInTime,
      'asleep_time': asleepTime,
      'awake_time': awakeTime,
      'deep_sleep_time': deepSleepTime,
      'predicted_score': predictedScore,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class SummaryRecordDocumentEquality implements Equality<SummaryRecord> {
  const SummaryRecordDocumentEquality();

  @override
  bool equals(SummaryRecord? e1, SummaryRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.date == e2?.date &&
        e1?.totalSteps == e2?.totalSteps &&
        e1?.totalDistance == e2?.totalDistance &&
        e1?.totalBurnedCalories == e2?.totalBurnedCalories &&
        e1?.avgHeartRate == e2?.avgHeartRate &&
        e1?.totalExerciseMinutes == e2?.totalExerciseMinutes &&
        e1?.bedInTime == e2?.bedInTime &&
        e1?.asleepTime == e2?.asleepTime &&
        e1?.awakeTime == e2?.awakeTime &&
        e1?.deepSleepTime == e2?.deepSleepTime &&
        e1?.predictedScore == e2?.predictedScore &&
        e1?.score == e2?.score;
  }

  @override
  int hash(SummaryRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.date,
        e?.totalSteps,
        e?.totalDistance,
        e?.totalBurnedCalories,
        e?.avgHeartRate,
        e?.totalExerciseMinutes,
        e?.bedInTime,
        e?.asleepTime,
        e?.awakeTime,
        e?.deepSleepTime,
        e?.predictedScore,
        e?.score
      ]);

  @override
  bool isValidKey(Object? o) => o is SummaryRecord;
}
