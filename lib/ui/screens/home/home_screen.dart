import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../search/search_bloc/search_bloc.dart';

import '../../../domain/use_cases/news_use_cases.dart';
import '../news/news_page.dart';
import '../saved/saved_screen.dart';
import '../search/search_screen.dart';
import '../settings/settings_screen.dart';
import 'cubit/navigation_cubit.dart';
import 'home_bloc/home_bloc.dart';
import 'widgets/home_carousel.dart';
import 'widgets/home_navbar.dart';
import 'widgets/news_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.useCases});

  static const String screenName = 'home';
  final NewsUseCases useCases;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NavigationCubit>(context, listen: true);

    PageController controller = PageController(initialPage: cubit.currentIndex);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(useCases)
        ..add(LoadDataEvent())),

        BlocProvider(create: (_) => SearchBloc(useCases))
      ],
      child: _HomePageHeader(controller: controller, cubit: cubit),
    );
  }
}

class _HomePageHeader extends StatelessWidget {
  const _HomePageHeader({
    required this.controller,
    required this.cubit,
  });

  final PageController controller;
  final NavigationCubit cubit;

  @override
  Widget build(BuildContext context) {
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

          controller.animateToPage(cubit.currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}

class _LastestNews extends StatelessWidget {
  const _LastestNews();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('News App'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const _HomeCarousel(),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {

                  if( state is HomeLoaded ) {
                    final data = state.listNews;
                    return SizedBox(
                      height: size.height * 0.5,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ( _, index ) {
                          return NewsTile(
                            title: data[index].title,
                            description: data[index].description,
                            imgUrl: data[index].imageUrl,
                            date: data[index].pubDate,
                            onTap: () => Navigator.pushNamed(
                              context,
                              NewsPage.screenName,
                              arguments: data[index]
                            ),
                          );
                        }
                      ),
                    );
                  }

                  return const CircularProgressIndicator();
                  
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCarousel extends StatelessWidget {
  const _HomeCarousel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: ( context, state ) {

        if( state is HomeLoaded ) {
          return HomeCarousel(
            news: state.cardNews,
          );
        }

        return const CircularProgressIndicator();

      }
    );
  }
}
