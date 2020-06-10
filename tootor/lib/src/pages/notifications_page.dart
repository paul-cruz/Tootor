import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Notificaciones")),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Divider(
                  height: 1,
                  color: CustomColors.divider_gray,
                ),
                GestureDetector(
                  onTap: (){
                    print("Notificación pulsada");
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name tiene una duda y tus \nhabilidades pueden ayudarlo", style: TextStyle(fontSize: width-345)),
                            SizedBox(height: 10,),
                            Text("Materia: Algebra lineal",style: TextStyle(fontSize: width-350)),
                            Text("Tema: Transformaciones lineales",style: TextStyle(fontSize: width-350 ))
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: CustomColors.divider_gray,
                ),
              ],
            ),
          )
      ),
    );
  }
}
