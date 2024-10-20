import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantpursuit/list_plant.dart';
import 'package:plantpursuit/showdata.dart';
import 'package:plantpursuit/signin.dart';
import 'package:tflite_v2/tflite_v2.dart'; // นำเข้า TFLite สำหรับการใช้งานโมเดล

// ignore: duplicate_import
import 'fav.dart';
// ignore: duplicate_import
import 'signin.dart';
import 'register.dart'; // Import the RegisterPage

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ตรวจสอบให้แน่ใจว่า Flutter Binding ได้ถูกตั้งค่า
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'PlantPursuit',
      theme: ThemeData(
        primarySwatch: Colors.green, // Primary color for the app's theme
        scaffoldBackgroundColor: const Color.fromRGBO(
            234, 248, 231, 1.000), // Background color for all screens
      ),
      home: const PlantPursuitPage(), // Set the home screen of the app
    );
  }
}

// Stateful widget for the main PlantPursuit page
class PlantPursuitPage extends StatefulWidget {
  const PlantPursuitPage({Key? key}) : super(key: key);

  @override
  _PlantPursuitPageState createState() => _PlantPursuitPageState();
}

// State class for PlantPursuitPage
class _PlantPursuitPageState extends State<PlantPursuitPage> {
  int _selectedIndex = 0; // Index for the BottomNavigationBar's selected item

  @override
  void initState() {
    super.initState();
    loadModels(); // โหลดโมเดลเมื่อเริ่มต้น
  }

  Future<void> loadModels() async {
    await Tflite.loadModel(
      model: "assets/mobilenet_model.tflite",
      labels: "assets/label.txt",
      isAsset: true,
    );

    await Tflite.loadModel(
      model: "assets/densenet_model.tflite",
      labels: "assets/label.txt",
      isAsset: true,
    );

    await Tflite.loadModel(
      model: "assets/xception_model.tflite",
      labels: "assets/label.txt",
      isAsset: true,
    );

    await Tflite.loadModel(
      model: "assets/nasnet_model.tflite",
      labels: "assets/label.txt",
      isAsset: true,
    );

    await Tflite.loadModel(
      model: "assets/mobilenetv2_model.tflite",
      labels: "assets/label.txt",
      isAsset: true,
    );

    print("All models loaded successfully!"); // แจ้งเตือนเมื่อโหลดโมเดลเสร็จ
  }

  @override
  void dispose() {
    Tflite.close(); // ปิดโมเดลเมื่อไม่ใช้งาน
    super.dispose();
  }

  void _openSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListPlant()), // Navigate to ListPlant
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.eco),
        title: const Text('PlantPursuit'), // Title in the AppBar
        backgroundColor: const Color.fromRGBO(
            78, 167, 113, 1.000), // Background color of the AppBar
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background (2).png'), // Set the background image from assets
                fit: BoxFit.cover, // Make the image cover the entire background
              ),
            ),
          ),
          // Main content on top of the background image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                    Icons.search,
                    'รายการผัก',
                    () => _openSearchPage(context)), // Button to open search page
                const SizedBox(height: 20), // Spacing between buttons
                _buildButton(Icons.camera_alt, 'กล้อง',
                    () => _openCamera(context)), // Button to open camera
                const SizedBox(height: 20), // Spacing between buttons
                _buildButton(Icons.image, 'แกลลอรี่',
                    () => _openGallery(context)), // Button to open gallery
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'หน้าหลัก'), // Home tab
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'ชื่นชอบ'), // Favorites tab
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'โปรไฟล์'), // Profile tab
        ],
        currentIndex: _selectedIndex, // Set the selected tab index
        selectedItemColor:
            Color.fromRGBO(78, 167, 113, 1.000), // Color of the selected item
        onTap: (index) => _onItemTapped(index, context), // Handle tab selection
      ),
    );
  }

  // Method to build a button with an icon and label
  Widget _buildButton(IconData icon, String label, VoidCallback onPressed) {
    return SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        icon: Icon(icon), // Button icon
        label: Text(label), // Button label
        onPressed: onPressed, // Button press action
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              vertical: 15), // Padding inside the button
          backgroundColor: const Color.fromRGBO(
              78, 167, 113, 1.000), // Button background color
          foregroundColor:
              const Color.fromRGBO(255, 255, 255, 1), // Button text color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30), // Rounded corners for the button
          ),
        ),
      ),
    );
  }

  

  // Method to open the search dialog
