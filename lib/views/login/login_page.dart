import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_car_service_ui/views/login/buttonbar.dart';
import 'package:gap/gap.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   bool _isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 1,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // Illustration Image
//               Center(
//                 child: CachedNetworkImage(
//                   height: 200,
//                   imageUrl:
//                       "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg?t=st=1729069316~exp=1729072916~hmac=4dcd5d450ab6227ab7fc6307aa8b8f2ee6dd8054a51dc37e43c4ffdcb36cc443&w=740",
//                   placeholder: (context, url) =>
//                       const CircularProgressIndicator(),
//                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                 ),
//               ),
//               const Gap(20),

//               // Title
//               const Text(
//                 'Sign in to your account',
//                 style: TextStyle(
//                   color: Color(0xFF004643),
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const Gap(20),

//               // Email Field
//               const ResumeTextField(title: "Email Address"),
//               const Gap(15),

//               // Password Field
//               const ResumeTextField(title: "Password"),
//               const Gap(10),

//               // Forgot Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () {
//                     // Forgot password action
//                   },
//                   child: const Text(
//                     'Forgot password?',
//                     style: TextStyle(
//                       color: Color(0xFF004643),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               const Gap(20),

//               // Checkbox for Agreement
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Transform.scale(
//                     scale: 1.2,
//                     child: Checkbox(
//                       value: _isChecked,
//                       activeColor: const Color(0xFF004643),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _isChecked = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   const Expanded(
//                     child: Text(
//                       'I agree to the Terms of Service and Privacy Policy.',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Gap(20),

//               // Sign In Button
//               Center(
//                 child: ResumeButton(
//                   buttonText: "Sign In",
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         transitionDuration: const Duration(milliseconds: 500),
//                         transitionsBuilder: (BuildContext context,
//                             Animation<double> animation,
//                             Animation<double> secAnimation,
//                             Widget child) {
//                           animation = CurvedAnimation(
//                               parent: animation, curve: Curves.easeInToLinear);
//                           return ScaleTransition(
//                             scale: animation,
//                             alignment: Alignment.center,
//                             child: child,
//                           );
//                         },
//                         pageBuilder: (BuildContext context,
//                             Animation<double> animation,
//                             Animation<double> secAnimation) {
//                           return const HomeScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const Gap(10),

//               // Register Option
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     // Navigate to Register Page
//                   },
//                   child: RichText(
//                     text: const TextSpan(
//                       text: "Don't have an account? ",
//                       style: TextStyle(color: Colors.grey, fontSize: 14),
//                       children: [
//                         TextSpan(
//                           text: "Register",
//                           style: TextStyle(
//                             color: Color(0xFF004643),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const Gap(20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore_for_file: prefer_const_constructors, unnecessary_new

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController studentidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoggedIn = false;
  bool showPass = true;

  FocusNode studentNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  ThemeData appTheme() {
    return ThemeData(
      primaryColor: Color(0xFF003366), // Vibrant green color
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF003366),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFF003366),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF4CAF50),
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF4CAF50)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme(),
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   forceMaterialTransparency: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Image.asset("assets/images/logo.png",
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Welcome\nManage Your Service Tasks and Appointments",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: appTheme().textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Sign in to your account",
                  textAlign: TextAlign.start,
                  style:
                      appTheme().textTheme.displayLarge!.copyWith(fontSize: 14),
                ),
                SizedBox(height: 20),
                MyTextField(
                    hintText: "Email",
                    focusNode: studentNode,
                    controller: studentidController,
                    keyboardtype: TextInputType.text,
                    prefixIcon:
                        Icon(Icons.directions_car, color: Colors.black54),
                    obscureText: false,
                    click: () {}),
                SizedBox(height: 5),
                MyTextField(
                    hintText: "Password",
                    focusNode: passwordNode,
                    prefixIcon: Icon(Icons.lock, color: Colors.black54),
                    controller: passwordController,
                    obscureText: showPass,
                    suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        }),
                    click: () {}),
                SizedBox(height: 40),
                MyButton(
                  btnName: "Sign in",
                  isLoading: false,
                  click: () async {
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
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      // Navigation logic for forgotten password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              // Navigation logic for sign-up page
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    // Navigation logic for registration page
                  },
                  child: Text(
                    'Register here!',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF003366),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResumeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const ResumeButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

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
            horizontal: 80, vertical: 15), // Adjusted
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
          obscureText: title == "Password", // Add password masking
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Enter your $title',
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

// import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   final String btnName;
//   final VoidCallback click;
//   final double? height;
//   final double? width;
//   final bool? isLoading;
//   final bool showIcon;
//   final IconData? icon;
//   final Color color;

//   const MyButton({
//     super.key,
//     required this.btnName,
//     required this.click,
//     this.height,
//     this.width,
//     this.isLoading = false,
//     this.showIcon = true,
//     this.icon,
//     this.color = const Color(0xFF3457D5),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (!isLoading!) {
//           click();
//         }
//       },
//       child: Container(
//         height: height ?? 65,
//         width: width ?? double.infinity,
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               offset: Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Center(
//           child: isLoading!
//               ? const Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       btnName,
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                     ),
//                     if (showIcon && icon != null) ...[
//                       const SizedBox(width: 8),
//                       Icon(
//                         icon,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ],
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

class MyButton extends StatelessWidget {
  final String btnName;
  final VoidCallback click;
  final double? height;
  final double? width;
  final bool? isLoading;
  final bool showIcon;
  final IconData? icon;
  final Color color;

  const MyButton({
    super.key,
    required this.btnName,
    required this.click,
    this.height,
    this.width,
    this.isLoading = false,
    this.showIcon = true,
    this.icon,
    this.color = const Color(0xFF3457D5),
  });

  @override
  Widget build(BuildContext context) {
    // Set default height if not provided
    final buttonHeight = height ?? 65.0;

    // Adjust padding based on height, with a reasonable ratio
    final verticalPadding =
        buttonHeight * 0.25; // Adjusts padding based on height

    // Adjust font size dynamically
    final fontSize =
        buttonHeight * 0.25; // Sets font size to be proportional to height

    return InkWell(
      onTap: () {
        if (!isLoading!) {
          click();
        }
      },
      child: Container(
        height: buttonHeight,
        width: width ?? double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding), // Dynamically adjusted padding
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(
              buttonHeight * 0.3)), // Adjust border radius based on height
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: isLoading!
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      btnName,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize:
                                fontSize, // Dynamically adjusted font size
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                    if (showIcon && icon != null) ...[
                      const SizedBox(width: 8),
                      Icon(
                        icon,
                        color: Colors.white,
                        size: fontSize *
                            1.25, // Adjust icon size based on font size
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final int? maxLength;
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardtype;
  final bool hideTextfild;
  final VoidCallback click;
  final bool? enabled;
  final FocusNode? focusNode;
  double textfieldBorderRadius;

  MyTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.focusNode,
    this.suffixIcon,
    this.textfieldBorderRadius = 20,
    this.keyboardtype = TextInputType.text,
    this.hideTextfild = false,
    required this.click,
    this.controller,
    required this.obscureText,
    this.validator,
    this.maxLength,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(textfieldBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        enabled: enabled,
        focusNode: focusNode,
        keyboardType: keyboardtype,
        maxLength: maxLength,
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.circular(textfieldBorderRadius),
          ),
        ),
      ),
    );
  }
}
