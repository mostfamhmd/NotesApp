import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/search_bar.dart';
import 'package:notes_app/views/widgets/search_list_view.dart';

class SearchNoteViewBody extends StatefulWidget {
  const SearchNoteViewBody({super.key});

  @override
  State<SearchNoteViewBody> createState() => _SearchNoteViewBodyState();
}

class _SearchNoteViewBodyState extends State<SearchNoteViewBody> {
  String? title;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 24 / dimensions.sizeWidth),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 50 / dimensions.sizeHeight,
          ),
          SearchBarView(
            onPressedSearch: () {
              BlocProvider.of<NotesCubit>(context).searchNote(title);
              setState(() {});
            },
            onPressedBack: () {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: screenHeight * 50 / dimensions.sizeHeight,
          ),
          CustomTextField(
            hint: "title",
            onChanged: (value) {
              title = value.toLowerCase();
            },
          ),
          SizedBox(
            height: screenHeight * 50 / dimensions.sizeHeight,
          ),
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              List<NoteModel> searchedNotes =
                  BlocProvider.of<NotesCubit>(context).results ?? [];
              return Expanded(
                  child: (title == null || searchedNotes.isEmpty)
                      ? const Center(
                          child: Text(
                            "Not Found",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : SearchListView(
                          title: title!,
                          notesResults: searchedNotes,
                        ));
            },
          )
        ],
      ),
    );
  }
}
