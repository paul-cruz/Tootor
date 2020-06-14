import 'package:flutter/material.dart';
import 'package:tootor/src/pages/forgot_password.dart';
import 'package:tootor/src/pages/interview_detail_page.dart';
import 'package:tootor/src/pages/main_navegation_page.dart';
import 'package:tootor/src/pages/signin_page.dart';
import 'package:tootor/src/pages/signup_page.dart';
import 'package:tootor/src/pages/select_subject_page.dart';
import 'package:tootor/src/pages/profile_page.dart';
import 'package:tootor/src/pages/searching_tootor_page.dart';
import 'package:tootor/src/pages/test_detail_page.dart';
import 'package:tootor/src/pages/tootor_found_page.dart';
import 'package:tootor/src/pages/notifications_page.dart';
import 'package:tootor/src/pages/call_page.dart';
import 'package:tootor/src/pages/evaluation_page.dart';
import 'package:tootor/src/pages/enter_doubt_page.dart';
import 'package:tootor/src/pages/help_requested_page.dart';
import 'package:tootor/src/pages/chat_solving_page.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return <String, WidgetBuilder>{
    '/signin': (BuildContext context) => SignInPage(),
    '/signup': (BuildContext context) => SignUpPage(),
    '/test/detail': (BuildContext context) => TestDetailPage(),
    '/interview/detail': (BuildContext context) => InterviewDetailPage(),
    '/home': (BuildContext context) => MainNavegation(),
    '/forgotpasswd': (BuildContext context) => ForgotPasswdPage(),
    '/selectsubject': (BuildContext context) => SelectSubjectPage(),
    '/profile': (BuildContext context) => ProfilePage(),
    '/serchtutor': (BuildContext context) => SearchingTootorPage(),
    '/tutorfound': (BuildContext context) => TootorFoundPage(),
    '/notifications': (BuildContext context) => NotificationsPage(),
    '/call': (BuildContext context) => CallPage(),
    '/evaluation': (BuildContext context) => EvaluationPage(),
    '/enterdoubt': (BuildContext context) => EnterDoubtPage(),
    '/helprequested': (BuildContext context) => HelpRequestedPage(),
    '/chatsolving' : (BuildContext context) => ChatSolving(),
  };
}
