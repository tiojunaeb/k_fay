import 'package:flutter/material.dart';
import 'package:k_fay/pages/DetallePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:k_fay/services/firestore_service.dart';
import 'package:k_fay/widget/WidgetEvento.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('K-fay'),
        actions: [],
      ),
      body: Column(children: [
        Expanded(child: Padding(padding: EdgeInsets.all(8),
        child:StreamBuilder(
          stream: FirestoreService().eventos(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                  
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data!.docs.length, 
                    itemBuilder: (context, index){
                      var evento = snapshot.data!.docs[index];
                      return ListTile(
                        title:Text('${evento['titulo']}  ${evento['fecha']}' ) ,
                      );
                    },
                    );
                }
          }
        ) ))
      ],),

      //boton agregar evento
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.partyPopper, color: Colors.red,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
        onPressed: (){}),
    );

  }

  Future<UserCredential> LogGoogle() async {
  
  final GoogleSignInAccount? userG = await GoogleSignIn().signIn();

  
  final GoogleSignInAuthentication? AuthG= await userG?.authentication;

  
  final credential = GoogleAuthProvider.credential(
    accessToken: AuthG?.accessToken,
    idToken: AuthG?.idToken,
  );
  
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
}