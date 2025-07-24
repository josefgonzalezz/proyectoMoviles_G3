import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GastoRealizadoRecord extends FirestoreRecord {
  GastoRealizadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Compra" field.
  String? _compra;
  String get compra => _compra ?? '';
  bool hasCompra() => _compra != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "Costo" field.
  String? _costo;
  String get costo => _costo ?? '';
  bool hasCosto() => _costo != null;

  void _initializeFields() {
    _compra = snapshotData['Compra'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _comentario = snapshotData['comentario'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _costo = snapshotData['Costo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gastoRealizado');

  static Stream<GastoRealizadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GastoRealizadoRecord.fromSnapshot(s));

  static Future<GastoRealizadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GastoRealizadoRecord.fromSnapshot(s));

  static GastoRealizadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GastoRealizadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GastoRealizadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GastoRealizadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GastoRealizadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GastoRealizadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGastoRealizadoRecordData({
  String? compra,
  String? descripcion,
  DocumentReference? owner,
  String? comentario,
  DateTime? dueDate,
  String? costo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Compra': compra,
      'Descripcion': descripcion,
      'owner': owner,
      'comentario': comentario,
      'dueDate': dueDate,
      'Costo': costo,
    }.withoutNulls,
  );

  return firestoreData;
}

class GastoRealizadoRecordDocumentEquality
    implements Equality<GastoRealizadoRecord> {
  const GastoRealizadoRecordDocumentEquality();

  @override
  bool equals(GastoRealizadoRecord? e1, GastoRealizadoRecord? e2) {
    return e1?.compra == e2?.compra &&
        e1?.descripcion == e2?.descripcion &&
        e1?.owner == e2?.owner &&
        e1?.comentario == e2?.comentario &&
        e1?.dueDate == e2?.dueDate &&
        e1?.costo == e2?.costo;
  }

  @override
  int hash(GastoRealizadoRecord? e) => const ListEquality().hash([
        e?.compra,
        e?.descripcion,
        e?.owner,
        e?.comentario,
        e?.dueDate,
        e?.costo
      ]);

  @override
  bool isValidKey(Object? o) => o is GastoRealizadoRecord;
}
