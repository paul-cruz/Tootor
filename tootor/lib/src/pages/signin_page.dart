import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tootor/src/behaviors/hiddenScrollBehovior.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoggingIn = false;

  String _email, _password;

  _googleLogIn() async {
    if (_isLoggingIn) return;
    setState(() {
      _isLoggingIn = true;
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Iniciando Sesion...'),
    ));

    try {
      GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googleSignInAuth =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuth.idToken,
          accessToken: googleSignInAuth.accessToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pushReplacementNamed('/home');
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
        _isLoggingIn = false;
      });
    }
  }

  _facebookLogIn() async {
    if (_isLoggingIn) return;
    setState(() {
      _isLoggingIn = true;
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Iniciando Sesion...'),
    ));

    try {
      final FacebookLoginResult result = await FacebookLogin().logIn(['email']);
      if (result.status != FacebookLoginStatus.loggedIn) return null;
      final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pushReplacementNamed('/home');
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
        _isLoggingIn = false;
      });
    }
  }

  _loginin() async {
    if (_isLoggingIn) return;
    setState(() {
      _isLoggingIn = true;
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Iniciando Sesion...'),
    ));

    final form = _formKey.currentState;

    if (!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();

      setState(() {
        _isLoggingIn = false;
      });
    }

    form.save();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacementNamed('/home');
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
        _isLoggingIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text("Tootor")),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Text(
                    '¡Bienvenido!',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
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
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Por favor ingresa una contraseña correcta';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      _password = val;
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
                      _loginin();
                    },
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
                      onPressed: () {
                        _googleLogIn();
                      },
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
                      onPressed: () {
                        _facebookLogIn();
                      },
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
