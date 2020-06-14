import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/widgets/tootor_notification.dart';
import 'package:tootor/src/pages/help_requested_page.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  String _name = "Juanito"; // this will be filled by data of DB

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Divider(
                  height: 1,
                  color: CustomColors.divider_gray,
                ),
                //Place a for loop for all the notifications
                GestureDetector(
                  onTap: (){
                    print("Notificación pulsada");
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HelpRequestedPage(name: this._name)));
                  },
                  child: TootorNotification(name: this._name, subject: "Algebra lineal", topic: "Transformaciones lineales"),
                ),
                Divider(
                  height: 1,
                  color: CustomColors.divider_gray,
                ),
                GestureDetector(
                  onTap: (){
                    print("Notificación pulsada");
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HelpRequestedPage(name: "Javier")));
                  },
                  child: TootorNotification(name: "Javier", subject: "Teoría computacional", topic: "AFD"),
                ),
                Divider(
                  height: 1,
                  color: CustomColors.divider_gray,
                ),
              ],
            ),
          )
      );
  }
}
