import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? results;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  List<NoteModel>? searchNote(String? searchText) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    results = (searchText == null || searchText == '')
        ? notesBox.values.toList().reversed.toList() // whole list
        : notesBox.values
            .where((c) => c.title.toLowerCase().contains(searchText))
            .toList()
            .reversed
            .toList();
    //print(results);
    emit(NotesSuccess());
    return results;
  }
}
