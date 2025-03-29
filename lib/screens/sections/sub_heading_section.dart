import 'package:flutter/material.dart';

class SubHeadingSection extends StatefulWidget {
  const SubHeadingSection({super.key});

  @override
  State<SubHeadingSection> createState() => _SubHeadingSectionState();
}

class _SubHeadingSectionState extends State<SubHeadingSection> {
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;
     return Container(

       margin: EdgeInsets.only(left: 50),
       padding: EdgeInsets.symmetric(
         horizontal: isMobile ? 20 : 80,
         vertical: 50,
       ),
       constraints: BoxConstraints(minHeight: 300),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("HI, I'M",
             style: Theme.of(context).textTheme.bodyLarge,
           ),
           const SizedBox(height: 20,),
           Text("NEVIL INGUTU",
           style: Theme.of(context).textTheme.headlineLarge,)
         ],
       ),
     );
    });
  }
}
