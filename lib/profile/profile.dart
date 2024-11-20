import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/profile/edit_profile.dart';
import 'package:flutter_car_service_ui/views/login/login_page.dart';

var selectedAvatar =
    "https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png";

const Color primaryColor = Color(0xFF092C28);
const Color secondaryColor = Color(0xFFAAC97B);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header

            Container(
              height: height * 0.35,
              width: 355,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(selectedAvatar),
                    radius: 60,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Sundhar Pichai",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "sundharpichai@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile Details
            Column(
              children: [
                const MyListItem(
                  icon: Icons.person,
                  title: "Username",
                  subtitle: "Sundhar Pichai",
                ),
                const MyListItem(
                  icon: Icons.phone,
                  title: "Phone",
                  subtitle: "+91 7008740512",
                ),
                const MyListItem(
                  icon: Icons.email,
                  title: "Email",
                  subtitle: "sundharpichai@gmail.com",
                ),
                MyListItem(
                  icon: Icons.edit,
                  title: "Edit Profile",
                  subtitle: "Update your details",
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionsBuilder: (context, animation, _, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.easeInOut);
                          return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.center,
                            child: child,
                          );
                        },
                        pageBuilder: (context, _, __) => const EditScreen(),
                      ),
                    );
                  },
                ),
                MyListItem(
                  icon: Icons.logout,
                  title: "Logout",
                  subtitle: "Navigate to Login",
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        transitionsBuilder: (context, animation, _, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.easeInOut);
                          return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.center,
                            child: child,
                          );
                        },
                        pageBuilder: (context, _, __) => const SignInPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const MyListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}


//Another Design 
// import 'package:flutter/material.dart';
// import 'package:flutter_car_service_ui/profile/edit_profile.dart';
// import 'package:flutter_car_service_ui/views/login/login_page.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'dart:ui' as ui;

// var selectedAvatar =
//     "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png";

// final List<String> myAvatar = [
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG7XbqR8lp73VCY-IDTydmyLpiSCLF7dCy_Q&usqp=CAU",
//   "https://iconarchive.com/download/i59025/hopstarter/superhero-avatar/Avengers-Iron-Man.ico",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYHwAOQLyySbuK-Ptq2pJUPBaO2ja7dF-L_A&usqp=CAU",
//   "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png"
// ];

// const Color backGround = Color(0xFF092C28);
// const Color circleColor = Color(0xFFAAC97B);

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Stack(
//       children: [
//         CustomPaint(
//           size: Size.infinite,
//           painter: DrawFig(),
//         ),
//         Positioned(
//           top: height * 0.12,
//           left: width * 0.10,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Sundhar Pichai",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                     color: Colors.grey[200],
//                     letterSpacing: 1.0),
//               ),
//               Text(
//                 "sundharpichai@gmail.com",
//                 style: TextStyle(color: Colors.grey[200], fontSize: 15),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: height * 0.15,
//           right: width * 0.15,
//           child: Center(
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(selectedAvatar),
//               radius: 50,
//             ),
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           top: height * 0.30,
//           child: Column(
//             children: [
//               const MyListItem(
//                 icons: Icons.alternate_email,
//                 title: "Username",
//                 subtitle: "Sundhar Pichai",
//               ),
//               const MyListItem(
//                 icons: Icons.phone,
//                 title: "Phone",
//                 subtitle: "+91 7008740512",
//               ),
//               const MyListItem(
//                 icons: Icons.email_outlined,
//                 title: "E-mail",
//                 subtitle: "SundharPichai@gmail.com",
//               ),
//               InkWell(
//                 borderRadius: BorderRadius.circular(30),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(milliseconds: 500),
//                       transitionsBuilder: (BuildContext context,
//                           Animation<double> animation,
//                           Animation<double> secAnimation,
//                           Widget child) {
//                         animation = CurvedAnimation(
//                             parent: animation, curve: Curves.easeInToLinear);
//                         return ScaleTransition(
//                           scale: animation,
//                           alignment: Alignment.center,
//                           child: child,
//                         );
//                       },
//                       pageBuilder: (BuildContext context,
//                           Animation<double> animation,
//                           Animation<double> secAnimation) {
//                         return const EditScreen();
//                       },
//                     ),
//                   );
//                 },
//                 child: const MyListItem(
//                   icons: Icons.edit,
//                   title: "Edit Profie",
//                   subtitle: "Update your details",
//                 ),
//               ),
//               InkWell(
//                 borderRadius: BorderRadius.circular(30),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(milliseconds: 500),
//                       transitionsBuilder: (BuildContext context,
//                           Animation<double> animation,
//                           Animation<double> secAnimation,
//                           Widget child) {
//                         animation = CurvedAnimation(
//                             parent: animation, curve: Curves.easeInToLinear);
//                         return ScaleTransition(
//                           scale: animation,
//                           alignment: Alignment.center,
//                           child: child,
//                         );
//                       },
//                       pageBuilder: (BuildContext context,
//                           Animation<double> animation,
//                           Animation<double> secAnimation) {
//                         return const SignInPage();
//                       },
//                     ),
//                   );
//                 },
//                 child: const MyListItem(
//                   icons: Icons.login_outlined,
//                   title: "Logout",
//                   subtitle: "Naviagte to Login",
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class DrawFig extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..shader = ui.Gradient.linear(
//           Offset(size.width * 0.20, size.height * 0.45),
//           Offset(size.width * 0.50, size.height * 0.45),
//           [backGround, backGround.withOpacity(0.9)]);
//     var path = Path();
//     path.lineTo(0, size.height * 0.20);
//     path.lineTo(size.width * 0.20, size.height * 0.25);
//     path.relativeQuadraticBezierTo(47, 18, 100, -5);
//     path.lineTo(size.width, size.height * 0.15);
//     path.lineTo(size.width, 0);

//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class MyListItem extends StatelessWidget {
//   final IconData? icons;
//   final String? title;
//   final String? subtitle;

//   const MyListItem(
//       {super.key,
//       required this.icons,
//       required this.title,
//       required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           height: 70,
//           color: Colors.white,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 color: backGround,
//                 width: 70,
//                 height: 70,
//                 child: Icon(icons, color: Colors.white),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(title!,
//                         style: const TextStyle(fontWeight: FontWeight.bold)),
//                     Text(subtitle!, style: const TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
