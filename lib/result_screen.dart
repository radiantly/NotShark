import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

// A widget that displays the picture taken by the user.
class ResultScreen extends StatelessWidget {
  final String imagePath;
  const ResultScreen({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.file(File(imagePath)),
            ],
          ),
          Container(
            height: 200,
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
                "NOT SHARK",
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
              margin: EdgeInsets.only(top: 160),
              child: Image.asset('assets/x.png'),
            ),
          )
        ],
      ),
    );
  }
}
