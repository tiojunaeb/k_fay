import 'package:flutter/material.dart';

import 'package:k_fay/pages/EstadoDPage.dart';
import 'package:k_fay/pages/EstadoPage.dart';





class NavEstadoPage extends StatelessWidget {
  const NavEstadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold
    (appBar: AppBar(
      title: Text('k-fay',style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      bottom: TabBar(
        labelColor:Colors.white,
        indicatorColor: Colors.black,
        unselectedLabelColor: Colors.white,

        tabs: [
          Tab(text: 'activos'  ),
          Tab(text: 'Desactivados' ),
        ]),
      ),
      body: TabBarView(children: [
        EstadoPage(),
       EstadoDPage()
      ]),
      ),
    
      );
  }
}