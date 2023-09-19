import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/search_note_view.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

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
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchNoteView()),
              );
            },
          ),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
