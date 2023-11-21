import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:k_fay/pages/HomePage.dart';
import 'package:k_fay/pages/gestion_eventos.dart';
import 'package:k_fay/pages/navpage.dart';
import 'package:provider/provider.dart';

class FiltroPage extends StatelessWidget {
  const FiltroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<User?>(context);

    return usuario == null ? NavPage() : GestionEvento();
  }
}