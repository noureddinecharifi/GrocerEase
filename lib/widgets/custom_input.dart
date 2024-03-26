import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      required this.obscure,
      required this.hintText,
      required this.validator,
      required this.controller,
      required this.prefixIcon});

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffF4F4F4),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20)),
            hintStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(20)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.background,
            prefixIconColor: Theme.of(context).colorScheme.onBackground,
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            suffixIcon: obscure
                ? IconButton(
                    icon: const Icon(
                      Icons.visibility,
                    ),
                    onPressed: () {},
                  )
                : null,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
