import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  static const routeName = 'deleteScreen';

  final deleteIdController = TextEditingController();

  void deleteData() {
    String id = deleteIdController.text;
    FirebaseFirestore.instance.collection('data').doc(id).delete().then((value){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Delete'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: deleteIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'ID',
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: deleteData,
          icon: Icon(Icons.create),
          label: Text('Delete Data'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
