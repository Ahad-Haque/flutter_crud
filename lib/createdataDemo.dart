import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateDemo extends StatefulWidget {
  const CreateDemo({super.key});

  @override
  State<CreateDemo> createState() => _CreateDemoState();
}

class _CreateDemoState extends State<CreateDemo> {
  final _texController = TextEditingController();
  final _texController2 = TextEditingController();
  final _texController3 = TextEditingController();
  CollectionReference gatherdata =
      FirebaseFirestore.instance.collection('shop');

  String name = '';
  String price = '';
  String quantity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: TextField(
            controller: _texController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Product Name'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: TextField(
              controller: _texController2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Price',
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: TextField(
              controller: _texController3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Quantity',
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() async {
              name = _texController.text;
              price = _texController2.text;
              quantity = _texController3.text;
              if (name.isNotEmpty && price.isNotEmpty && quantity.isNotEmpty) {
                await addCollection(name, price, quantity);
                _showPopup(context);
                // testingquery();
              } else {
                _showPopupfieldempty(context);
              }
            });
          },
          child: Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Save info to database",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Massage'),
        content: Text('Added!'),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

void _showPopupfieldempty(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Massage'),
        content: Text('Please full up the fields!'),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

// Future<String?> addCollection(a, b, c) async {
//   CollectionReference users = FirebaseFirestore.instance.collection('dataDemo');
//   var result = await users.add({'name': a, 'price': b, 'quantity': c});
//   // result.id;
//   await addSubCollection(id: result.id);
//   return 'created';
// }

// Future<String?> addSubCollection({String? id}) async {
//   CollectionReference users = FirebaseFirestore.instance.collection('dataDemo');
//   users
//       .doc(id)
//       .collection('another_history2')
//       .add({'id': id, 'created_at': DateTime.now()});
//   return 'Success';
// }
int order_counter = 1;
DateTime date = DateTime.now();
String formattedDate = '${date.day}-${date.month}-${date.year}';

Future<String?> addCollection(a, b, c) async {
  CollectionReference users = FirebaseFirestore.instance.collection('dataDemo');
  DocumentReference docRef = users.doc('${formattedDate}');
  CollectionReference subcollectionRef =
      docRef.collection('Order No: ${order_counter}');

  Map<String, dynamic> data = {'name': a, 'price': b, 'quantity': c};
  subcollectionRef.add(data);
  order_counter += 1;
  return 'created';
}

void testingquery() async {
  CollectionReference parentCollectionRef =
      FirebaseFirestore.instance.collection('dataDemo');
  CollectionReference childCollectionRef =
      parentCollectionRef.doc('dataDemo').collection('${formattedDate}');
  Query query = childCollectionRef.where('Order No: 1',
      isEqualTo: 'lgcnelopCXjwDOn5Dwvv');
  QuerySnapshot querySnapshot = await query.get();
  List<DocumentSnapshot> documentSnapshots = querySnapshot.docs;
  print(documentSnapshots);
}
