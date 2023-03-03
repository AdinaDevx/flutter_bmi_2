import 'package:flutter/material.dart';

class GenderContainerWidget extends StatelessWidget {
  const GenderContainerWidget({
    super.key,
    required this.icons,
    required this.genderText,
    required this.horizontal,
    required this.vertical,
    required this.onTap,
    required this.colors,
  });

  final IconData icons;
  final String genderText;
  final double horizontal;
  final double vertical;
  final void Function() onTap;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: Column(
            children: [
              Icon(
                icons,
                size: 85,
                color: Colors.white,
              ),
              Text(
                genderText.toUpperCase(),
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
