import 'package:flutter/material.dart';
import 'package:k_fay/widget/campoForm.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampoForm(controller: , titulo: 'agregar titulo')
      ],
    );
  }
}