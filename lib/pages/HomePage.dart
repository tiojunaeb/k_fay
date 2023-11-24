import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:k_fay/pages/DetallePage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:k_fay/services/firestore_service.dart';
import 'package:k_fay/widget/WidgetEvento.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:google_sign_in/google_sign_in.dart';


class HomePage extends StatelessWidget {
  final formatoFecha = DateFormat('dd-MM-yyyy');
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                       DateTime fechaEvento = evento['fecha'].toDate();
                      return ListTile(
                        title: Text('${evento['titulo']} '),
                        leading: Icon(MdiIcons.abacus),
                        subtitle: Text('fecha: ' + formatoFecha.format(fechaEvento) ),
                        trailing: Icon(MdiIcons.heart),
                        onLongPress: () {
                          DateTime fechaEvento = evento['fecha'].toDate();

                          
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetallePage(evento: evento, fechaEvento: fechaEvento))); 
                        },
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
        onPressed: ()async{
          await LogGoogle();

        }),
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