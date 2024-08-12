import 'package:flutter/material.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/editnotebody.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key, required this.notemodel});
final Notemodel notemodel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Editnotebody(notemodel: notemodel,),
    );
  }
}
