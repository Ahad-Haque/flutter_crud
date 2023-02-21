import 'package:firebase_crud/createdata.dart';
import 'package:firebase_crud/createdataDemo.dart';
import 'package:firebase_crud/deletedata.dart';
import 'package:firebase_crud/querytest.dart';
import 'package:firebase_crud/updatedata.dart';
import 'package:firebase_crud/viewdata.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.amber,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ViewData())));
                },
                child: Container(
                  // color: Colors.amber,
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: const Center(child: Text('View\nData')),
                ),
              ),
              Container(
                // color: Colors.amber,
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const CreateData())));
                },
                child: Container(
                  // color: Colors.amber,
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                  child: const Center(
                      child: Text(
                    'Create\nData',
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              Container(
                // color: Colors.amber,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const UpdateData())));
                },
                child: Container(
                  // color: Colors.amber,
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Center(
                      child: Text(
                    'Update\nData',
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const DeleteData())));
                },
                child: Container(
                  // color: Colors.amber,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: const Center(
                      child: Text(
                    'Delete\nData',
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.amber,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const CreateDemo())));
                },
                child: Container(
                  // color: Colors.amber,
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(color: Colors.lime, shape: BoxShape.circle),
                  child: const Center(
                      child: Text(
                    'Demo\nData',
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.amber,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: ((context) => const Querytest())));
          //       },
          //       child: Container(
          //         // color: Colors.amber,
          //         height: 50,
          //         width: 50,
          //         decoration:
          //             BoxDecoration(color: Colors.cyan, shape: BoxShape.circle),
          //         child: const Center(
          //             child: Text(
          //           'query\ntest',
          //           textAlign: TextAlign.center,
          //         )),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
