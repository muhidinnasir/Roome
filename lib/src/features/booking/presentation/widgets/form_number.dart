import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_text_styles.dart';

class FormNumber extends StatelessWidget {
  const FormNumber({
    super.key,
    required this.number,
    required this.backgroundColor,
  });

  final int number;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.w,
      width: 16.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: AppTextStyles.bottomNavTextStyle.copyWith(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
