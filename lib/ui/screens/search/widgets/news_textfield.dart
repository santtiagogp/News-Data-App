import 'package:flutter/material.dart';

class NewsTextField extends StatelessWidget {
  const NewsTextField({
    super.key,
    required this.controller,
    required this.onChanged
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

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
        onChanged: onChanged,
      ),
    );
  }
}