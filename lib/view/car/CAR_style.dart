import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants.dart';
class ContactusStyle extends StatelessWidget {
  final String master;
  final String slave;
  final IconData icon;
  const ContactusStyle({super.key, required this.master, required this.slave, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children:[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              WidgetSpan(child: Icon(icon,color: BlackColor,size: 35.r),),
              TextSpan(
                text: master,
                style: TextStyle(
                  fontSize: 32.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: IranSansWeb,
                  color: BlackColor,
                ),
              ),
            ],
          ),
        ),
        if(slave.isNotEmpty)
          SizedBox(width:280.w),
        Text(
          slave,
          style: TextStyle(
            fontSize: 32.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: IranSansWeb,
            color: BlackColor,
          ),
        ),
      ],
    );
  }
}

