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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          labelText: hintText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              icon,
            color: Colors.purple,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(color: Colors.purple)
          ),
          fillColor: Colors.white70,
          filled: true,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
