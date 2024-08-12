import 'package:flutter/material.dart';

class CustemTextField extends StatelessWidget {
  const CustemTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1, this.onSaved, this.onChanged, this.initialValue,
  });
final String? initialValue;
  final String hintText;
  final void Function(String?)? onSaved;
final int maxLines;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue:initialValue ,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        validator: (value)
        {
          if (value?.isEmpty ?? true)
          {
            return 'Field is required';
          }else {return null;}
          
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(164, 255, 255,
                255), // Make sure this color is visible against your background
            fontSize: 16,
          ),
          fillColor:
              Colors.white.withOpacity(0.1), // Adjust the opacity if needed
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 128, 157, 206), width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
      ),
    );
  }
}
