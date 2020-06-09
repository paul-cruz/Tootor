import 'package:flutter/material.dart';
import 'package:tootor/src/pages/forgot_password.dart';
import 'package:tootor/src/pages/signin_page.dart';
import 'package:tootor/src/pages/signup_page.dart';
import 'package:tootor/src/pages/select_subject_page.dart';
import 'package:tootor/src/pages/profile_page.dart';
import 'package:tootor/src/pages/searching_tootor_page.dart';
import 'package:tootor/src/pages/tootor_found_page.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return <String, WidgetBuilder>{
    '/signin': (BuildContext context) => SignInPage(),
    '/signup': (BuildContext context) => SignUpPage(),
    '/forgotpasswd': (BuildContext context) => ForgotPasswdPage(),
    '/selectsubject': (BuildContext context) => SelectSubjectPage(),
    '/profile': (BuildContext context) => ProfilePage(),
    '/serchtutor': (BuildContext context) => SearchingTootorPage(),
    '/tutorfound': (BuildContext context) => TootorFoundPage(),
  };
}
