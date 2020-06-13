import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/behaviors/hiddenScrollBehovior.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class ForgotPasswdPage extends StatefulWidget {
  ForgotPasswdPage({Key key}) : super(key: key);

  @override
  _ForgotPasswdPageState createState() => _ForgotPasswdPageState();
}

class _ForgotPasswdPageState extends State<ForgotPasswdPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isRecoveryingPasswd = false;

  String _email;

  _recoverPasswd() async {
    if (_isRecoveryingPasswd) return;
    setState(() {
      _isRecoveryingPasswd = true;
    });

    final form = _formKey.currentState;

    if (!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();

      setState(() {
        _isRecoveryingPasswd = false;
      });
    }

    form.save();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Revisa tu correo para seguir con el proceso'),
      ));
    } on Exception catch (e) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 30),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            _scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      ));
    } finally {
      setState(() {
        _isRecoveryingPasswd = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Recuperar contraseña"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Que mal... ¡Recuperemosla!',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),SizedBox(
                    height: 20,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child:
                        Text('Ingresa el correo con el que estas registrado'),
                  ),
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Correo'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Por favor ingresa un correo valido';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
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
                      onPressed: () {
                        _recoverPasswd();
                      },
                      textColor: Colors.white,
                      color: CustomColors.secondary,
                      child: const Text('Recuperar contraseña',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
