import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/homepage/homepage.dart';

class AllJobsCards extends StatefulWidget {
  const AllJobsCards({super.key});

  @override
  _AllJobsCardsState createState() => _AllJobsCardsState();
}

class _AllJobsCardsState extends State<AllJobsCards> {
  bool isDarkTheme = false;

  final items = [
    CardItem(
      title: 'Current Job Card',
      createdAt: 'Saturday, August 8, 2024',
      colors: [const Color(0xFF38ef7d), const Color(0xFF11998e)],
    ),
    CardItem(
      title: 'Next Job Card',
      createdAt: 'Monday, October 17, 2024',
      colors: [const Color(0xFFFC5C7D), const Color(0xFF6A82FB)],
    ),
    CardItem(
      title: 'Drawing Room Design',
      createdAt: 'Saturday, August 8, 2024',
      colors: [const Color(0xFF38ef7d), const Color(0xFF11998e)],
    ),
    CardItem(
      title: 'Bedroom Design',
      createdAt: 'Monday, October 17, 2024',
      colors: [const Color(0xFFFC5C7D), const Color(0xFF6A82FB)],
    ),
    CardItem(
      title: 'Andromeda Structure',
      createdAt: 'Friday, January 4, 2024',
      colors: [const Color(0xFFff9966), const Color(0xFFff5e62)],
    ),
    CardItem(
      title: 'Hypercar Design',
      createdAt: 'Sunday, March 28, 2024',
      colors: [const Color(0xFFad5389), const Color(0xFF3c1053)],
    ),
    CardItem(
      title: 'P90 Skin',
      createdAt: 'Tuesday, February 22, 2024',
      colors: [const Color(0xFF8360c3), const Color(0xFF2ebf91)],
    ),
    CardItem(
      title: 'Wall Art',
      createdAt: 'Thursday, November 7, 2024',
      colors: [const Color(0xFFf953c6), const Color(0xFFb91d73)],
    ),
    CardItem(
      title: 'Spaceship Canvas',
      createdAt: 'Monday, April 11, 2024',
      colors: [const Color(0xFFFFD657), const Color(0xFFFFA453)],
    ),
    CardItem(
      title: 'Desk Design',
      createdAt: 'Friday, May 31, 2024',
      colors: [const Color(0xFFeaafc8), const Color(0xFF654ea3)],
    ),
    CardItem(
      title: 'Chair Design',
      createdAt: 'Wednesday, June 24, 2024',
      colors: [const Color(0xFF00c6ff), const Color(0xFF0072ff)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          'All Jobs Card',
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 17,
            )),
      ),
      body: Center(
        child: SizedBox(
          width: 360, // Increased the size for a bigger card
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardView(item: items[index]),
                        const SizedBox(height: 20), // Space between cards
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
