import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
class TootorBottomNavigationBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.primary,
        items: [
          BottomNavigationBarItem(
          icon: Icon(
            Icons.receipt,
            color: Colors.white,
          ),
          title: Text('Exámenes', style: TextStyle(fontSize: width-350, color: Colors.white),),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.comment,
            color: Colors.white,
          ),
          title: Text('Entrevistas', style: TextStyle(fontSize: width-350, color: Colors.white),),
          ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          title: Text('Nueva duda', style: TextStyle(fontSize: width-350, color: Colors.white),),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          title: Text('Notificaciones', style: TextStyle(fontSize: width-350, color: Colors.white),),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: Text('Perfil', style: TextStyle(fontSize: width-350, color: Colors.white),),
        ),
      ]
    );
  }

}