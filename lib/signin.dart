import 'package:flutter/material.dart';
import 'register.dart'; // นำเข้า RegisterPage
import 'package:plantpursuit/main.dart'; // นำเข้า MyApp สำหรับการนำทางกลับ
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import for JSON decoding

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Add a form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> Login() async {
    var url = "http://10.50.16.80/backEnd/signin.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Login Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background (4).png'), // ภาพพื้นหลัง
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ปุ่มย้อนกลับ
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child:
                              const Icon(Icons.arrow_back, color: Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                            (route) => false,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ฟอร์มลงชื่อเข้าใช้
                    Form(
                      key: formKey, // Add formKey here
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                                'Email/Phone number', emailController),
                            const SizedBox(height: 10),
                            _buildTextField('Password', passwordController,
                                isPassword: true),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 350,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4CAF50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                onPressed: () {
                                  // Validate form using the formKey
                                  if (formKey.currentState!.validate()) {
                                    Login();
                                  } else {
                                    Fluttertoast.showToast(
                                      msg:
                                          "Please fill in all fields correctly",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 15)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()),
                                );
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4CAF50),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}


//   // ฟังก์ชันจัดการการลงชื่อเข้าใช้
//   void _handleSignIn() {
//     final email = emailController.text;
//     final password = passwordController.text;

//     if (email.isEmpty || password.isEmpty) {
//       _showSnackBar('กรุณากรอกอีเมล/เบอร์โทรศัพท์และรหัสผ่าน');
//     } else {
//       // สมมติว่าการลงชื่อเข้าใช้สำเร็จ
//       _showSnackBar('ลงชื่อเข้าใช้สำเร็จ!');

//       // นำทางไปที่หน้า MyApp หลังจากลงชื่อเข้าใช้สำเร็จ
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => const MyApp()),
//         (route) => false, // ลบเส้นทางทั้งหมดที่ค้างไว้
//       );
//     }
//   }

//   // ฟังก์ชันแสดง Snackbar
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
// }