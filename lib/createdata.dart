import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
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
              await gatherdata.add({
                'name': name,
                'price': price,
                'quantity': quantity,
              });
              _showPopup(context);
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
