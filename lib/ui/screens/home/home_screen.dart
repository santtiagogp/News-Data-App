import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../saved/saved_screen.dart';
import '../search/search_screen.dart';
import '../settings/settings_screen.dart';
import 'cubit/navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String screenName = 'home';

  @override
  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<NavigationCubit>(context, listen: true);

    var controller = PageController(
      initialPage: cubit.currentIndex
    );

    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          _LastestNews(),
          SearchScreen(),
          SavedScreen(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: controller.initialPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Saved'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        onDestinationSelected: (index) {
          cubit.changeIndex(index);
          controller.animateToPage(
            cubit.currentIndex,
            duration: const Duration( milliseconds: 250 ),
            curve: Curves.easeIn
          );
        },
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
