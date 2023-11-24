

import 'package:flutter/material.dart';
import 'package:k_fay/pages/NavEstadoPage.dart';
import 'package:k_fay/pages/agregar_evento.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GestionEvento extends StatelessWidget {
  const GestionEvento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(
      title: Text('Gestionar Evento'),
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ListTile(
                title: Text('Agregar Evento'),
                leading: Icon(MdiIcons.applicationEdit),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AgregarEvento()));
                  
                },
              ),
              Divider(),
              ListTile(title: Text('cambiar estado de un evento / Elimnar Evento'),
              leading: Icon(MdiIcons.eye),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NavEstadoPage()));
              },
              ),
              Divider(),

            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: ()async{
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                }, 
                child: Text('Cerrar Sesion', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ),
                
                ),
                
        )
      ],
    ),
    );
    
  }

}