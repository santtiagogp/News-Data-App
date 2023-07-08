import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../news/news_page.dart';
import 'search_bloc/search_bloc.dart';
import '../home/widgets/news_tile.dart';

import 'widgets/news_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final txtController = TextEditingController();

    final bloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            NewsTextField(
              controller: txtController,
              onChanged: (value)
                => bloc.add(SearchData(value)),
            ),
      
            const SizedBox(height: 20),
            
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                
                if( state is SearchDataLoaded ) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: state.searchData.length,
                      itemBuilder: (context, index) {
                            
                        final data = state.searchData[index];
                            
                        return NewsTile(
                          title: data.title,
                          description: data.description,
                          imgUrl: data.imageUrl,
                          date: data.pubDate,
                          onTap: () => Navigator.pushNamed(
                            context,
                            NewsPage.screenName,
                            arguments: data
                          )
                        );
                      }
                    ),
                  );
                }

                if( state is SearchInitial ) {
                  return Center(child: Text('initial'));
                }
            
                return const CircularProgressIndicator();
            
              }
            )
      
          ],
        ),
      )
    );
  }

}