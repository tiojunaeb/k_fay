import 'package:firebase_core/firebase_core.dart';

import 'package:image_picker/image_picker.dart';


  Future<XFile?> obtenerImagen() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);

    return imagen;


  }

