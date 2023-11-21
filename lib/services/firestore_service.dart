import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  Stream<QuerySnapshot> eventos() {
    return FirebaseFirestore.instance.collection('eventos').snapshots();
    // return FirebaseFirestore.instance.collection('estudiantes').where('edad',isLessThanOrEqualTo: 25).orderBy('apellido').snapshots();
    // return FirebaseFirestore.instance.collection('estudiantes').get()
  }
}