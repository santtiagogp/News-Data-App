import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  static const String screenName = 'home';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        children: const [
          _LastestNews()
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          Icon( Icons.home ),
          Icon( Icons.search ),
          Icon( Icons.bookmark_border ),
          Icon( Icons.settings_outlined )
        ],
      ),
    );
  }
}

class _LastestNews extends StatelessWidget {

  const _LastestNews();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main page'),
      ),
    );
  }
}