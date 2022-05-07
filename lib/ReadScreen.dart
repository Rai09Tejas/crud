import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  ReadScreen({Key? key}) : super(key: key);
  static const routeName = 'readScreen';

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final Stream<QuerySnapshot> dataStream =
      FirebaseFirestore.instance.collection('data').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Read'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Text(''),
            StreamBuilder(
              stream: dataStream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  print('error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final List dataList = [];
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map map = document.data() as Map<String, dynamic>;
                  dataList.add(map);
                  map['id'] = document.id;
                }).toList();

                return Column(
                    children: List.generate(
                  dataList.length,
                  (index) => Card(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(dataList[index]['name'],style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      subtitle: Text(dataList[index]['role'],style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
                      leading: Container(
                        width: 50,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child:
                              Expanded(child: Center(child: Text('${dataList[index]['id']}')))),
                    ),
                  ),
                ));
              },
            ),
          ],
        ));
  }
}
