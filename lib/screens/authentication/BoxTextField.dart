import 'package:flutter/material.dart';
import 'package:covoiturage/constants/app_colors.dart';

class BoxTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  const BoxTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(icon),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.quintenaryColor)
          ),
          fillColor: Colors.white70,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          hintMaxLines: 2,

        ),
        obscureText: obscureText,
      ),
    );
  }
}
