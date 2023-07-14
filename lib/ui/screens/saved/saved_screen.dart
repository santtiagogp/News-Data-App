import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/screens/saved/saved_bloc/saved_bloc.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved News'),
        centerTitle: false,
      ),
      body: BlocBuilder<SavedBloc, SavedState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}