// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/landing_page.dart';

import 'package:time_tracker_flutter_course/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider <AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: "Time tracker",
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: LandingPage(),
      ),
    );
  }
}
