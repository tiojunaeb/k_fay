import 'package:flutter/material.dart';
import 'package:k_fay/pages/DetallePage.dart';

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
      body: ListView(children: [
        WidgetEvento(
          imagen: Image.asset('assets/paes.png'),
          titulo: 'Adios Paes ',
          fecha: '0/0/0',
          likes: 0,
          destino: DetallePage(),
        )
      ]),

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