import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WidgetDetallePage extends StatelessWidget {
  const WidgetDetallePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle evento'),
      ),
      body: Column(
        
        children: [
          Container(
            width: 360,
            height: 360,
            child: Image.asset('assets/paes.png'),
          ),
          Container(child: 
          Text('Adios paes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
              Text('jueves, noviembre 23, 2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text('Hora: 20:30-5:00')])
           ],),
           Container(
            child: Row(children: [
              Container(child: 
              Icon(MdiIcons.mapMarker, size: 50,)),
              Column(
                children: [
                  Text('Viña del mar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
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
              Text('  0 ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
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