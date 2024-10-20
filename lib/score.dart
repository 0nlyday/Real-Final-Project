import 'package:flutter/material.dart';
import 'package:plantpursuit/main.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  // ตัวแปรเก็บคะแนนดาว เริ่มต้นที่ 0
  int _rating = 0;
  // ตัวแปรเก็บข้อความคำแนะนำ
  String _feedback = '';
  // ตัวควบคุมสำหรับช่องกรอกข้อความ
  final TextEditingController _feedbackController = TextEditingController();

  // สีของดาวที่ถูกเลือก - สีเหลืองเข้ม
  static const Color selectedStarColor = Color(0xFFFFD700);
  // สีของดาวที่ยังไม่ถูกเลือก
  static const Color unselectedStarColor = Colors.amber;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitAndNavigateBack(BuildContext context) {
    print('ส่งคะแนน: $_rating ดาว');
    print('คำแนะนำ: $_feedback');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ขอบคุณสำหรับคำแนะนำ'),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        // ใช้ Container แทน body เพื่อจัดการพื้นหลัง
        body: Container(
          // ตั้งค่าพื้นหลังด้วย BoxDecoration
          decoration: const BoxDecoration(
            // ใส่รูปภาพพื้นหลัง
            image: DecorationImage(
              // เปลี่ยน 'assets/background.jpg' เป็นที่อยู่ไฟล์รูปภาพของคุณ
              image: AssetImage('assets/background (4).png'),
              // ปรับขนาดรูปภาพให้เต็มพื้นที่
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            // เพิ่มเลเยอร์พื้นหลังสีขาวโปร่งใสเพื่อให้อ่านข้อความได้ง่ายขึ้น
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'โปรดให้คะแนนเรา',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              index < _rating ? Icons.star : Icons.star_border,
                              color: index < _rating 
                                  ? selectedStarColor 
                                  : unselectedStarColor,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_rating > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _feedbackController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'กรุณาใส่คำแนะนำของท่าน',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _feedback = value;
                            });
                          },
                        ),
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _rating > 0
                          ? () {
                              _submitAndNavigateBack(context);
                            }
                          : () {
                              // แจ้งเตือนให้ผู้ใช้เลือกดาวก่อน
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('กรุณาให้คะแนนก่อนส่ง'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _rating > 0 ? Colors.green : Colors.grey, // เปลี่ยนสีปุ่มตามเงื่อนไข
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'ส่ง',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
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
}
