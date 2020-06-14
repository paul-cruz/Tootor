import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  double _fontSize = 20;

  _signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/signin');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundColor: CustomColors.gray,
                  radius: width - 290,
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
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Name", style: TextStyle(fontSize: 30)),
                    SizedBox(width: 10),
                    Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 30,
                    )
                  ],
                ),
              ),
              Divider(
                color: CustomColors.divider_gray,
                height: 1,
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    print("Ver habilidades");
                    //TODO: Push "Habilidades" Screen
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Editar Habilidades",
                          style: TextStyle(
                              fontSize: _fontSize, color: CustomColors.font_gray),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: _fontSize,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(height: 1, color: CustomColors.divider_gray),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    print("Ver configuración");
                    //TODO: Push "Configuración" Screen
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Configuración General",
                          style: TextStyle(
                              fontSize: _fontSize, color: CustomColors.font_gray),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: _fontSize,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: CustomColors.divider_gray,
                height: 1,
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    _signout();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cerrar Sesión",
                          style: TextStyle(
                              fontSize: _fontSize, color: CustomColors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
