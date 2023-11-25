import 'package:flutter/material.dart';
import 'package:k_fay/pages/ActivoEventoPage.dart';
import 'package:k_fay/pages/FinalizadoEventoPage.dart';
import 'package:k_fay/pages/HomePage.dart';
import 'package:k_fay/pages/TopEventoPage.dart';


class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold
    (appBar: AppBar(
      title: Text('k-fay',style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      bottom: TabBar(
        labelColor:Colors.white,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.white,
        unselectedLabelStyle: TextStyle(fontSize: 10),
        

        tabs: [
          Tab(text: 'publicados'),
          Tab(text: 'proximos' ),
          Tab(text: 'Activos' ),
          Tab(text: 'Finalizadas')
        ]),
      ),
      body: TabBarView(children: [
        HomePage(),
        TopEventoPage(),
        ActivoEventoPage(),
        FinalizadoEventoPage()

      ]),
      ),
    
      );
  }
}