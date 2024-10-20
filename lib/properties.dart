// // properties.dart
// // นำเข้า package ที่จำเป็น
// import 'package:flutter/material.dart';

// // สร้าง StatelessWidget สำหรับหน้าแสดงคุณสมบัติของสมุนไพร
// class PropertiesPage extends StatelessWidget {
//   final String herbName; // ชื่อสมุนไพร

//   // Constructor
//   const PropertiesPage({
//     Key? key,
//     required this.herbName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // แถบด้านบน
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFB8D5B8), // สีพื้นหลังเขียวอ่อน
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           herbName,
//           style: const TextStyle(color: Colors.black),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search, color: Colors.black),
//             onPressed: () {
//               // ตรงนี้ใส่ฟังก์ชันค้นหา
//             },
//           ),
//         ],
//       ),
      
//       // เนื้อหาหลัก
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // รูปภาพสมุนไพร
//             Image.asset(
//               'assets/pic/fern_ผักกูด.jpg', // ต้องแทนที่ด้วย path จริง
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
            
//             // ส่วนแสดงคุณสมบัติต่างๆ
//             _buildPropertySection(
//               'ส่วนหัว',
//               'เป็นยารักษาเกลื่อน แก้ท้องอืด ท้องเฟ้อ แก้บิดสาบะพิการ แก้บวม บำรุงโลหิตดี แก้อาการขัดเบา',
//             ),
//             _buildPropertySection(
//               'ส่วนใบสด',
//               'จะช่วยลดความดันโลหิตสูง',
//             ),
//             _buildPropertySection(
//               'ส่วนราก',
//               'ใช้เป็นยาแก้ไข้หนูดี ปวดท้องและท้องเสีย',
//             ),
//           ],
//         ),
//       ),
      
//       // แถบนำทางด้านล่าง
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         color: const Color(0xFFB8D5B8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.home),
//               onPressed: () {
//                 // ฟังก์ชันไปหน้าหลัก
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.favorite_border),
//               onPressed: () {
//                 // ฟังก์ชันรายการโปรด
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.person_outline),
//               onPressed: () {
//                 // ฟังก์ชันโปรไฟล์
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // วิดเจ็ตสำหรับแสดงส่วนคุณสมบัติแต่ละส่วน
//   Widget _buildPropertySection(String title, String description) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         border: Border(
//           bottom: BorderSide(
//             color: Colors.grey[300]!,
//             width: 1,
//           ),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             description,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

// สร้าง StatelessWidget สำหรับหน้าแสดงคุณสมบัติของสมุนไพร
class PropertiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // แถบด้านบน
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1), // สีพื้นหลังเขียวอ่อน
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ผักกูด', // เปลี่ยนผัก
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // ตรงนี้ใส่ฟังก์ชันค้นหา
            },
          ),
        ],
      ),
      
      // เนื้อหาหลัก
      body: SingleChildScrollView(
        child: Column(
          children: [
            // รูปภาพสมุนไพร
            Image.asset(
              'assets/pic/fern_ผักกูด.jpg', // เปลี่ยน path รูปเป็นตะไคร้
              width: 230,
              height: 300,
            ),
            
            // ส่วนแสดงคุณสมบัติต่างๆ โดยใช้ Card เพื่อแยกเป็นกรอบๆ
            _buildPropertySection(
  'คุณสมบัติของผักกูด',  // title (this is now the first argument)
  '''ช่วยเสริมสร้างและบำรุงร่างกายให้แข็งแรง มีพลัง พร้อมเสริมสร้างภูมิคุ้มกัน 
  มีแร่ธาตุที่สำคัญ เช่น ธาตุเหล็กในปริมาณสูงมาก 

  เมื่อรับประทานร่วมกับเนื้อสัตว์ จะช่วยให้ร่างกายดูดซึมธาตุอาหารได้ดี 
  บำรุงโลหิต และแก้อาการโลหิตจาง 

  ผักกูดเป็นผักเย็น มีคุณสมบัติช่วยดับร้อน แก้อาการไข้ตัวร้อน 
  ช่วยบำรุงสายตา ลดระดับคอเลสเตอรอล และลดความดันโลหิตสูง 

  ป้องกันโรคเลือดออกตามไรฟัน เนื่องจากมีเส้นใยอาหารสูง 
  จึงช่วยระบบการย่อยอาหารและการขับถ่าย 

  นอกจากนี้ ผักกูดยังมีสรรพคุณช่วยขับปัสสาวะ และที่สำคัญ 
  สามารถดูดซับสารพิษที่ตกค้างในร่างกายจากอาหาร และช่วยขับออกจากร่างกายได้อย่างมีประสิทธิภาพ''',  // description (second argument)
),

          ],
        ),
      ),
      
      // แถบนำทางด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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

  // วิดเจ็ตสำหรับแสดงส่วนคุณสมบัติแต่ละส่วน
  Widget _buildPropertySection(String title, String description) {
    return Container(
      width: double.infinity, // ตั้งค่าความกว้างให้เต็มหน้าจอ
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง
        borderRadius: BorderRadius.circular(20), // ขอบมนตามภาพ
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 233, 255, 222).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // เงาให้ดูมีมิติ
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
