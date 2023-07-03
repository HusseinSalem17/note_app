import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());

  fetchAllNotes() {
    emit(NotesCubitLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      //get all Notes (return as Iterable)
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesCubitSuccess(notes));
    } catch (e) {
      emit(NotesCubitFailure(e.toString()));
    }
  }
}
