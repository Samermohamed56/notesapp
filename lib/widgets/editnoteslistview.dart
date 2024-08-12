import 'package:flutter/material.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/colors_item.dart';

class Editnoteslistview extends StatefulWidget {
  const Editnoteslistview({super.key, required this.notemodel});
  final Notemodel notemodel;
  @override
  State<Editnoteslistview> createState() => _EditnoteslistviewState();
}

class _EditnoteslistviewState extends State<Editnoteslistview> {
  late int currentindex;
  @override
  void initState() {
    currentindex = colors.indexOf(Color(widget.notemodel.color));
    super.initState();
  }

  List<Color> colors = [
    const Color(0xFFAc3931),
    const Color(0xFFE5D352),
    const Color(0xFFD9E76C),
    const Color(0xFF537D8D),
    const Color(0xFF482C3D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                currentindex = index;
                widget.notemodel.color = colors[index].value;
                setState(() {});
              },
              child: ColorsItem(
                color: colors[index],
                isActive: currentindex == index,
              ),
            ),
          );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
