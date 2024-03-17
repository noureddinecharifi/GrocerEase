import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const CategoryItem(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 8),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
      width: 100,
           decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
