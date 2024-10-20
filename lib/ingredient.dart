import 'package:flutter/material.dart';
import 'package:plantpursuit/howto.dart';

class IngredientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // สีพื้นหลังของ Scaffold
      backgroundColor: const Color(0xFFD8E4D8),

      // แอปบาร์ด้านบนที่แสดงชื่อเมนูและไอคอนค้นหา
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง AppBar เป็นสีขาว
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // ปุ่มกลับไปหน้าก่อนหน้า
          },
        ),
        title: const Text(
          'แกงส้มผักกูด', // ชื่อเมนู
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // ฟังก์ชันการค้นหา
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // รูปภาพของเมนูที่ด้านบน
            Image.asset(
              'assets/แกงส้มผักกูด.jpg',
                width: 300,
                height: 300,
              
            ),
            const SizedBox(height: 16),

            // ส่วนที่แสดงส่วนผสม
            const Text(
              'ส่วนผสม', // หัวข้อ "ส่วนผสม"
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // รายการส่วนผสม
            Container(
              width: double.infinity,  // ทำให้คอนเทนเนอร์กินพื้นที่เต็มหน้าจอ
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black), // ขอบรอบส่วนของส่วนผสม
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 255, 255, 255),  // พื้นหลังของส่วนผสมเป็นสีขาว
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ingredientItem('พริกขี้ฟ้าแห้ง', '4 เม็ด'),
                  ingredientItem('หอมแดง', '5 หัว'),
                  ingredientItem('กะปิ', '1 ช้อนโต๊ะ'),
                  ingredientItem('ผักกูด', '4½ ถ้วยตวง'),
                  ingredientItem('น้ำ', '1¾ ถ้วยตวง'),
                  ingredientItem('น้ำปลา', '1 ช้อนโต๊ะ'),
                  ingredientItem('น้ำตาลปี๊บ', '1 ช้อนโต๊ะ'),
                  ingredientItem('น้ำและเนื้อมะขามเปียก', '¼ ถ้วยตวง'),
                  ingredientItem('เนื้อสัตว์', 'ตามใจชอบ'),
                ],
              ),
            ),
            const SizedBox(height: 16),

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
              child: const Text(
                'วิธีการทำ',
                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // สีพื้นหลังปุ่ม
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: const TextStyle(fontSize: 20,color: Colors.white, // เปลี่ยนสีตัวหนังสือเป็นสีขาว
                
)
              ),
            ),
          ],
        ),
      ),

      // แถบ Navigation ด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง BottomNavigationBar เป็นสีขาว
        elevation: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'ชื่นชอบ',
          ),
          const BottomNavigationBarItem(
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

  // ฟังก์ชันสร้างแต่ละรายการของส่วนผสม
  Widget ingredientItem(String name, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name, // ชื่อของส่วนผสม
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            amount, // ปริมาณของส่วนผสม
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
