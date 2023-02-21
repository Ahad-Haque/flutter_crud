// import 'package:firebase_crud/queryteslist.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Querytest extends StatefulWidget {
//   const Querytest({super.key});

//   @override
//   State<Querytest> createState() => _QuerytestState();
// }

// //date time from system
// DateTime date = DateTime.now();
// String formattedDate = '${date.day}-${date.month}-${date.year}';

// class _QuerytestState extends State<Querytest> {
//   final _texController = TextEditingController();
//   final _texController2 = TextEditingController();
//   final _texController3 = TextEditingController();

//   CollectionReference gatherdata =
//       FirebaseFirestore.instance.collection('querytest');

//   String name = '';
//   String price = '';
//   String quantity = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Data'),
//         leading: const BackButton(
//           color: Colors.black,
//         ),
//       ),
//       body: Column(children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: TextField(
//             controller: _texController,
//             decoration: const InputDecoration(
//                 border: OutlineInputBorder(), hintText: 'Product Name'),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: TextField(
//               controller: _texController2,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Product Price',
//               )),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: TextField(
//               controller: _texController3,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Product Quantity',
//               )),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() async {
//               name = _texController.text;
//               price = _texController2.text;
//               quantity = _texController3.text;
//               await gatherdata.add({
//                 'name': name,
//                 'price': price,
//                 'quantity': quantity,
//                 'date': formattedDate
//               });
//               _showPopup(context);
//             });
//           },
//           child: Container(
//             height: 40,
//             width: 150,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.blue,
//             ),
//             child: const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "Save info to database",
//                 style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         GestureDetector(
//           onTap: () {
//             //have to code query here
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => queryorderlist(mydata)));
//             // queryreturn();
//           },
//           child: Container(
//             height: 40,
//             width: 150,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.orange,
//             ),
//             child: const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "test query",
//                 style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// //takes the list of all data
// Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> Function() mydata =
//     queryreturn;

// //popup dialouge
// void _showPopup(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Massage'),
//         content: Text('Added!'),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Close'),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       );
//     },
//   );
// }

// Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> queryreturn() async {
//   final firestore = FirebaseFirestore.instance;
//   final ordersCollection = firestore.collection('orders');

//   final day = 20; // Replace with the day you want to retrieve
//   final month = 2; // Replace with the month you want to retrieve

//   final startOfMonth = DateTime.now().toUtc().startOfMonth();
//   final endOfMonth = startOfMonth.add(Duration(days: 31));

//   final orders = await ordersCollection
//       .where('timestamp', isGreaterThanOrEqualTo: startOfMonth)
//       .where('timestamp', isLessThanOrEqualTo: endOfMonth)
//       .get();

//   final filteredOrders = orders.docs
//       .where((order) =>
//           order['timestamp'].toDate().day == day &&
//           order['timestamp'].toDate().month == month)
//       .toList();

//   return filteredOrders;
// }

// extension DateTimeExtension on DateTime {
//   DateTime startOfDay() => DateTime(this.year, this.month, this.day);
//   DateTime startOfMonth() => DateTime(this.year, this.month, 1);
// }
