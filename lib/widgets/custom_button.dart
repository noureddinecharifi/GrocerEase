import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double width;
  final double height;

  const CustomElevatedButton({
    super.key,
    required this.width,
    required this.label,
    required this.onPressed,
    required this.backgroundColor, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle( 
        fixedSize: MaterialStateProperty.all<Size>(
          Size(width, height), // Default height is 50.0
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
