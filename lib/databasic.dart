// File: databasic.dart

import 'package:flutter/material.dart';

// คลาสสำหรับเก็บข้อมูลพืช
class PlantInfo {
  final String name; // ชื่อพืช
  final String imageUrl; // URL รูปภาพ
  final String family; // วงศ์พืช
  final String description; // คำอธิบายทั่วไป
  final String origin; // ถิ่นกำเนิด
  final List<String> characteristics; // ลักษณะเด่น

  PlantInfo({
    required this.name,
    required this.imageUrl,
    required this.family,
    required this.description,
    required this.origin,
    required this.characteristics,
  });
}

class PlantDetailPage extends StatelessWidget {
  final plantInfo = PlantInfo(
    name: 'ผักกูด',
    imageUrl: 'assets/pic/fern_ผักกูด.jpg',
    family: 'Poaceae',
    description: '''ข้อมูลทั่วไป:
ผักกูด (Diplazium esculentum) 
เป็นเฟิร์นชนิดหนึ่งที่พบในบริเวณป่าชื้น โดยเฉพาะตามแหล่งน้ำ 
ผักกูดมีลำต้นเล็ก ใบเรียวยาว มีความกรอบ 
สามารถเก็บเกี่ยวใบอ่อนมารับประทานได้''', origin: '', characteristics: []
    
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8E4D8), // พื้นหลังสีเขียวอ่อน
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          plantInfo.name,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // ฟังก์ชันค้นหา
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // รูปภาพพืช
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    plantInfo.imageUrl,
                    width: 230,
                    height: 300,
                  )),
            ),
            // กรอบข้อมูลที่ 1 - คำอธิบาย
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                plantInfo.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
            // กรอบข้อมูลที่ 2 - ถิ่นกำเนิด
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //   decoration: BoxDecoration(
            //     color: Color(0xFFF5F5F5),
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   padding: EdgeInsets.all(16),
            //   child: Text(
            //     plantInfo.origin,
            //     style: TextStyle(
            //       fontSize: 14,
            //       color: Colors.black87,
            //       height: 1.5,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0,
          items: [
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
      ),
    );
  }
}
