import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'result_screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      globals.cameras[0],
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final scale = 1 /
                (_controller.value.aspectRatio *
                    MediaQuery.of(context).size.aspectRatio);
            return Stack(children: [
              Transform.scale(
                scale: scale,
                alignment: Alignment.topCenter,
                child: CameraPreview(_controller),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.only(bottom: 50),
                    padding: EdgeInsets.all(3),
                    child: OutlinedButton(
                      onPressed: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Attempt to take a picture and get the file `image`
                          // where it was saved.
                          final image = await _controller.takePicture();

                          // If the picture was taken, display it on a new screen.
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                // Pass the automatically generated path to
                                // the DisplayPictureScreen widget.
                                imagePath: image.path,
                              ),
                            ),
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(25),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(CircleBorder())),
                    ),
                  ),
                ],
              )
            ]);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
