import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/login/allJobcards.dart';
import 'package:flutter_car_service_ui/views/login/customAppbar.dart';
import 'package:gap/gap.dart';

class CardItem {
  final String title;
  final String createdAt;
  final List<Color> colors;

  CardItem(
      {required this.title, required this.createdAt, required this.colors});
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 360, // Increased the size for a bigger card
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppBarCustomCurved(),
                // const Gap(10),
                // Show two cards in a column
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

class CardView extends StatelessWidget {
  final CardItem item;

  const CardView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, 10.0),
              blurRadius: 20.0,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomSheetTheme.backgroundColor,
          ),
          width: 350, // Increased width for a bigger card
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation,
                        Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.easeInToLinear);
                      return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation) {
                      return const Alljobcards();
                    },
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: item.colors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -140,
                            left: -200,
                            child: Text(
                              item.title.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                                fontSize: 300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item.createdAt,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation,
                                Widget child) {
                              animation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInToLinear);
                              return ScaleTransition(
                                scale: animation,
                                alignment: Alignment.center,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return const Alljobcards();
                            },
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // const InkWell(
                          //   highlightColor: Colors.transparent,
                          //   splashColor: Colors.transparent,
                          //   focusColor: Colors.transparent,
                          //   hoverColor: Colors.transparent,
                          //   // onTap: () => setState(() =>
                          //   //     selectedIndex = (selectedIndex - 1) % items.length),
                          //   child: Text(
                          //     '',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.grey),
                          //   ),
                          // ),
                          // const SizedBox(width: 8),
                          // Container(height: 16, width: 1, color: Colors.grey),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            // onTap: () => setState(() =>
                            //     selectedIndex = (selectedIndex + 1) % items.length),
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[800]),
                            ),
                          ),
                          const Gap(5),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Colors.teal[800]!,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
