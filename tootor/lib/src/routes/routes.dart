import 'package:flutter/material.dart';
import 'package:tootor/src/pages/forgot_password.dart';
import 'package:tootor/src/pages/signin_page.dart';
import 'package:tootor/src/pages/signup_page.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return <String, WidgetBuilder>{
    '/signin': (BuildContext context) => SignInPage(),
    '/signup': (BuildContext context) => SignUpPage(),
    '/forgotpasswd': (BuildContext context) => ForgotPasswdPage(),
  };
}
