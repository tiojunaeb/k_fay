

import 'package:flutter/material.dart';
import 'package:k_fay/pages/NavEstadoPage.dart';
import 'package:k_fay/pages/navpage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GestionEvento extends StatelessWidget {
  const GestionEvento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(
      title: Text('Gestionar Evento'),
    ),
    body: ListView(
      children: [
        ListTile(
          title: Text('Agregar Evento'),
          leading: Icon(MdiIcons.applicationEdit),
          onTap: () {
            
            
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
      ListTile(title: Text(''),)
      ],
    ),
    );
  }
}