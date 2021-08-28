import 'package:flutter/material.dart';
import 'dart:io';

// A widget that displays the picture taken by the user.
class ResultScreen extends StatelessWidget {
  final String imagePath;

  const ResultScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
