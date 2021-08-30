import 'dart:async';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'home.dart';
import 'camera_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globals.cameras = await availableCameras();
  globals.prefs = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(NotSharkApp());
}

class NotSharkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Not Shark',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        accentColor: Colors.white,
        primarySwatch: Colors.lightGreen,
      ),
      home: globals.prefs.getBool("loggedIn") ?? false
          ? CameraScreen()
          : HomePage(),
    );
  }
}
