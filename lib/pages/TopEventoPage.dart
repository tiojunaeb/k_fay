import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:k_fay/services/firestore_service.dart';
class TopEventoPage extends StatelessWidget {
  const TopEventoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(children: [
        Expanded(child: Padding(padding: EdgeInsets.all(8),
        child:StreamBuilder(
          stream: FirestoreService().EventosDestacados(),
          builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                  
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data!.docs.length, 
                    itemBuilder: (context, index){
                      var eventot = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text('${eventot['nombre']}'),
                        
                        leading: Icon(MdiIcons.abacus),
                        subtitle: Text('${eventot['likes']}'),
                        trailing: Icon(MdiIcons.heart),
                      );
                    },
                    );
                }
          }
        ) ))
      ],),
    );

  }
}