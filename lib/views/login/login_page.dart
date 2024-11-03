import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_car_service_ui/views/login/buttonbar.dart';
import 'package:gap/gap.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // Reduced padding
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                height: 250, // Reduced image height
                imageUrl:
                    "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg?t=st=1729069316~exp=1729072916~hmac=4dcd5d450ab6227ab7fc6307aa8b8f2ee6dd8054a51dc37e43c4ffdcb36cc443&w=740",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 20), // Reduced space
              const Text(
                'Sign in to your account',
                style: TextStyle(
                  color: Color(0xFF004643),
                  fontSize: 22, // Adjusted font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const ResumeTextField(title: "Email Address"),
              const SizedBox(height: 10), // Reduced space
              const ResumeTextField(title: "Password"),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {}, // Forgot password tap
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFF004643),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Reduced space
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: _isChecked,
                      activeColor: const Color(0xFF004643),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'I\'ve read and agreed to User Agreement and Privacy Policy',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              ResumeButton(
                buttonText: "Sign in",
                onPressed: () {
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
                        return const HomeScreen();
                      },
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     // type: PageTransitionType.leftToRightWithFade,
                  //     type: PageTransitionType.leftToRightWithFade,
                  //     alignment: Alignment.bottomCenter,
                  //     duration: const Duration(milliseconds: 900),
                  //     child: const HomeScreen(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 10), // Reduced space
            ],
          ),
        ),
      ),
    );
  }
}

class ResumeButton extends StatelessWidget {
  final String buttonText;
  void Function()? onPressed;

  ResumeButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF004643),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 100, vertical: 15), // Increased padding
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(buttonText),
    );
  }
}

class ResumeTextField extends StatelessWidget {
  final String title;

  const ResumeTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Enter your text here',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}
