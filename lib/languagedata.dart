import 'package:flutter/material.dart';

// ข้อมูลภาษาท้องถิ่นของพืชสมุนไพร
class LocalLanguageModel {
  final String scientificName;
  final Map<String, String> localNames;

  LocalLanguageModel({
    required this.scientificName,
    required this.localNames,
  });
}

// หน้าจอแสดงข้อมูลภาษาท้องถิ่น
class LocalLanguageScreen extends StatelessWidget {
  // ข้อมูลตัวอย่างของผักกูด
  final herbData = LocalLanguageModel(
    scientificName: 'Cymbopogon citratus',
    localNames: {
      'ภาคเหนือ': 'กูดคึ',
      'ภาคกลาง': 'กูดกิน ผักกูด',
      'ชลบุรี': 'กูดขาว ผักกูดขาว',
      'นครราชสีมา, สุราษฎร์ธานี': 'หัสดำ',
      'กะเหรี่ยง-แม่ฮ่องสอน': 'ไก้กวิลุ ปู่แปลเด๊าะ',
      }, //scientificName: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCE7DC), // สีพื้นหลังเขียวอ่อน
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('ผักกูด'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // รูปภาพพืชสมุนไพร
            Image.asset(
              'assets/pic/fern_ผักกูด.jpg',
              width: 230,
              height: 300,
            ),
            SizedBox(height: 8),
            // ชื่อวิทยาศาสตร์
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       'ชื่อวิทยาศาสตร์:',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                       ),
                     ),
                    SizedBox(height: 4),
                    Text(
                      herbData.scientificName,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // รายการชื่อท้องถิ่น
            ...herbData.localNames.entries.map((entry) => Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ชื่อในท้องถิ่น${entry.key}:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          entry.value,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
