import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'CreateScreen.dart';
import 'DeleteScreen.dart';
import 'ReadScreen.dart';
import 'UpdateScreen.dart';

class OptionsScreen extends StatelessWidget {
  static const String routeName = 'optionScreen';

  Widget getButton(BuildContext context, String text, String route) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.blue),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(
          'CRUD',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            getButton(context, 'Create Data', CreateScreen.routeName),
            getButton(context, 'Read Data', ReadScreen.routeName),
            getButton(context, 'Update Data', UpdateScreen.routeName),
            getButton(context, 'Delete Data', DeleteScreen.routeName),
          ],
        ),
      ),
    );
  }
}
