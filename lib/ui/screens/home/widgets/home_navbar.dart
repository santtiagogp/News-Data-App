import 'package:flutter/material.dart';

class HomeNavbar extends StatelessWidget {

  const HomeNavbar({
    super.key,
    required this.controller,
    required this.onDestinationSelected
  });

  final PageController controller;
  final void Function(int index) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      selectedIndex: controller.initialPage,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Saved'),
        NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
      ],
      onDestinationSelected: onDestinationSelected,
    );
  }
}