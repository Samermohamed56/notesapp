import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custemsearchicon.dart';

class Custumappbar extends StatelessWidget {
  const Custumappbar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const Spacer(),
          CustumIcon(
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
