import 'package:flutter/material.dart';

import 'package:nevil_portofolio/screens/home/widgets/MainHeader.dart';
import 'package:nevil_portofolio/screens/home/widgets/main_body.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MainBody(),
    );

  }
}