// void _openSearchPage(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('ค้นหาพืช'), // Title of the search dialog
//         content: TextField(
//           decoration: const InputDecoration(
//               hintText: 'พิมพ์ชื่อพืชที่ต้องการค้นหา'), // Input field hint
//           onSubmitted: (String value) {
//             Navigator.of(context).pop(); // Close the dialog
//             _showSnackBar('กำลังค้นหา: $value'); // Show a snackbar with the search term

//             // Navigate to the ShowDataScreen with the search term as parameter
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ListPlant(),
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
// }


  // Method to open the camera and capture an image
  void _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      // ถ่ายภาพสำเร็จ เรียกใช้ฟังก์ชันจำแนกประเภท
      _showSnackBar('ถ่ายภาพสำเร็จ');
      classifyImage(photo.path); // เรียกฟังก์ชันจำแนกประเภท
    }
  }

  // Method to open the gallery and pick an image
  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // เลือกรูปภาพสำเร็จ เรียกใช้ฟังก์ชันจำแนกประเภท
      _showSnackBar('เลือกรูปภาพสำเร็จ');
      classifyImage(image.path); // เรียกฟังก์ชันจำแนกประเภท
    }
  }

  // Method to classify the image
  Future<void> classifyImage(String imagePath) async {
    List<Map<String, dynamic>> results = [];

    List<String> modelNames = [
      'MobileNet',
      'DenseNet',
      'Xception',
      'NASNet',
      'MobileNetV2'
    ];

    for (var model in modelNames) {
      await Tflite.loadModel(
        model: "assets/${model.toLowerCase()}_model.tflite",
        labels: "assets/label.txt",
        isAsset: true,
      );

      var recognitions = await Tflite.runModelOnImage(
        path: imagePath,
        numResults: 1,
        threshold: 0.5,
        asynch: true,
      );

      if (recognitions != null && recognitions.isNotEmpty) {
        results.add({
          'model': model,
          'label': recognitions[0]['label'],
          'confidence': recognitions[0]['confidence'],
        });
      }
    }

    _showResultDialog(results);
  }

  // Method to show the result dialog with images
  void _showResultDialog(List<Map<String, dynamic>> results) {
    String formatAssetLabel(String label) {
      // Replace spaces with underscores
      String formattedLabel = label.toLowerCase().replaceAll(' ', '_');

      // Optionally, replace or remove other special characters if necessary
      formattedLabel = formattedLabel.replaceAll('(', '').replaceAll(')', '');

      return formattedLabel;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ผลการจำแนกประเภท'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: results.map((result) {
                // แปลง label ให้เป็นชื่อไฟล์
                String fileName = result['label']
                        .toLowerCase()
                        .replaceAll(' ', '_')
                        .replaceAll('(', '')
                        .replaceAll(')', '') +
                    '.jpg';

                print('Generated filename: $fileName'); // Debug

                return Column(
                  children: [
                    Text('${result['model']} Results:'),
                    Text(
                        '${result['label']}: ${(result['confidence'] * 100).toStringAsFixed(2)}%'),
                    Image.asset(
                      'assets/pic/$fileName',
                      height: 150,
                      width: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return Column(
                          children: [
                            Text('Image not found: $fileName'), // Debug
                            Text(error.toString()), // Debug
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ปิด'),
            ),
          ],
        );
      },
    );
  }

  // Method to show snackbar
  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// ฟังก์ชันจัดการเมื่อแตะแท็บใน BottomNavigationBar
  void _onItemTapped(int index, BuildContext context) {
    if (index == 1) {
      // นำทางไปยังหน้า FavoritePage เมื่อกดที่ 'ชื่นชอบ'
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritePage()));
    } else if (index == 2) {
      // นำทางไปยังหน้า SignInPage เมื่อกดที่ 'โปรไฟล์'
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignInPage()));
    }
    setState(() {
      _selectedIndex = index; // อัปเดตค่าของแท็บที่เลือก
    });
  }
}
