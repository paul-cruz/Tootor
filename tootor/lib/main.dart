import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/pages/main_navegation_page.dart';
import 'package:tootor/src/pages/signin_page.dart';
import 'package:tootor/src/routes/routes.dart';
import 'package:tootor/src/theme/theme.dart';

void main() => runApp(TootorApp());

class TootorApp extends StatefulWidget {
  TootorApp({Key key}) : super(key: key);

  @override
  _TootorAppState createState() => _TootorAppState();
}

class _TootorAppState extends State<TootorApp> {
  Widget _rootPage = SignInPage();

  Future<Widget> getRootPage() async =>
      await FirebaseAuth.instance.currentUser() == null
          ? SignInPage()
          : MainNavegation();

  @override
  void initState() {
    super.initState();
    getRootPage().then((Widget page) {
      setState(() {
        _rootPage = page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tootor',
      //initialRoute: '/signin',
      home: _rootPage,
      routes: buildAppRoutes(),
      theme: buildAppTheme(),
    );
  }
}
