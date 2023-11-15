import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'user details'.toUpperCase(),
            softWrap: true,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.teal.shade200,
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(),
          ),
        ),
      ),
    );
  }
}
