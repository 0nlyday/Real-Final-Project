import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:plantpursuit/languagedata.dart';
import 'package:plantpursuit/menu.dart';
import 'package:plantpursuit/properties.dart';
import 'package:plantpursuit/databasic.dart';

class Showdataplant extends StatefulWidget {
  final Map<String, dynamic> showdataplant;

  Showdataplant({required this.showdataplant});

  @override
  _ShowdataplantPageState createState() => _ShowdataplantPageState();
}

class _ShowdataplantPageState extends State<Showdataplant> {
  late Future<Map<String, dynamic>> _futureContent;

  @override
  void initState() {
    super.initState();
    final vegetId = widget.showdataplant['veget_id'];
    if (vegetId != null) {
      _futureContent = fetchNewsContent(vegetId.toString());
    } else {
      _futureContent = Future.error('Invalid veget_id');
    }
  }

  Future<Map<String, dynamic>> fetchNewsContent(String vegetId) async {
    String uri = "http://192.168.20.69/backEnd/showdata.php?veget_id=$vegetId";
    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse is Map<String, dynamic>) {
          if (jsonResponse.containsKey('error')) {
            throw Exception(jsonResponse['error']);
          }

          return {
            'image': jsonResponse['image'] ?? '',
            'description': jsonResponse['description'] ?? 'ไม่มีคำอธิบาย',
            'benefits': jsonResponse['benefits'] ?? 'ไม่มีข้อมูลประโยชน์',
            'recommended_dishes':
                jsonResponse['recommended_dishes'] ?? 'ไม่มีเมนูแนะนำ',
          };
        } else {
          throw Exception('รูปแบบ JSON ไม่ถูกต้อง');
        }
      } else {
        throw Exception('ไม่สามารถโหลดข้อมูลได้: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('เกิดข้อผิดพลาด: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผักกูด'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _futureContent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
                  ElevatedButton(
                    child: Text('ลองใหม่'),
                    onPressed: () {
                      setState(() {
                        _futureContent = fetchNewsContent(
                            widget.showdataplant['veget_id'].toString());
                      });
                    },
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ปรับสไตล์ของรูปภาพ
                  if (data['image'].isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: 360, // กำหนดความกว้าง
                        height: 250, // กำหนดความสูง
                        child: Image.network(
                          data['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Text('ไม่สามารถโหลดรูปภาพได้');
                          },
                        ),
                      ),
                    ),

                  SizedBox(height: 16.0),
                  // ปุ่ม
                  Column(
                    children: [
                      customButton('ภาษาถิ่น', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocalLanguageScreen()), // หน้า Page1
                        );
                      }),
                      customButton('ข้อมูลทั่วไป', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlantDetailPage()), // หน้า Page2
                        );
                      }),
                      customButton('สรรพคุณ', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertiesPage()), // หน้า Page3
                        );
                      }),
                      customButton('เมนูแนะนำ', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManuPage()), // หน้า Page4
                        );
                      }),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('ไม่มีข้อมูล'));
          }
        },
      ),
      // เพิ่มไอคอนแถบล่าง
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

  // ปุ่มที่กำหนดเอง
  Widget customButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
