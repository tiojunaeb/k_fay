import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:k_fay/services/firestore_service.dart';

import 'DetallePage.dart';
class FinalizadoEventoPage extends StatelessWidget {
  
  final formatoFecha = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(children: [
        Expanded(child: Padding(padding: EdgeInsets.all(8),
        child:StreamBuilder(
          stream: FirestoreService().EventosFInalizados(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                  
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data!.docs.length, 
                    itemBuilder: (context, index){
                      var eventof = snapshot.data!.docs[index];
                      DateTime fechaEvento = eventof['fecha'].toDate();

                      return ListTile(
                        title: Text('${eventof['nombre']}'),
                        
                        leading:  Container(
                          height: 35,
                          width: 35,
                          child: Image.network('${eventof['foto']}', fit: BoxFit.cover),),
                        subtitle: Text('fecha: ' + formatoFecha.format(fechaEvento) ),
                        trailing: Container(
                          width: 120,
                          child: TextButton(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(MdiIcons.heart, color: Colors.red,),
                                        Text('Me gusta', style: TextStyle(color: Colors.red))
                                      ],
                                    ),
                                    onPressed: () {
                                      var collection = FirebaseFirestore.instance.collection('eventos');
                                      collection
                                        .doc(eventof.id)
                                        .update({'likes' : FieldValue.increment(1)}) 
                                        
                                        .catchError((er) => print('troleadiña:  $er'));
                                    },
                                   ),
                        ),
                        onTap: () {
                          DateTime fechaEvento = eventof['fecha'].toDate();
 
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetallePage(evento: eventof, fechaEvento: fechaEvento)));
                        },
                      );
                    },
                    );
                }
          }
        ) )),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, 
          style: ElevatedButton.styleFrom(
            primary: Colors.black
          ),
          child: Text('Salir', style: TextStyle(color: Colors.white))),
        )
      ],),
    );
  }
}