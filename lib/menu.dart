import 'package:flutter/material.dart';
import 'package:plantpursuit/inmanu.dart';

// หน้าแสดงส่วนผสม (คงเดิม)
class IngredientPage extends StatelessWidget {
  final String menuTitle;

  const IngredientPage({Key? key, required this.menuTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8E4D8), // สีพื้นหลังใหม่
      appBar: AppBar(
        title: Text(menuTitle),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ส่วนผสม',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildIngredientItem('ผักกูด', '200 กรัม'),
            _buildIngredientItem('น้ำพริกแกงส้ม', '2 ช้อนโต๊ะ'),
            _buildIngredientItem('กะปิ', '1 ช้อนชา'),
            _buildIngredientItem('น้ำปลา', '2 ช้อนโต๊ะ'),
            _buildIngredientItem('น้ำมะขามเปียก', '3 ช้อนโต๊ะ'),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientItem(String ingredient, String amount) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}

// หน้าหลักของแอปพลิเคชัน
class ManuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8E4D8), // สีพื้นหลังใหม่
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ผักกูด',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search icon pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/pic/fern_ผักกูด.jpg',
                width: 230,
                height: 300,
              ),
            ),
            Text(
              'เมนูแนะนำ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // ปุ่มแกงส้มผักกูด
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InmanuPage(
                      menuTitle: 'แกงส้มผักกูด',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 251, 251, 251),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: SizedBox(
                child: Text(
                  'แกงส้มผักกูด',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            // ปุ่มผักกูดน้ำมันหอย
            ElevatedButton(
              onPressed: () {
                // สามารถเพิ่มการนำทางไปยังหน้าสูตรผักกูดน้ำมันหอยได้ที่นี่
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('เลือกเมนูผักกูดน้ำมันหอย'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: SizedBox(
                child: Text(
                  'ผักกูดน้ำมันหอย',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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

void main() {
  runApp(MaterialApp(
    home: ManuPage(),
  ));
}
