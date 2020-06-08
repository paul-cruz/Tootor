import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tootor/src/behaviors/hiddenScrollBehovior.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tootor")),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: Form(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Text('¡Bienvenido!', style: TextStyle(fontSize: 30.0,),),
                ),
                CircleAvatar(
                  backgroundColor: CustomColors.secondary,
                  radius: 120,
                  child: Container(
                    margin: EdgeInsets.all(25),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Correo'),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: () {},
                    textColor: Colors.white,
                    color: CustomColors.secondary,
                    child: const Text('Iniciar Sesion',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: SvgPicture.asset(
                        'assets/google.svg',
                        width: 40.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      child: SvgPicture.asset(
                        'assets/facebook.svg',
                        width: 70.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
                FlatButton(
                  textColor: CustomColors.secondary,
                  child: Text('Olvidé mi contraseña'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/forgotpasswd');
                  },
                )
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/signup');
          },
          child: Text('No tengo cuenta aún'),
        )
      ],
    );
  }
}
