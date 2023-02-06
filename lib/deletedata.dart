import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  deletedata(id) async {
    await FirebaseFirestore.instance.collection('shop').doc(id).delete();
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
                              setState(() async {
                                await deletedata(
                                    streamSnapshot.data!.docs[index].id);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
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
}

void deletedata(id) {
  FirebaseFirestore.instance.collection('shop').doc(id).delete();
  //fluttertoast package can be used to show a popup
}
