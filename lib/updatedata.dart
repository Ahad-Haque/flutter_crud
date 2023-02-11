import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _texController = TextEditingController();
  final _texController2 = TextEditingController();
  final _texController3 = TextEditingController();

  String name = '';
  String price = '';
  String quantity = '';

  updatedata(id) async {
    name = _texController.text;
    price = _texController2.text;
    quantity = _texController3.text;
    await FirebaseFirestore.instance
        .collection('shop')
        .doc(id)
        .update({"name": name, "price": price, "quantity": quantity});
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference _product =
        FirebaseFirestore.instance.collection('shop');
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: StreamBuilder(
          stream: _product.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                        title: Text(documentSnapshot['name']),
                        subtitle: Text(documentSnapshot['price'].toString()),
                        trailing: GestureDetector(
                            onTap: () {
                              openDialog(streamSnapshot.data!.docs[index].id);
                            },
                            child: const Icon(
                              Icons.update,
                              color: Colors.blue,
                            ))),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Future openDialog(r) => showDialog(
      context: context,
      builder: ((context) => AlertDialog(
          title: Text('Update Data Form'),
          content: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: TextField(
                  controller: _texController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Product Name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                    updatedata(r);
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
                      "Update",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ))));
}
