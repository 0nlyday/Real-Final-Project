// import 'package:flutter/material.dart';

// class ShowDataScreen extends StatefulWidget {
//   @override
//   _ShowDataScreenState createState() => _ShowDataScreenState();
// }

// class _ShowDataScreenState extends State<ShowDataScreen> {
//   TextEditingController _controller = TextEditingController();
//   List<String> _allData = [
//     'Lemongrass',
//     'Basil',
//     'Mint',
//     'Coriander',
//     'Thai Ginger',
//     'Turmeric',
//     'Chili Pepper'
//   ];
//   List<String> _filteredData = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = _allData; // Initially show all data
//   }

//   void _filterData(String query) {
//     setState(() {
//       _filteredData = _allData
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Show Data Example'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: DataSearchDelegate(_allData),
//               );
//             },
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _controller,
//               onChanged: _filterData,
//               decoration: InputDecoration(
//                 labelText: 'Search...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredData.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_filteredData[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DataSearchDelegate extends SearchDelegate<String> {
//   final List<String> data;

//   DataSearchDelegate(this.data);

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final results = data
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     return ListView(
//       children: results.map((result) {
//         return ListTile(
//           title: Text(result),
//           onTap: () {
//             close(context, result);
//           },
//         );
//       }).toList(),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = data
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     return ListView(
//       children: suggestions.map((suggestion) {
//         return ListTile(
//           title: Text(suggestion),
//           onTap: () {
//             query = suggestion;
//             showResults(context);
//           },
//         );
//       }).toList(),
//     );
//   }
// }
