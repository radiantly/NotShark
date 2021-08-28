import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'package:not_shark/meme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MemePage()));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white60),
              shape: BoxShape.circle,
            ),
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  "?",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'ENTER THE SECRET USERNAME AND PASSWORD',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 20),
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                LoginForm()
              ],
            )));
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              loginFormField(
                label: "Username",
                helpText: "Enter the secret username",
              ),
              loginFormField(
                  label: "Password",
                  helpText: "Enter the super secret password",
                  password: true)
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CameraScreen()));
                }
              },
              // color: Colors.white70,
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}

Widget loginFormField(
    {required String label, required String helpText, bool password = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: TextFormField(
      obscureText: password,
      style: TextStyle(color: Colors.white60),
      validator: (value) {
        if (value != "password") return "Incorrect " + label;
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintStyle: TextStyle(color: Colors.white60),
          helperText: helpText),
    ),
  );
}
