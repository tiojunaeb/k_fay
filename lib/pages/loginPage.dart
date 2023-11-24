import 'package:flutter/material.dart';
import 'package:k_fay/pages/HomePage.dart';
import 'package:k_fay/pages/NavEstadoPage.dart';
import 'package:k_fay/pages/gestion_eventos.dart';
import 'package:k_fay/pages/navpage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Stream<User?> _userStream;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 0),
            alignment: Alignment.center,
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(height: 90), 
          Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              SizedBox(height: 20), 
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NavPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(MdiIcons.account, color: Colors.white),
                    SizedBox(width: 55),
                    Text('Entrar Como Publico', style: TextStyle(color: Colors.white))
                ]) ,
                
              ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()async{
                  await logGoogle();
                  
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(MdiIcons.google,
                    color: Colors.white),
                    SizedBox(width: 55),
                    Text('iniciar Sesion Con Google', style: TextStyle(color: Colors.white) ,)
                    
                  ],
                ) ,
                ),
                
              )
            ],
          ),
        ],
      ),
    );
  }
 

 Future<UserCredential?> logGoogle() async {
  try {
    
    final GoogleSignInAccount? userG = await GoogleSignIn().signIn();

   
    if (userG == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Inicio de sesión cancelado por el usuario',
      );
    }

    
    final GoogleSignInAuthentication? authG = await userG?.authentication;

    
    final credential = GoogleAuthProvider.credential(
      accessToken: authG?.accessToken,
      idToken: authG?.idToken,
    );

    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    
    print('Error al iniciar sesión con Google: $e');
    return null;
  }
}

}

  

