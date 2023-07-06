import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/widgets/news_tile.dart';

import 'widgets/news_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [

              const NewsTextField(),

              const SizedBox( height: 20 ),

              const Center(child: Text('35 Results:')),

              const SizedBox( height: 20 ),

              NewsTile(
                title: 'Im a title wooooooooow',
                description: 'Cillum aliqua deserunt do deserunt. Commodo ad ad aliquip occaecat adipisicing velit. Sit duis dolore amet non non. Id nulla aute ullamco sint Lorem et enim enim proident laboris. Nulla non et nulla aute dolore fugiat consequat ad. Deserunt incididunt nisi nostrud excepteur officia excepteur duis.',
                imgUrl: 'https://media.vogue.mx/photos/5e9f0aef8966aa000859aac6/1:1/w_2264,h_2264,c_limit/como-hacer-el-peinado-de-ariana-grande.jpg',
                date: DateTime.parse('2023-07-05 23:54:04'),
                onTap: (){}
              )

            ],
          ),
        )
      ),
    );
  }
}