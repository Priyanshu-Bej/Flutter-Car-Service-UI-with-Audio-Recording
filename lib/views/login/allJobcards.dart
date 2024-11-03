import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/Recorder/record_play_audio.dart';
import 'package:flutter_car_service_ui/views/login/login_page.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Alljobcards extends StatefulWidget {
  const Alljobcards({super.key});

  @override
  _AlljobcardsState createState() => _AlljobcardsState();
}

class _AlljobcardsState extends State<Alljobcards> {
  bool isStartActive = false;
  bool isEndActive = false;
  bool isDoneActive = false;

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  // Future<void> _pickAndCropImage() async {
  //   // Pick an image
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     // Crop the image
  //     final croppedFile = await ImageCropper.cropImage(
  //         sourcePath: pickedFile.path,
  //         // aspectRatioPresets: [
  //         //   CropAspectRatioPreset.square,
  //         //   CropAspectRatioPreset.ratio3x2,
  //         //   CropAspectRatioPreset.original,
  //         //   CropAspectRatioPreset.ratio4x3,
  //         //   CropAspectRatioPreset.ratio16x9
  //         // ],
  //         // androidUiSettings: AndroidUiSettings(
  //         //     toolbarTitle: 'Cropper',
  //         //     toolbarColor: Colors.deepOrange,
  //         //     toolbarWidgetColor: Colors.white,
  //         //     initAspectRatio: CropAspectRatioPreset.original,
  //         //     lockAspectRatio: false),
  //         // iosUiSettings: IOSUiSettings(
  //         //   minimumAspectRatio: 1.0,
  //         // )
  //         );
  //     setState(() {
  //       if (croppedFile != null) {
  //         _image = XFile(croppedFile.path);
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Job Details',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                  height: 20.0), // Added top margin to avoid app bar overlap
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  // The background card for stack effect (slightly bigger)
                  Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: Container(
                      width: screenWidth * 0.85, // Responsive width
                      height: screenHeight * 0.55, // Responsive height
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                    ),
                  ),
                  // The main card
                  Container(
                    width: screenWidth * 0.9, // Responsive width
                    height: screenHeight * 0.55, // Responsive height
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/car-repair-maintenance-theme-mechanic-uniform-working-auto-service_627829-3918.jpg?semt=ais_hybrid',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: const Text(
                        'Job Details 1 - Lorem Epusm Lorem Epsum',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(150, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 40.0), // Added space between card and buttons
              // Row of Outlined Buttons

              const ResumeTextField(
                title: "Enter Customer Name",
              ),
              const Gap(15),
              const RecordPlayAudio(),

              const Gap(15),

              const Text(
                "Service Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSwitchTile(
                    'Start',
                    isStartActive,
                    Colors.green,
                    (value) => setState(() => isStartActive = value),
                  ),
                  _buildSwitchTile(
                    'Inprogress',
                    isEndActive,
                    Colors.orange[800]!,
                    (value) => setState(() => isEndActive = value),
                  ),
                  _buildSwitchTile(
                    'Done',
                    isDoneActive,
                    Colors.blue,
                    (value) => setState(() => isDoneActive = value),
                  ),
                ],
              ),

              const Gap(30),
              Center(
                child: ResumeButton(
                  onPressed: () {},
                  buttonText: "Submit",
                ),
              ),

              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
      String title, bool isActive, Color color, Function(bool) onChanged) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: isActive,
          onChanged: onChanged,
          activeTrackColor: color.withOpacity(0.3),
          activeColor: color,
          inactiveThumbColor: Colors.black54,
          inactiveTrackColor: Colors.grey.shade200,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? color : Colors.grey.shade600,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
