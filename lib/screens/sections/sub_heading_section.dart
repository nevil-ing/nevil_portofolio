import 'package:flutter/material.dart';


class SubHeadingSection extends StatelessWidget {
  const SubHeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 50,
        ),


        constraints: const BoxConstraints(minHeight: 300),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              "HI, I'M",
              style: textTheme.bodyLarge?.copyWith(fontSize: 70, fontWeight: FontWeight.normal),
            ),

            const SizedBox(height: 20),

            Text(
              "NEVIL INGUTU",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      );
    });
  }
}