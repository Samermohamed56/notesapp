import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/addNotecubit/addnotescubit.dart';
import 'package:notesapp/cubits/notescubit/notescubit.dart';
import 'package:notesapp/widgets/addnoteform.dart';

class Addnotebuttonview extends StatelessWidget {
  const Addnotebuttonview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotescubit(),
      child: BlocConsumer<AddNotescubit, AddNotesState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AddNotesFailur) {
           
          } else if (state is AddNotesSuccess) {
            BlocProvider.of<Notescubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
