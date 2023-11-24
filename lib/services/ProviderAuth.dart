import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProviderAuth {
  bool isLoggedIn =true;

  void updateUser(bool loggedIn) {
    isLoggedIn = loggedIn;
  }

  Future<void> logOutGoogle(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      print('Cierre de sesión exitoso con Google');

      
      updateUser(true); 

      
    } catch (error) {
      print('Error al cerrar sesión con Google: $error');
      
    }
  }
}