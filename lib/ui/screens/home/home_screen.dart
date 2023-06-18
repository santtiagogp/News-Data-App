import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/news_tile.dart';

import '../saved/saved_screen.dart';
import '../search/search_screen.dart';
import '../settings/settings_screen.dart';
import 'cubit/navigation_cubit.dart';
import 'widgets/home_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String screenName = 'home';

  @override
  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<NavigationCubit>(context, listen: true);

    PageController controller = PageController(
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
      bottomNavigationBar: HomeNavbar(
        controller: controller,
        onDestinationSelected: (index) {

          cubit.changeIndex(index);

          controller.animateToPage(
            cubit.currentIndex,
            duration: const Duration( milliseconds: 300 ),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('News App'),
      ),

      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              const SizedBox( height: 30, ),
        
              Container(
                width: 310,
                height: 200,
                color: Colors.orangeAccent,
              ),
              
              const Column(
                children: [
                  NewsTile(),
                  NewsTile(),
                  NewsTile(),
                  NewsTile(),
                  NewsTile(),
                  NewsTile(),
                  NewsTile(),
                  NewsTile(),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
