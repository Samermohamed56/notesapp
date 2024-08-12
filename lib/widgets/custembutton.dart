import 'package:flutter/material.dart';

class CustemButton extends StatelessWidget {
  const CustemButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isLoading = false,
  });

  final String buttonText;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color.fromARGB(255, 109, 232, 248), // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0), // Padding
          elevation: 5, // Shadow
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  buttonText,
                  style: const TextStyle(color: Colors.black),
                ),
        ),
      ),
    );
  }
}
