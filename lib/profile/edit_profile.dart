import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

  File? _selectedImage;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
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
                  onTap: _pickImageFromGallery,
                  child: CircleAvatar(
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!) as ImageProvider
                        : const NetworkImage('https://via.placeholder.com/150'),
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
                ),
                MyEditListItem(
                  controller: emailController,
                  labelText: "E-mail",
                  icon: Icons.email,
                  keyboard: TextInputType.emailAddress,
                  validator: null,
                ),
                MyEditListItem(
                  controller: phoneController,
                  labelText: "Phone No.",
                  icon: Icons.phone,
                  keyboard: TextInputType.phone,
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
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
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
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          if (editFormKey.currentState!.validate()) {
                            // Handle saving profile logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Profile Updated")),
                            );
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
          prefixIcon: Icon(icon, color: Colors.grey),
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
