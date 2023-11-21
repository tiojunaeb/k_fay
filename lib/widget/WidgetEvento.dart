import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WidgetEvento extends StatelessWidget {
  


  
  final String fecha;
  final String titulo;
  final String? ciudad;
  final int? likes;
  final Widget? destino;

  final Widget? imagen;

  WidgetEvento({this.fecha="", this.titulo="", this.ciudad, this.likes, this.imagen,this.destino });

 @override
  Widget build(BuildContext context) {
  return ListTile(
    leading: this.imagen,
    title: Row(
      children: [
        Text(this.titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(this.fecha, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    ),
    subtitle: Text(this.likes.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    trailing: Icon(MdiIcons.heart),
    onLongPress: () {
      print('Funciona');
      if (this.destino != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => this.destino!),
        );
      }
    },
  );
}
}
