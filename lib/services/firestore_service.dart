import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  Stream<QuerySnapshot> eventos() {
    return FirebaseFirestore.instance.collection('eventos').snapshots();

  }

   Future<void> AddEvento(String titulo,String ubicacion,String tipo,  String descripcion,String foto, bool estado , DateTime fecha, int likes) async {
    return FirebaseFirestore.instance.collection('eventos').doc().set({
      'nombre': titulo,
      'ubicacion': ubicacion,
      'tipo': tipo,
      'descripcion': descripcion,
      'foto': foto,
      'fecha': fecha,
      'estado': estado,
      'likes': likes,
    });
  }


  Future<void> BorrarEvento(String Id) async {
    return FirebaseFirestore.instance.collection('eventos').doc(Id).delete();
  }

  Stream<QuerySnapshot> EventosActivos() {
    return FirebaseFirestore.instance.collection('eventos').where('estado', isEqualTo: true).snapshots();
  }

  Stream<QuerySnapshot> EventosFInalizados() {
    return FirebaseFirestore.instance.collection('eventos').where('estado', isEqualTo: false).snapshots();
  }


  Stream<QuerySnapshot> EventosDestacados() {

    DateTime fechaAct = DateTime.now();
    DateTime fechaFut = fechaAct.add(Duration(days: 3));


    return FirebaseFirestore.instance.collection('eventos')
      .where('fecha', isGreaterThanOrEqualTo: fechaAct)
      .where('fecha', isLessThanOrEqualTo: fechaFut)
      .snapshots();
  }

}