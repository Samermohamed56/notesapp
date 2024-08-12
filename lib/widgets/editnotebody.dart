import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notescubit/notescubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/custemtextfield.dart';
import 'package:notesapp/widgets/custumappbar.dart';

class Editnotebody extends StatefulWidget {
  const Editnotebody({super.key, required this.notemodel});
  final Notemodel notemodel;

  @override
  State<Editnotebody> createState() => _EditnotebodyState();
}

class _EditnotebodyState extends State<Editnotebody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Custumappbar(
          onPressed: () {
            widget.notemodel.title = title ?? widget.notemodel.title;
            widget.notemodel.subtitle = subtitle ?? widget.notemodel.subtitle;
            widget.notemodel.save();
            BlocProvider.of<Notescubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          title: "Edit Note",
          icon: Icons.check,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustemTextField(
                initialValue: widget.notemodel.title,
                onChanged: (p0) {
                  title = p0;
                },
                hintText: "Title",
              ),
              CustemTextField(
                initialValue: widget.notemodel.subtitle,
                onChanged: (p0) {
                  subtitle = p0;
                },
                hintText: "Subtitle",
                maxLines: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
