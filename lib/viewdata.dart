import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

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
                      title: Text(documentSnapshot['name'].toString()),
                      subtitle: Text(documentSnapshot['price'].toString()),
                      trailing: Text(
                          'quantity: ${documentSnapshot['quantity'].toString()}'),
                    ),
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
