import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LimiteSemanalRecord extends FirestoreRecord {
  LimiteSemanalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "limite" field.
  String? _limite;
  String get limite => _limite ?? '';
  bool hasLimite() => _limite != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _limite = snapshotData['limite'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('limite_semanal');

  static Stream<LimiteSemanalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LimiteSemanalRecord.fromSnapshot(s));

  static Future<LimiteSemanalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LimiteSemanalRecord.fromSnapshot(s));

  static LimiteSemanalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LimiteSemanalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LimiteSemanalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LimiteSemanalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LimiteSemanalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LimiteSemanalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLimiteSemanalRecordData({
  String? limite,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'limite': limite,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class LimiteSemanalRecordDocumentEquality
    implements Equality<LimiteSemanalRecord> {
  const LimiteSemanalRecordDocumentEquality();

  @override
  bool equals(LimiteSemanalRecord? e1, LimiteSemanalRecord? e2) {
    return e1?.limite == e2?.limite && e1?.owner == e2?.owner;
  }

  @override
  int hash(LimiteSemanalRecord? e) =>
      const ListEquality().hash([e?.limite, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is LimiteSemanalRecord;
}
