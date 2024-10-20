import 'package:flutter/material.dart';
import 'package:plantpursuit/ingredient.dart';
import 'package:plantpursuit/main.dart';
import 'package:plantpursuit/score.dart';

class HowtoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8E4D8), // สีพื้นหลังหลัก
      appBar: AppBar(
        backgroundColor: Colors.white, // แถบบนเป็นสีขาว
        title: Text(
          'วิธีการทำ', // เพิ่มชื่อของหน้าจอ
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // สีตัวหนังสือใน AppBar เป็นสีดำ
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // ปุ่มย้อนกลับเป็นสีดำ
          onPressed: () {
            Navigator.pop(context); // กลับไปหน้าก่อนหน้า
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black), // ปุ่มค้นหาเป็นสีดำ
            onPressed: () {
              // กำหนดการทำงานเมื่อกดปุ่มค้นหา (สามารถเพิ่มฟังก์ชันได้)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/แกงส้มผักกูด.jpg',
              width: 230,
              height: 300,
            ), // รูปภาพเมนูอาหาร
            SizedBox(height: 16),
            Text(
              'วิธีการทำ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // สีตัวหนังสือในหัวข้อ
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,  // ทำให้กล่องส่วนผสมเต็มความกว้างของผู้ปกครอง
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black), // เส้นกรอบของกล่องส่วนผสม
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,  // เปลี่ยนพื้นหลังเป็นสีขาว
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. นำพริกชี้ฟ้าแห้ง กะปิ และหอมแดงที่ปลอกเตรียมไว้มาโขลกจนแหลกและเป็นเนื้อเดียวกัน แล้วจึงตักขึ้นใส่ถ้วยพักไว้',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '2. นำหม้อตั้งไฟ ใส่น้ำรอให้เดือดใส่พริกแกงที่เตรียมไว้ลงไป',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '3. ตามด้วยใส่เนื้อสัตว์',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '4. ปรุงรสด้วยน้ำมะขามเปียก น้ำตาลปี๊ป และน้ำปลา แล้วจึงใส่ผักกูด',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '5. คนให้เข้ากัน แล้วปิดเตาไฟทันทีเพื่อให้ผักกูดคงความกรอบไว้ ตักใส่ถ้วยเสร็จ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IngredientPage(),
                  ),
                );
              },
              child: Text(
                'ส่วนผสม',
                style: TextStyle(color: Color.fromRGBO(78, 167, 113, 1.000),
                fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // สีพื้นหลังปุ่มเป็นสีขาว
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // เพิ่มขนาด padding แนวนอนและแนวตั้ง
                minimumSize: Size(100, 30), // กำหนดขนาดขั้นต่ำของปุ่ม (ความกว้าง x ความสูง)
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScoreScreen(),
                  ),
                );
              },
              child: Text(
                'เสร็จสิ้น',
                style: TextStyle(color: Colors.white,fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // สีพื้นหลังปุ่ม "เสร็จสิ้น" เป็นสีเขียว
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // เพิ่มขนาด padding แนวนอนและแนวตั้ง
                minimumSize: Size(100, 30), // ขนาดขั้นต่ำของปุ่ม (ความกว้าง x ความสูง)
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // แถบล่างเป็นสีขาว
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: Colors.black),
            label: 'ชื่นชอบ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.black),
            label: 'โปรไฟล์',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
