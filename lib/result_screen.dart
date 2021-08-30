import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

// A widget that displays the picture taken by the user.
class ResultScreen extends StatelessWidget {
  final String imagePath;
  final bool result;
  const ResultScreen({Key? key, required this.imagePath, required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 60),
              margin: EdgeInsets.only(top: 130),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(File(imagePath)),
                ),
              ),
              constraints: BoxConstraints.expand(),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff22232d)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "SCAN AGAIN",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 30),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ]),
                      )))),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xff22232d),
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Text(
                this.result ? "SHARK" : "NOT SHARK",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 35),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(top: 110),
              child: Image.asset(
                  this.result ? 'assets/check.png' : 'assets/x.png'),
            ),
          )
        ],
      ),
    );
  }
}
