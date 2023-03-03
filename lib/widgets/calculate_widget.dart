import 'package:flutter/material.dart';
import 'package:flutter_bmi_2/constans/text_styles/app_text_styles.dart';

class CalculateWidget extends StatelessWidget {
  const CalculateWidget({
    super.key,
    required this.labal,
    this.onTap,
  });

  final String labal;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: const Color(0xff0B0120),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            labal.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTextStyles.white40w800,
          ),
        ),
      ),
    );
  }
}
