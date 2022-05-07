import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  static const String routeName = 'createScreen';

  final createIdController = TextEditingController();
  final nameController = TextEditingController();
  final roleController = TextEditingController();

  void createData() async {
    final crData = {
      'id': createIdController.text,
      'name': nameController.text,
      'role': roleController.text
    };
    final demoData =
        FirebaseFirestore.instance.collection('data').doc(createIdController.text);
    await demoData.set(crData).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Enter employee details here',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            alignment: Alignment.center,
            child: TextField(
              controller: createIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'ID'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            alignment: Alignment.center,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            alignment: Alignment.center,
            child: TextField(
              controller: roleController,
              decoration: InputDecoration(hintText: 'Role'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createData,
        backgroundColor: createIdController.text.isEmpty ||
                nameController.text.isEmpty ||
                roleController.text.isEmpty
            ? Colors.grey
            : Colors.blue,
        icon: Icon(Icons.create),
        label: Text('Add Data'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
