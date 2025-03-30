import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Text(
          '© ${DateTime.now().year} Nevil Ingutu. All Rights Reserved.', // Replace with your name
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
        ),
      ),
    );
  }
}