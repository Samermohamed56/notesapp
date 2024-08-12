import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/models/notemodel.dart';

part 'notesstate.dart';

class Notescubit extends Cubit<NotesState> {
  Notescubit() : super(NotesInitial());
   List<Notemodel>? notes;
  fetchAllNotes() async {
    
      var notesBox = Hive.box<Notemodel>("notesBox");
     notes = notesBox.values.toList();

      emit(NotesSuccess());
    
  }
}
