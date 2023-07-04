import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

//Hive (from flutter (package))
class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Colors.blue;
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    //to get my box (notesBox), to use this box and add or any other operation (must detect the type of box to let his method take the same type)
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      //i can put add(note) because i made register to this type (typeAdapter)(add take dynamic type)
      //if didn't make registerAdapter to (noteModel) will get error
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
