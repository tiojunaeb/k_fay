import 'package:flutter/material.dart';
import 'package:k_fay/pages/ActivoEventoPage.dart';
import 'package:k_fay/pages/FinalizadoEventoPage.dart';
import 'package:k_fay/pages/HomePage.dart';
import 'package:k_fay/pages/TopEventoPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold
    (appBar: AppBar(
      title: Text('k-fay',style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
      bottom: TabBar(
        labelColor:Colors.white,
        indicatorColor: Colors.red,
        unselectedLabelColor: Colors.white,

        tabs: [
          Tab(text: 'Actuales'  ),
          Tab(text: 'Top' ),
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