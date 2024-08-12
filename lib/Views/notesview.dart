import 'package:flutter/material.dart';
import 'package:notesapp/Views/addnotebuttonview.dart';
import 'package:notesapp/widgets/notesviewbody.dart';

class Notesview extends StatelessWidget {
  const Notesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(176, 124, 77, 255),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const Addnotebuttonview();
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const Notesviewbody(),
    );
  }
}
