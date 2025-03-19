import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        layout: ResponsiveRowColumnType.ROW,
        children: [
          // profile
          ResponsiveRowColumnItem(
            rowFlex: 0,
            child:  CircleAvatar(child: Image.asset('assets/img/profile.png'),),
          ),

          // Desktop Navigation (Hidden on mobile)
          ResponsiveRowColumnItem(
            rowFlex: 0,
            child: ResponsiveVisibility(
              hiddenConditions: const [
                Condition.equals(name: MOBILE), // Hide on mobile
              ],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _navItem('Home'),
                  _navItem('About'),
                  _navItem('Portfolio'),
                  _navItem('Contact'),
                ],
              ),
            ),
          ),

          // Mobile Menu Button
          ResponsiveRowColumnItem(
            rowFlex: 0,
            child: ResponsiveVisibility(
              hiddenConditions: const [
                Condition.largerThan(name: MOBILE), // Hide on tablet & desktop
              ],
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                onSelected: (value) {
                  // Handle menu item tap
                  print('Selected: $value');
                },
                itemBuilder: (context) => [
                  _popupMenuItem('Home'),
                  _popupMenuItem('About'),
                  _popupMenuItem('Portfolio'),
                  _popupMenuItem('Contact'),
                ],
              ),
            ),
          ),

          ResponsiveRowColumnItem(
            rowFlex: 0,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Get in Touch'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  PopupMenuItem<String> _popupMenuItem(String text) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
