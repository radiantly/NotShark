import 'package:flutter/material.dart';

void main() => runApp(NotSharkApp());

class NotSharkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Not Shark',
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('assets/password_meme.jpg'),
        height: MediaQuery.of(context).size.height*0.7,
        width: MediaQuery.of(context).size.width*0.8),
        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        ElevatedButton(onPressed: (){}, child: const Text('Open'),),
      ],
    ))));
  }
}
