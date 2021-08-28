import 'dart:async';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globals.cameras = await availableCameras();

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
      home: HomePage(),
    );
  }
}
