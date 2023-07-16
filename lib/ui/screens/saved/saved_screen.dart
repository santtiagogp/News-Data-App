import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/screens/home/widgets/news_tile.dart';
import 'package:news_app/ui/screens/saved/saved_bloc/saved_bloc.dart';

import 'widgets/initial_saved_screen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<SavedBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved News'),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(
            Duration.zero,
            () => bloc.add(LoadSavedNewsEvent())
          );
        },
        child: BlocBuilder<SavedBloc, SavedState>(
          builder: (context, state) {

            if( state is SavedInitial ) {
              return const InitialSavedScreen();
            }
      
            if( state is SavedNews ) {
              return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
      
                  final news = state.news[index];
      
                  return NewsTile(
                    title: news.title,
                    description: news.description,
                    imgUrl: news.imageUrl,
                    date: news.pubDate,
                    onTap: (){},
                    onIconTap: (){}
                  );
                },
              );
            }
      
            return const Center(child: CircularProgressIndicator());
      
          },
        ),
      ),
    );
  }
}