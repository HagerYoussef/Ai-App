import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ai_app/core/localization/app_localization.dart'; // تأكد من استيراد localization

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        AppLocalizations.of(context)!.translate('skip'),
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}