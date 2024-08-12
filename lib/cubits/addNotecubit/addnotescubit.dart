import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/models/notemodel.dart';

part 'addnotesstate.dart';

class AddNotescubit extends Cubit<AddNotesState> {
  AddNotescubit() : super(AddNotesInitial());
  Color? color=const Color(0xFFAc3931);
  addNotes(Notemodel note) async {
    note.color = color!.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<Notemodel>("notesBox");

      await notesBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(
        AddNotesFailur(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
