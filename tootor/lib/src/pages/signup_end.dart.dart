import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class SignUpEndPage extends StatefulWidget {
  SignUpEndPage({Key key}) : super(key: key);

  @override
  _SignUpEndPageState createState() => _SignUpEndPageState();
}

class _SignUpEndPageState extends State<SignUpEndPage> {
  _continue() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Listo, hemos terminado!'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: CircleAvatar(
              backgroundColor: CustomColors.gray,
              radius: 150.0,
              child: Container(
                margin: EdgeInsets.all(25),
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/wink.png'), fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Center(child: Text('Name')),
                  subtitle: Center(
                      child: Text(
                    'Has concluido tu registro,\nbienveido a esta gran comunidad\ndonde nuestro fin es ayudarnos\nentre estudiantes.',
                    textAlign: TextAlign.center,
                  )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 150.0,
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: _continue,
                    textColor: Colors.white,
                    color: CustomColors.secondary,
                    child:
                        const Text('¡Vamos!', style: TextStyle(fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
