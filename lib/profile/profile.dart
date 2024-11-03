import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/login/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

var selectedAvatar =
    "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png";

final List<String> myAvatar = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG7XbqR8lp73VCY-IDTydmyLpiSCLF7dCy_Q&usqp=CAU",
  "https://iconarchive.com/download/i59025/hopstarter/superhero-avatar/Avengers-Iron-Man.ico",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYHwAOQLyySbuK-Ptq2pJUPBaO2ja7dF-L_A&usqp=CAU",
  "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png"
];

const Color backGround = Color(0xFF092C28);
const Color circleColor = Color(0xFFAAC97B);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CustomPaint(
          size: Size.infinite,
          painter: DrawFig(),
        ),
        Positioned(
          top: height * 0.12,
          left: width * 0.10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sundhar Pichai",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey[200],
                    letterSpacing: 1.0),
              ),
              Text(
                "sundharpichai@gmail.com",
                style: TextStyle(color: Colors.grey[200], fontSize: 15),
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.15,
          right: width * 0.15,
          child: Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(selectedAvatar),
              radius: 50,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: height * 0.30,
          child: Column(
            children: [
              const MyListItem(
                icons: Icons.alternate_email,
                title: "Username",
                subtitle: "Sundhar Pichai",
              ),
              const MyListItem(
                icons: Icons.phone,
                title: "Phone",
                subtitle: "+91 7008740512",
              ),
              const MyListItem(
                icons: Icons.email_outlined,
                title: "E-mail",
                subtitle: "SundharPichai@gmail.com",
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
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
                        return const EditScreen();
                      },
                    ),
                  );
                },
                child: const MyListItem(
                  icons: Icons.edit,
                  title: "Edit Profie",
                  subtitle: "Update your details",
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
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
                        return const SignInPage();
                      },
                    ),
                  );
                },
                child: const MyListItem(
                  icons: Icons.login_outlined,
                  title: "Logout",
                  subtitle: "Naviagte to Login",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DrawFig extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(size.width * 0.20, size.height * 0.45),
          Offset(size.width * 0.50, size.height * 0.45),
          [backGround, backGround.withOpacity(0.9)]);
    var path = Path();
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.20, size.height * 0.25);
    path.relativeQuadraticBezierTo(47, 18, 100, -5);
    path.lineTo(size.width, size.height * 0.15);
    path.lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyListItem extends StatelessWidget {
  final IconData? icons;
  final String? title;
  final String? subtitle;

  const MyListItem(
      {super.key,
      required this.icons,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                color: backGround,
                width: 70,
                height: 70,
                child: Icon(icons, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title!,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(subtitle!, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _showAvatars() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
          child: Container(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: myAvatar.length,
              itemBuilder: (BuildContext ctx, index) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = myAvatar[index];
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(myAvatar[index]),
                        radius: 50,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: editFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _showAvatars,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(selectedAvatar),
                    radius: 50,
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 15.0,
                        child: Icon(
                          Icons.edit,
                          size: 15.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                MyEditListItem(
                  controller: usernameController,
                  labelText: "Name",
                  icon: Icons.person_rounded,
                  validator: null,
                  keyboard: null,
                ),
                MyEditListItem(
                  keyboard: null,
                  validator: null,
                  controller: passwordController,
                  labelText: "Password",
                  icon: Icons.vpn_key,
                  // validator: (String value) {
                  //   if (value.length < 4) {
                  //     return 'Please enter a password of at least 4 characters';
                  //   }
                  //   return null;
                  // },
                ),
                MyEditListItem(
                  controller: emailController,
                  labelText: "E-mail",
                  icon: Icons.email,
                  keyboard: TextInputType.emailAddress,
                  // validator: (String value) {
                  //   if (!value.contains("@")) {
                  //     return 'Please enter a valid email address';
                  //   }
                  //   return null;
                  // },
                  validator: null,
                ),
                MyEditListItem(
                  controller: phoneController,
                  labelText: "Phone No.",
                  icon: Icons.phone,
                  keyboard: TextInputType.phone,
                  // validator: (String value) {
                  //   if (value.length != 10) {
                  //     return 'Please enter a valid phone number';
                  //   }
                  //   return null;
                  // },
                  validator: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: backGround,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: backGround),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                              msg: "Profile not Updated",
                              toastLength: Toast.LENGTH_SHORT);
                        },
                        child: const Text("Cancel",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backGround,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          if (editFormKey.currentState!.validate()) {
                            Fluttertoast.showToast(
                                msg: "Profile Updated",
                                toastLength: Toast.LENGTH_SHORT);
                            Navigator.pop(context);
                          }
                        },
                        child:
                            const Text("Save", style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyEditListItem extends StatelessWidget {
  final IconData? icon;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboard;
  final TextEditingController? controller;

  const MyEditListItem({
    super.key,
    required this.icon,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: TextFormField(
        keyboardType: keyboard ?? TextInputType.text,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.grey[100],
          filled: true,
          prefixIcon: Icon(icon, color: backGround),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Color(0xFF29a329))),
          labelStyle: const TextStyle(color: Color(0xFFbfbfbf)),
        ),
      ),
    );
  }
}
