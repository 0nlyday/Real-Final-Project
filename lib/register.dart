import 'package:flutter/material.dart';
import 'package:plantpursuit/main.dart';
import 'signin.dart';  // For navigating to Sign In page
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // Import for JSON decoding

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  // TextEditingController for capturing email and password input
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Registration function to send data to backend
  Future register(BuildContext context) async {
  var url = "http://192.168.20.69/backEnd/register.php"; // Backend URL

  try {
    // HTTP POST request to the server with user input
    var response = await http.post(Uri.parse(url), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    if (response.statusCode == 200) {
      // Decode JSON response from the server
      var data = json.decode(response.body);

      if (data['error'] != null) {
        Fluttertoast.showToast(
          msg: data['error'],  // Show error message
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Register Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),  // Replace with your home page widget
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Failed to register. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  } catch (e) {
    Fluttertoast.showToast(
      msg: "Error: $e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background 6.png'),  // Background image
          fit: BoxFit.cover,  // Fit image to the screen
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(50.0),  // Padding around the form
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register For',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4CAF50),  // Green text color
              ),
            ),
            const SizedBox(height: 30),

            // Form widget to validate input fields
            Form(
              key: formKey,
              child: Column(
                children: [
                  // Email/Phone Number input field
                  Container(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email/Your number',
                        filled: true,
                        fillColor: Colors.grey[300],  // Grey background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,  // No border
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email/phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Password input field
                  Container(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,  // Hide password
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Confirm Password input field
                  Container(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            // Register button
            SizedBox(
              height: 55,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),  // Green button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await register(context);  // Call the register function
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign In button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),  // Navigate to Sign In page
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}