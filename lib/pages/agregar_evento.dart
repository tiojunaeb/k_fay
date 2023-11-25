import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:k_fay/services/firestore_service.dart';
import 'package:k_fay/services/imagen_get.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class AgregarEvento extends StatefulWidget {
  const AgregarEvento({super.key});

  @override
  State<AgregarEvento> createState() => _AgregarEventoState();
}

class _AgregarEventoState extends State<AgregarEvento> {

  TextEditingController tituloCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController ubiCtrl = TextEditingController();
  TextEditingController tipoCtrl = TextEditingController();

  DateTime fecha = DateTime.now();
  TimeOfDay hora = TimeOfDay.now();

  final fFecha = DateFormat('dd-MM-yyyy');
  final fHora = DateFormat('HH:mm');

  final FirebaseStorage storage = FirebaseStorage.instance;
  
  bool ImagenSub = true;
  bool FechaSub = true;
  bool HoraSub = true;


  final formKey = GlobalKey<FormState>();

  XFile? imagen;

  String url='';

  File? imagen_up;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              
            
              TextFormField(
                controller: tituloCtrl,
                decoration: InputDecoration(
                  label: Text('Titulo'),
                ),
                validator: (titulo) {
                  if (titulo!.isEmpty) {
                    return 'Indique el titulo';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: descCtrl,
                decoration: InputDecoration(
                  label: Text('Descripcion'),
                ),
                validator: (desc) {
                  if (desc!.isEmpty) {
                    return 'Indique la descripcion';
                  }
                  return null;
                },
              ),TextFormField(
                controller: ubiCtrl,
                decoration: InputDecoration(
                  label: Text('Ubicacion'),
                ),

                validator: (ubi) {
                  if (ubi!.isEmpty) {
                    return 'Indique la ubicacion';
                  }
                  return null;
                },
              ),TextFormField(
                controller: tipoCtrl,
                decoration: InputDecoration(
                  label: Text('Tipo de evento'),
                ),
                validator: (tipo) {
                  if (tipo!.isEmpty) {
                    return 'Indique el tipo de evento';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text('(Por default sera la fecha de hoy)'),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Fecha del evento: '),
                   
                    Text(fFecha.format(fecha)),
                    Spacer(),
                    IconButton(
                      icon: Icon(MdiIcons.calendar),
                      onPressed: () {
                          print('ffffffff');
                          showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2025),
                          locale: Locale('es', 'ES'),
                        ).then((v_fecha) {
                          
                          setState(() {
                            if (v_fecha == null) {
                            FechaSub = false;
                            return;
                          }
                            fecha = v_fecha ?? fecha;
                          });
                        });

                      },

                    ),
                  ],
                ),
              ),
               Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Hora del evento: '),
                    Text(fHora.format(fecha)),
                    Spacer(),
                    
                    IconButton(
                      icon: Icon(Icons.ac_unit_sharp),
                      onPressed: () {
                          print('ffffffff');
                         
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: hora.hour,
                                minute: hora.minute,
                              ), 
                            ).then((v_hora){
                              if (v_hora == null) {
                                  HoraSub = false;
                                  return;
                                }

                                setState(() {
                                  fecha = DateTime(
                                    fecha.year,
                                    fecha.month,
                                    fecha.day,
                                    v_hora.hour,
                                    v_hora.minute,
                                    );
                              });
                            
                            });

                      },

                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Seleccionar Imagen', style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  imagen = await obtenerImagen();
                  
                  setState(() {

                    if(imagen != null){
                    imagen_up = File(imagen!.path);
                    }
                

                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ),
                 ),
              
              imagen_up != null ? Image.file(imagen_up!) : Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                width: double.infinity,
                
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/EVENTOS.jpg' ))),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('Agregar Evento', style: TextStyle(color: Colors.white)),
                  onPressed: () async{
                    
                     if(imagen == null){
                      
                      EasyLoading.showError('Seleccione una imagen', duration: Duration(seconds: 1));

                      return;
                      }
                     
                     

                    final String nfile = imagen!.path.split("/").last;

                    final Reference ref = storage.ref().child("imagenes").child(nfile);
                    final UpTask = ref.putFile(imagen_up!);

                    final TaskSnapshot snap   = await UpTask.whenComplete(() => true);

                    url = await snap.ref.getDownloadURL();

                    if (formKey.currentState!.validate() && ImagenSub && FechaSub) {

                      
                           
                      FirestoreService().AddEvento(
                        tituloCtrl.text.trim(),
                        ubiCtrl.text.trim(),
                        tipoCtrl.text.trim(),
                        descCtrl.text.trim(),
                        url.trim(),
                        true,
                        fecha,
                        
                        0,
                      );
                      Navigator.pop(context);
                    }
                  
                  
                  },
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
}