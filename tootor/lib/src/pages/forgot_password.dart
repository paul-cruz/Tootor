import 'package:flutter/material.dart';

class ForgotPasswdPage extends StatefulWidget {
  ForgotPasswdPage({Key key}) : super(key: key);

  @override
  _ForgotPasswdPageState createState() => _ForgotPasswdPageState();
}

class _ForgotPasswdPageState extends State<ForgotPasswdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar contraseña"),
      ),
      body: Center(child: Text("Pagina de recuperación de contraseña"),),
    );
  }
}