import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Views/editnoteview.dart';
import 'package:notesapp/cubits/notescubit/notescubit.dart';
import 'package:notesapp/models/notemodel.dart';

class Noteitem extends StatelessWidget {
  const Noteitem({super.key, required this.notemodel});
  final Notemodel notemodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 24,
        right: 24,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return  Editnoteview(notemodel: notemodel,);
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Color(notemodel.color),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  notemodel.title,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  notemodel.subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(125, 0, 0, 0),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    notemodel.delete();
                    BlocProvider.of<Notescubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 37,
                ),
                child: Text(
                  notemodel.date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(137, 0, 0, 0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
