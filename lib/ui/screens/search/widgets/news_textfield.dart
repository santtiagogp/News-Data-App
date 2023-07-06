import 'package:flutter/material.dart';

class NewsTextField extends StatelessWidget {
  const NewsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Search something...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
    );
  }
}