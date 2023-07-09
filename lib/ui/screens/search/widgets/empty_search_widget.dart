import 'package:flutter/material.dart';

class InitialSearch extends StatelessWidget {

  const InitialSearch({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Search for news',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black38
            )
          ),
      
          Icon(
            Icons.newspaper,
            color: Colors.orange[200],
            size: 100,
          )
        ],
      ),
    );

  }

}