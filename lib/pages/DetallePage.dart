import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';

class DetallePage extends StatelessWidget {
  final dynamic evento;
  final DateTime fechaEvento;
  DetallePage({required this.evento, required this.fechaEvento});

  final formatoFecha = DateFormat('dd-MM-yyyy');
  final formatoHora = DateFormat('HH:mm');

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
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 3
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                
                child: Image.network('${evento['foto']}', fit: BoxFit.cover),
              )
            ),
          ),
          Container(child: 
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('${evento['nombre']}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              
              Icon(MdiIcons.heart),
              Text('${evento['likes']}         ')
            ],)
          ],)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                   
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Row(
                      children: [Icon(MdiIcons.calendar),
                      Text(
                      '${formatoFecha.format(fechaEvento)}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                      
                      ],
                    ),),
                    Container(
                     
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                      child:Text('Hora: '+formatoHora.format(fechaEvento)),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Row(
                      children: [Icon(MdiIcons.mapMarker),
                      Text('${evento['ubicacion']}',
                      
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                      
                      ],
                    ),),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                      child:Text('${evento['tipo']}'),)
                  ],
                ),
                
                  
               
                // Espacio entre los elementos
                
              ],
            ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
            child: Column(
            children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('🔥Descripcion del evento 🔥',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('${evento['descripcion']}',textAlign: TextAlign.center,))
              ],
            ),
            ],
          ),),
        
          Spacer(),
          Row(
            children: [Expanded(child: 
            Padding(padding: EdgeInsets.all(8), child: ElevatedButton(onPressed: (){
               Navigator.pop(context);
            }, child: Text('Volver'),
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