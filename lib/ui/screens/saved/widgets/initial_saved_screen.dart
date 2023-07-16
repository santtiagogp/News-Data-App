import 'package:flutter/material.dart';

class InitialSavedScreen extends StatelessWidget {
  const InitialSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Here will show your Bookmarked News',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20),
          Icon(
            Icons.bookmark,
            color: Colors.orange.shade200,
            size: 70
          )
        ],
      ),
    );
  }
}