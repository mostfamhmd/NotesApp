import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/search_note_view_body.dart';

class SearchNoteView extends StatelessWidget {
  const SearchNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchNoteViewBody(),
    );
  }
}
