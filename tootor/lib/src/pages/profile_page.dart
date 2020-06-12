import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/pages/signin_page.dart';
import 'file:///C:/Users/MAIH_/AndroidStudioProjects/Tootor/tootor/lib/src/pages/main_navegation_page.dart';
class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: CustomColors.gray,
                radius: width-290,
                child: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/smile.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Name", style: TextStyle(fontSize: width-340)),
                  SizedBox(width: 10),
                  Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: width-330,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: CustomColors.divider_gray,
                height: 1,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  print("Ver habilidades");
                  //TODO: Push "Habilidades" Screen
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Editar Habilidades", style: TextStyle(fontSize: width-340, color: CustomColors.font_gray),),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: width-330,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: CustomColors.divider_gray
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  print("Ver configuración");
                  //TODO: Push "Configuración" Screen
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Configuración General", style: TextStyle(fontSize: width-340, color: CustomColors.font_gray),),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: width-330,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomColors.divider_gray,
                height: 1,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  print("Cerrar sesión");
                  //TODO: Cerrar sesión
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cerrar Sesión", style: TextStyle(fontSize: width-340, color: CustomColors.red),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      );
  }
}
