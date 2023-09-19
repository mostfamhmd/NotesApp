// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  NoteItem({Key? key, required this.note, this.cubit = true, this.title = ""})
      : super(key: key);
  bool cubit;
  final NoteModel note;
  String title;
  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: widget.note,
            );
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(widget.note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.only(
          left: screenWidth * 16 / dimensions.sizeWidth,
          top: screenHeight * 24 / dimensions.sizeHeight,
          bottom: screenHeight * 24 / dimensions.sizeHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                widget.note.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  widget.note.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  widget.note.delete();
                  if (widget.cubit == true) {
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  } else {
                    BlocProvider.of<NotesCubit>(context)
                        .searchNote(widget.title);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 24 / dimensions.sizeWidth),
              child: Text(
                widget.note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
