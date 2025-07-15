import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "SecondName" field.
  String? _secondName;
  String get secondName => _secondName ?? '';
  bool hasSecondName() => _secondName != null;

  // "limite_semanal" field.
  String? _limiteSemanal;
  String get limiteSemanal => _limiteSemanal ?? '';
  bool hasLimiteSemanal() => _limiteSemanal != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _active = snapshotData['active'] as bool?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _secondName = snapshotData['SecondName'] as String?;
    _limiteSemanal = snapshotData['limite_semanal'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? password,
  DateTime? birthdate,
  bool? active,
  DateTime? creationDate,
  String? name,
  String? secondName,
  String? limiteSemanal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'password': password,
      'birthdate': birthdate,
      'active': active,
      'creationDate': creationDate,
      'name': name,
      'SecondName': secondName,
      'limite_semanal': limiteSemanal,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.password == e2?.password &&
        e1?.birthdate == e2?.birthdate &&
        e1?.active == e2?.active &&
        e1?.creationDate == e2?.creationDate &&
        e1?.name == e2?.name &&
        e1?.secondName == e2?.secondName &&
        e1?.limiteSemanal == e2?.limiteSemanal;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.password,
        e?.birthdate,
        e?.active,
        e?.creationDate,
        e?.name,
        e?.secondName,
        e?.limiteSemanal
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
