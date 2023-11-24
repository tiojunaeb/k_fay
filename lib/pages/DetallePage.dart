import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';

class DetallePage extends StatelessWidget {
  final dynamic evento;
  final DateTime fechaEvento;
  DetallePage({required this.evento, required this.fechaEvento});
  final formatoFecha = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle evento'),
      ),
      body: Column(
        
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 3
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                
                child: Image.asset('assets/paes.png', fit: BoxFit.cover,),
              )
            ),
          ),
          Container(child: 
          Text('${evento['nombre']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          ),
          Row(
           children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Icon(MdiIcons.calendar, size: 50,),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('${formatoFecha.format(fechaEvento)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text('Hora: 20:30-5:00')])
           ],),
           Container(
            child: Row(children: [
              Container(child: 
              Icon(MdiIcons.mapMarker, size: 50,)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${evento['ubicacion']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text('Hotel sheraton'),
                ],
              )
              
            ]
            ),
           ),
          Row(
           children: [
             Icon(MdiIcons.heart, size: 50,),
             Column(children: [
              Text('${evento['likes']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
             ],)
           ],
          ),
          Spacer(),
          Row(
            children: [Expanded(child: 
            Padding(padding: EdgeInsets.all(8), child: ElevatedButton(onPressed: (){}, child: Text('Guardar evento'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              foregroundColor: MaterialStateProperty.all(Colors.white)
            ),),)
            )],
          )
        ],
      )
    );
  }
}