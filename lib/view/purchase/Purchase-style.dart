import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class PurchaseStyle extends StatelessWidget {
  final String text;
  const PurchaseStyle({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
        fontSize: 26.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    );
  }
}
