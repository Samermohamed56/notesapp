import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custumappbar.dart';
import 'package:notesapp/widgets/noteslistview.dart';

class Notesviewbody extends StatelessWidget {
  const Notesviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Custumappbar(
          title: "Notes",
          icon: Icons.search,
        ),
        SizedBox(
          height: 10,
        ),
        Noteslistview(),
      ],
    );
  }
}
