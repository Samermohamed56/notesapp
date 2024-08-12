import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/widgets/colors_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentindex = 0;
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
                BlocProvider.of<AddNotescubit>(context).color = colors[index];
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
