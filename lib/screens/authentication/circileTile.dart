import 'package:flutter/material.dart';

class CircleTile extends StatelessWidget {
  final String imagePath;
  const CircleTile({
    super.key,
    required this.imagePath,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(999),
        color: Colors.grey[200],
      ),
      child: Image(
        image: AssetImage(imagePath),
        height: 50,
      ),
    );
  }
}
