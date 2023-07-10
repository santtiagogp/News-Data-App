import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/helpers/news_navigator.dart';
import '../home/widgets/news_tile.dart';
import '../news/news_page.dart';
import 'search_bloc/search_bloc.dart';
import 'widgets/empty_search_widget.dart';
import 'widgets/news_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final txtController = TextEditingController();

    final bloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20 ),
              child: NewsTextField(
                controller: txtController,
                onSubmitted: ( value ) => bloc.add(SearchData(value)),
              ),
            ),
            
            BlocBuilder<SearchBloc, SearchState>(
              builder: ( context, state ) {
            
                if( state is SearchLoading ) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
            
                if( state is SearchDataLoaded ) {
            
                  final data = state.searchData;
                  
                  return Expanded(
                    child: Column(
                      children: [

                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Results: ${data.length}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return NewsTile(
                                title: data[index].title,
                                imgUrl: data[index].imageUrl,
                                date: data[index].pubDate,
                                onTap: () => Helpers.navigateToNews(
                                  
                                  context,
                                  data[index],
                                  NewsPage.screenName
                                )
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  );
                }
            
                return const InitialSearch();
            
              }
            )
            
          ],
        ),
    );
  }

}