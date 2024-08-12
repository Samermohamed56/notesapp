import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/Views/notesview.dart';
import 'package:notesapp/cubits/notescubit/notescubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/simpleblocobserver.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = Simpleblocobserver();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>("notesBox");

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Notescubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const Notesview(),
      ),
    );
  }
}
