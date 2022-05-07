import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

import 'CreateScreen.dart';
import 'DeleteScreen.dart';
import 'ReadScreen.dart';
import 'UpdateScreen.dart';
import 'OptionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        OptionsScreen.routeName: (ctx) => OptionsScreen(),
        CreateScreen.routeName: (ctx) => CreateScreen(),
        ReadScreen.routeName: (ctx) => ReadScreen(),
        UpdateScreen.routeName: (ctx) => UpdateScreen(),
        DeleteScreen.routeName: (ctx) => DeleteScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          margin: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Welcome to CRUD App,',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tap next button to continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(

                  animatedTexts: [
                RotateAnimatedText(
                  'Create',
                ),
                RotateAnimatedText(
                  'Read',
                ),
                RotateAnimatedText(
                  'Update',
                ),
                RotateAnimatedText(
                  'Delete',
                )
              ])
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(OptionsScreen.routeName);
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
