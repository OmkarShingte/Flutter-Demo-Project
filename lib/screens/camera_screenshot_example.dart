import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:first/screens/aatma/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart' as img;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class CameraScreenshotExample extends StatefulWidget {
  const CameraScreenshotExample({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraScreenshotState createState() => CameraScreenshotState();
}

class CameraScreenshotState extends State<CameraScreenshotExample> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final _ssController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: CameraWidget(),
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(2),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget CameraWidget() => Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 100),
            child: Stack(
              children: [
                Container(
                  child: CameraPreview(_controller),
                  height: double.maxFinite,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    color: Color.fromRGBO(50, 50, 50, 0.5),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 80,
                          height: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pune, Maharashtra, India",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                                "Yash classic, Pashan, \nPune, Maharashtra, 411021, India",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            Text("Lat 18.4323239",
                                style: TextStyle(color: Colors.white)),
                            Text("Long 75.23653467",
                                style: TextStyle(color: Colors.white)),
                            Text("30/10/23 12.55 PM GMT +05:30",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () async {
                  final image =
                      await _ssController.captureFromWidget(CameraWidget());
                  if (image == null) return;
                  var path = await saveImage(image);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DisplayPictureScreen(imagePath: path),
                      ));
                },
                child: const Icon(Icons.camera_alt),
              ),
            ),
          )
        ],
      );

  saveImage(Uint8List image) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot-$time';
    final result = await ImageGallerySaver.saveImage(image, name: name);
    return image;
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final Uint8List imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    CustomToast().customToast("Image Saved Successfully");
    return Scaffold(
        appBar: AppBar(title: const Text('Display the Picture')),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              Image.memory(imagePath),
            ],
          ),
        ));
  }
}
