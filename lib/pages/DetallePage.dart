import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({super.key});

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
          Row(
            
            children: [
              Container(
                padding:EdgeInsets.all(8) ,
                child: Text('Ubicacion: Valpo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
                Spacer(),
                Container(
                padding:EdgeInsets.all(8) ,
                child: Text('fecha: 12/12/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ))
            ],
          ),
          Row(
            children: [],
          )
        ],
      )
    );
  }
}