import 'package:flutter/material.dart';
import 'package:tootor/src/routes/routes.dart';
import 'package:tootor/src/theme/theme.dart';

void main() => runApp(TootorApp());

class TootorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tootor',
      initialRoute: '/signin',
      routes: buildAppRoutes(),
      theme: buildAppTheme(),
      /*onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },*/
    );
  }
}