import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView(
      {super.key, required this.notesResults, required this.title});
  final List<NoteModel> notesResults;
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 16 / dimensions.sizeHeight),
      child: ListView.builder(
          itemCount: notesResults.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 4 / dimensions.sizeHeight),
              child: NoteItem(
                cubit: false,
                title: title,
                note: notesResults[index],
              ),
            );
          }),
    );
  }
}
