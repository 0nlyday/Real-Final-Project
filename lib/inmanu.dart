import 'package:flutter/material.dart';
import 'package:plantpursuit/howto.dart';
import 'package:plantpursuit/ingredient.dart';

class InmanuPage extends StatelessWidget {
  const InmanuPage({Key? key, required String menuTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8E4D8), // สีพื้นหลังใหม่

      // AppBar ด้านบนของหน้าจอ
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง AppBar เป็นสีขาว
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // กลับไปหน้าก่อนหน้า
          },
        ),
        title: Text(
          '',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // จัดกลางชื่อหน้า
        actions: [
          IconButton(
            icon: Icon(Icons.search), // ไอคอนค้นหา
            onPressed: () {
              // การกระทำเมื่อกดไอคอนค้นหา
            },
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            // รูปภาพของอาหาร
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/แกงส้มผักกูด.jpg', // เปลี่ยนเป็น path รูปภาพของคุณ
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0), // ระยะห่างระหว่างรูปภาพกับส่วนอื่นๆ

            // ชื่อเมนูอาหาร
            Text(
              'แกงส้มผักกูด',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // ปุ่ม "ส่วนผสม"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IngredientPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังปุ่ม
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
              ),
              child: Text(
                'ส่วนผสม',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // สีข้อความบนปุ่ม
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // ปุ่ม "วิธีการทำ"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HowtoPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังปุ่มใหม่
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
              ),
              child: Text(
                'วิธีการทำ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),

      // BottomNavigationBar สำหรับแถบเมนูด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง BottomNavigationBar เป็นสีขาว
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'ชื่นชอบ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
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
