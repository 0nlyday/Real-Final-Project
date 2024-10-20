import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plantpursuit/showdataplant.dart';

class ListPlant extends StatefulWidget {
  const ListPlant({super.key});

  @override
  State<ListPlant> createState() => _ListPlantState();
}

class _ListPlantState extends State<ListPlant> {
  List userdata = [];
  List<dynamic> filteredData = [];
  String searchText = '';
  bool isLoading = true;

  Future<void> getrecord() async {
    try {
      var response = await http
          .get(Uri.parse("http://192.168.20.69/backEnd/list_plant.php"));
      print('Raw response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        print('Decoded JSON: $jsonResponse'); // เพิ่ม log
        setState(() {
          userdata = jsonResponse.map((item) {
            // ตรวจสอบและแปลงค่า veget_id เป็น int ถ้าเป็นไปได้
            var vegetId = item['veget_id'];
            if (vegetId is String) {
              vegetId = int.tryParse(vegetId) ?? 0;
            }
            return {
              ...item,
              'veget_id': vegetId,
            };
          }).toList();
          filteredData = userdata;
          isLoading = false;
        });
        print('Processed userdata: $userdata'); // เพิ่ม log
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getrecord();
  }

  void search(String query) {
    setState(() {
      filteredData = userdata
          .where((item) =>
              item["veget_name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("รายการผัก")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      search(
                          value); // Call search function every time TextField changes
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredData.length, // Use filteredData length
                    itemBuilder: (context, index) {
                      if (index >= filteredData.length) {
                        return Container();
                      }

                      var newsItem = filteredData[index];
                      print(
                          'News item: $newsItem'); // เพิ่ม log เพื่อตรวจสอบข้อมูล

                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(newsItem['veget_name'] ?? 'No name'),
                          onTap: () {
                            print(
                                'Tapped item: ${newsItem['veget_id']}'); // ตรวจสอบค่า veget_id
                            if (newsItem['veget_id'] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Showdataplant(
                                    showdataplant: {
                                      'veget_id': newsItem['veget_id'],
                                    },
                                  ),
                                ),
                              );
                            } else {
                              // แสดง dialog หรือ snackbar เพื่อแจ้งเตือนว่าไม่มี veget_id
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('ไม่พบข้อมูล ID ของผัก')),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
