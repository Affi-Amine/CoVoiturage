import 'package:flutter/material.dart';

class ElevatedContainerRow extends StatefulWidget {
  final IconData leadingIcon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const ElevatedContainerRow({
    required this.leadingIcon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _ElevatedContainerRowState createState() => _ElevatedContainerRowState();
}

class _ElevatedContainerRowState extends State<ElevatedContainerRow> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    widget.leadingIcon,
                    color: widget.textColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: widget.textColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
