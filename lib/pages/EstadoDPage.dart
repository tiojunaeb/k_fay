import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:k_fay/services/firestore_service.dart';
class EstadoDPage extends StatelessWidget {
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
                      var evento = snapshot.data!.docs[index];
                      DateTime fechaEvento = evento['fecha'].toDate();
                      return Slidable(
                        endActionPane: (
                          ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              backgroundColor: Colors.blue,
                              icon: MdiIcons.check,
                              label: 'Activar',
                              
                              onPressed: (contex){
                                FirestoreService().cambiarEstadoEventoTrue(evento.id);
                              })
                          ])
                        ),
                        
                        
                        
                        
                        child: ListTile(
                        title: Text('${evento['nombre']}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        leading: Container(
                          height: 35,
                          width: 35,
                          child: Image.network('${evento['foto']}', fit: BoxFit.cover),),
                        subtitle: Text('fecha: ' + formatoFecha.format(fechaEvento) ),
                        
                        )
                        
                        
                        
                        );
                    },
                  
                    );
                    
                }
          }
      
        )
        )
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, 
          style: ElevatedButton.styleFrom(
            primary: Colors.black
          ),
          child: Text('Volver', style: TextStyle(color: Colors.white))),
        )
        
      ]
      
      ,),
    );
  }
}