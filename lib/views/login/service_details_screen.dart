import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/Recorder/record_play_audio.dart';
import 'package:flutter_car_service_ui/views/login/login_page.dart';
import 'package:gap/gap.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  bool isStartActive = false;
  bool isInProgressActive = false;
  bool isDoneActive = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Gap(20),
              // Image section with title
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.55,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
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
                        'Car Servicing - Job ID: 12345',
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
              const Gap(30),

              // Job Details Section
              const Text(
                "Job Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const _DetailRow(
                icon: Icons.calendar_today_outlined,
                label: "Scheduled Date",
                value: "Saturday, August 8, 2024",
              ),
              const _DetailRow(
                icon: Icons.access_time,
                label: "Estimated Time",
                value: "3 hours",
              ),
              const _DetailRow(
                icon: Icons.car_repair,
                label: "Service Type",
                value: "Engine Repair",
              ),
              const _DetailRow(
                icon: Icons.currency_rupee,
                label: "Estimated Cost",
                value: "₹2500",
              ),
              const Gap(20),

              // Input Section
              const ResumeTextField(
                title: "Enter Customer Name",
              ),
              const Gap(15),
              const ResumeTextField(
                title: "Enter Car Model",
              ),
              const Gap(15),

              // Audio Recording Section
              const Text(
                "Record Notes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const RecordPlayAudio(),
              const Gap(20),

              // Service Status Section
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
                    'In Progress',
                    isInProgressActive,
                    Colors.orange,
                    (value) => setState(() => isInProgressActive = value),
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

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit action here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const Gap(20),
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

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 20),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
