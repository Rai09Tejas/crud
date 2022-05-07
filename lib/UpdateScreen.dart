import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  static const routeName = 'updateScreen';

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final updateIdController = TextEditingController();

  final newNameController = TextEditingController();

  final newRoleController = TextEditingController();

  int buttonVal = 0;

  Widget getId() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: updateIdController,
      onEditingComplete: getData,
      decoration: InputDecoration(hintText: 'ID'),
    );
  }

  Widget getNewData() {
    return Column(
      children: [
        TextField(
          controller: newNameController,
          decoration: InputDecoration(hintText: 'New Name'),
        ),
        TextField(
          controller: newRoleController,
          onEditingComplete: updateData,
          decoration: InputDecoration(hintText: 'New Role'),
        ),
      ],
    );
  }

  void getData() {
    if(updateIdController.text.isNotEmpty){
      setState(() {
        buttonVal = 1;
      });
    }
  }

  void updateData() {
    FirebaseFirestore.instance
        .collection('data')
        .doc(updateIdController.text)
        .update(
            {'name': newNameController.text, 'role': newRoleController.text});
    print('Updated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: buttonVal == 0 ? getId() : getNewData())
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: buttonVal == 0 ? getData : updateData,
        icon:
            buttonVal == 0 ? Icon(Icons.format_list_numbered) : Icon(Icons.update),
        label: Text(buttonVal == 0 ? 'Get ID' : 'Update Data'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
