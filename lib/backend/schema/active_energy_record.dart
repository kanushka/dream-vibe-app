import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActiveEnergyRecord extends FirestoreRecord {
  ActiveEnergyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _calories = castToType<int>(snapshotData['calories']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('active_energy')
          : FirebaseFirestore.instance.collectionGroup('active_energy');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('active_energy').doc();

  static Stream<ActiveEnergyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActiveEnergyRecord.fromSnapshot(s));

  static Future<ActiveEnergyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActiveEnergyRecord.fromSnapshot(s));

  static ActiveEnergyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActiveEnergyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActiveEnergyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActiveEnergyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActiveEnergyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActiveEnergyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActiveEnergyRecordData({
  int? calories,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'calories': calories,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActiveEnergyRecordDocumentEquality
    implements Equality<ActiveEnergyRecord> {
  const ActiveEnergyRecordDocumentEquality();

  @override
  bool equals(ActiveEnergyRecord? e1, ActiveEnergyRecord? e2) {
    return e1?.calories == e2?.calories && e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(ActiveEnergyRecord? e) =>
      const ListEquality().hash([e?.calories, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is ActiveEnergyRecord;
}
