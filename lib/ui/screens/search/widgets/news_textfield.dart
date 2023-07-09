import 'package:flutter/material.dart';

class NewsTextField extends StatelessWidget {
  const NewsTextField({
    super.key,
    required this.controller,
    required this.onSubmitted
  });

  final TextEditingController controller;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Search something...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          )
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}