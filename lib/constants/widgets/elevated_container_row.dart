import 'package:flutter/cupertino.dart';

//widget ll rows taa l profile page bsh ma nab9oush naawdou fl code

class ElevatedContainerRow extends StatelessWidget {
  final IconData leadingIcon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const ElevatedContainerRow({super.key, 
    required this.leadingIcon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: textColor,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
