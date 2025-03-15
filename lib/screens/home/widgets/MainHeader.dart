import 'package:flutter/material.dart';

class MainHeader extends StatefulWidget{
  const MainHeader({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainHeaderState();
  }
  
}
class MainHeaderState extends State<MainHeader>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Row(
        spacing: 300,
        children: [

          Expanded(flex: 1,
              child: Icon(Icons.icecream)),
          Expanded(
            flex: 2,
            child: Row(
              spacing: 2,
              children: [
                Text('Home'),
                Text('About'),
                Text('Portfolio'),
                Text('Contact')
              ],
            ),
          ),
          Expanded(
            flex: 1,
              child: OutlinedButton(onPressed: (){}, child: Text('Get in Touch')))
        ],
      ),
    );
  }
  
}