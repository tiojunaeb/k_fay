import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:k_fay/services/firestore_service.dart';

class ActivoEventoPage extends StatelessWidget {
  
  final formatoFecha = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(children: [
        Expanded(child: Padding(padding: EdgeInsets.all(8),
        child:StreamBuilder(
          stream: FirestoreService().EventosActivos(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                  
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data!.docs.length, 
                    itemBuilder: (context, index){
                      var eventoa = snapshot.data!.docs[index];
                      DateTime fechaEvento = eventoa['fecha'].toDate();
                      return ListTile(
                        title: Text('${eventoa['nombre']}'),
                        
                        leading:  Container(
                          height: 35,
                          width: 35,
                          child: Image.network('${eventoa['foto']}', fit: BoxFit.cover),),
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
                                        .doc(eventoa.id)
                                        .update({'likes' : FieldValue.increment(1)}) 
                                        
                                        .catchError((er) => print('troleadiña:  $er'));
                                    },
                                   ),
                        ),
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