import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nevil_portofolio/screens/home/widgets/MainHeader.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );

  }
  Widget _body(BuildContext context){
    return Container(
      width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img/background.jpg'), fit: BoxFit.cover)
        ),
      child: ResponsiveScaledBox(width: 500, child: Column(
        children: [
          Expanded(child: MainHeader())
        ],
      )),
    );
  }
}
