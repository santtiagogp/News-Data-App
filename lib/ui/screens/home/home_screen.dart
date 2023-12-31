import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/use_cases/news_use_cases.dart';
import '../../utils/helpers/news_navigator.dart';
import '../news/news_page.dart';
import '../saved/saved_bloc/saved_bloc.dart';
import '../saved/saved_screen.dart';
import '../search/search_bloc/search_bloc.dart';
import '../search/search_screen.dart';
import '../settings/settings_screen.dart';
import 'cubit/navigation_cubit.dart';
import 'home_bloc/home_bloc.dart';
import 'widgets/home_carousel.dart';
import 'widgets/home_carousel_image.dart';
import 'widgets/home_navbar.dart';
import 'widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.useCases});

  static const String screenName = 'home';
  final NewsUseCases useCases;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final SharedPreferences prefs;

  @override
  void initState() {
    initializeSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NavigationCubit>(context, listen: true);

    PageController controller = PageController(initialPage: cubit.currentIndex);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(widget.useCases)
        ..add(LoadDataEvent())),
        BlocProvider(create: (_) => SavedBloc(widget.useCases)
        ..add(LoadSavedNewsEvent())),
        BlocProvider(create: (_) => SearchBloc(widget.useCases))
      ],
      child: _HomePageHeader(controller: controller, cubit: cubit),
    );
  }

  void initializeSharedPreferences() async
    => prefs = await SharedPreferences.getInstance();

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

    final bloc = BlocProvider.of<SavedBloc>(context);

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

                          final news = state.cardNews[index];

                          return NewsTile(

                            title: data[index].title,
                            description: data[index].description,
                            imgUrl: data[index].imageUrl,
                            date: data[index].pubDate,
                            onIconTap:() => bloc.add(SaveNewsEvent(news)),
                            buttonIcon: data[index].saved ? 
                              Icons.bookmark : Icons.bookmark_border,
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
            itemCount: state.cardNews.length,
            itemBuilder: (_, index, __) {
              return InkWell(
                onTap: () => Helpers.navigateToNews(
                  context,
                  state.cardNews[index],
                  NewsPage.screenName
                ),
                child: HomeCarouselImage(
                  imageUrl: state.cardNews[index].imageUrl,
                  title: state.cardNews[index].title,
                ),
              );
            },
          );
        }

        return const CircularProgressIndicator();

      }
    );
  }
}
