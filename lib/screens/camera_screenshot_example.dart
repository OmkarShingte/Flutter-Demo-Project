import 'dart:async';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:first/screens/aer/screens/image_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../common/geocoding_common_function.dart';
import '../provider/monitoring_provider.dart';
import 'package:intl/intl.dart';

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
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  final _screenshotController = ScreenshotController();
  var latitude = 0.0;
  var longitude = 0.0;
  String address = "";

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ChangeNotifierProvider(
        create: (context) => MonitoringProvider(),
        child: Consumer<MonitoringProvider>(
          builder: (context, zzz, child) => FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Expanded(child: cameraOrPhoto(provider: zzz)),
                    Container(
                      color: Colors.black,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child:
                          captureOrRecapture(context: context, provider: zzz),
                    )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget cameraOrPhoto({required MonitoringProvider provider}) =>
      provider.isCamera
          ? CustomCameraWidget()
          : Image.memory(
              fit: BoxFit.fill,
              provider.imageUnit,
              width: double.infinity,
            );

  Widget captureOrRecapture(
      {required BuildContext context, required MonitoringProvider provider}) {
    return provider.isCamera
        ? Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: provider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : GestureDetector(
                        child: Icon(
                          Icons.camera_sharp,
                          color: Colors.white,
                          size: 50,
                        ),
                        onTap: () async {
                          provider.isLoading = true;
                          provider.imageUnit =
                              await _screenshotController.captureFromWidget(
                                  cameraOrPhoto(provider: provider));
                          if (provider.imageUnit == null) return;
                          provider.isLoading = false;
                          provider.isCamera = false;
                        },
                      ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 50,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        : Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                    onTap: () {
                      provider
                          .uploadImage(imagePath: provider.imageUnit)
                          .then((value) {
                        if (value) {
                          // ShowMessage.show("Image Uploaded Successfully",
                          //     bgColor: AppColors().successBGColor);
                          saveImage(provider.imageUnit);
                          // Navigator.pop(context);
                        }
                      });
                    }),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 50,
                  ),
                  onTap: () {
                    provider.isCamera = true;
                  },
                ),
              ),
            ],
          );
  }

  Widget CustomCameraWidget() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    String formattedTimeZone = now.timeZoneName;
    // final pref = locator<Preferences>();
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: CameraPreview(_cameraController),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            color: Color.fromRGBO(50, 50, 50, 0.5),
            child: Row(
              children: [
                Image.asset(
                  ImagePath.mapImage,
                  width: 80,
                  height: 80,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("userName!", style: textStyle(14)),
                      Container(
                        width: 200,
                        child: Text(address, style: textStyle(12)),
                      ),
                      Text("Lat : $latitude", style: textStyle(12)),
                      Text("Long : $longitude", style: textStyle(12)),
                      Text("$formattedTimeZone $formattedTime $formattedDate",
                          style: textStyle(12)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextStyle textStyle(double size) =>
      TextStyle(color: Colors.white, fontSize: size);

  void getLocation() async {
    await [
      Permission.location,
      Permission.locationAlways,
      Permission.locationWhenInUse
    ].request();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    var tempAddress = await CommonGeoCoding()
        .convertInAddress(lat: position.latitude, lng: position.longitude);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      address = tempAddress;
    });
  }

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
