import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notescubit/notescubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/noteitem.dart';

class Noteslistview extends StatelessWidget {
  const Noteslistview({super.key});
  final data = const [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Notescubit, NotesState>(
      builder: (context, state) {
        BlocProvider.of<Notescubit>(context).fetchAllNotes();
        List<Notemodel> notes =
            BlocProvider.of<Notescubit>(context).notes?? [];
            
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>  Noteitem(notemodel: notes[index],),
          ),
        );
      },
    );
  }
}
