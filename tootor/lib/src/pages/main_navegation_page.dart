import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/routes/routes.dart';
import 'package:tootor/src/pages/profile_page.dart';
import 'package:tootor/src/pages/notifications_page.dart';
import 'package:tootor/src/pages/enter_doubt_page.dart';

Map<String, WidgetBuilder> rutas = buildAppRoutes();

class MainNavegation extends StatefulWidget {
  @override
  _MainNavegation createState() => _MainNavegation();
}

class _MainNavegation extends State<MainNavegation> {
  int _selectedPage = 0;
  double _fontSize = 10.0;
  
  final _pageOptions = [
    Text("Examen"),
    Text("Entrevista"),
    EnterDoubtPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  final _pageNames = [
    "Exámenes disponibles",
    "Entrevistas disponibles",
    "Ingresa tu duda o consulta",
    "Notificaciones",
    "Perfil y ajustes"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this._pageNames[this._selectedPage],
        ),
        centerTitle: true,
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.primary,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt, color: Colors.white),
              title: Text(
                "Exámen",
                style: TextStyle(fontSize: _fontSize, color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment, color: Colors.white),
              title: Text(
                "Entrevista",
                style: TextStyle(fontSize: _fontSize, color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit, color: Colors.white),
              title: Text(
                "Nueva duda",
                style: TextStyle(fontSize: _fontSize, color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none, color: Colors.white),
              title: Text(
                "Notificaciones",
                style: TextStyle(fontSize: _fontSize, color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              title: Text(
                "Perfil",
                style: TextStyle(fontSize: _fontSize, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
