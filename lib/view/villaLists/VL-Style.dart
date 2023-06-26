import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/entity/contract.dart';
import '../../model/entity/villa.dart';
import '../../utils/constants.dart';

Widget villaTitle(Villa villa) {
  String? name = villa.name??"";
  String? state = Proviences[villa.state??0];
  String? city = villa.city;
  String? Logo = villa.image1;
  return Wrap(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            padding: EdgeInsets.only(top: 30.h),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(8),
              child: Logo == null
                  ?Image.asset(
                EmptyImg,
                width: 160.w,
                height: 160.h,
              )
                  : Image.memory(
                base64.decode(Logo),
                fit: BoxFit.cover,
                width: 160.w,
                height: 160.h,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    EmptyImg,
                    width: 160.w,
                    height: 160.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          if (Logo == null)
            Positioned.fill(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      SizedBox(width: 30.w,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            name??"",
            style: TextStyle(
              fontSize: 32.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "$state \\ $city"??"",
            style: TextStyle(
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    ],
  );
}
Widget contractTitle(Contract contract, Villa villa) {
  String? name = villa.name??"";
  String? state = Proviences[villa.state??0] ?? "";
  String? city = villa.city;
  String? Logo = villa.image1 ?? "";
  String? startDate = contract.startDate ?? "";
  String? endDate = contract.endDate ?? "";
  String? address = villa.address ?? "";
  return Wrap(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 260.h,
            padding: EdgeInsets.only(top: 30.h),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(8),
              child: Logo == null
                  ?Image.asset(
                EmptyImg,
                width: 200.w,
                height: 200.h,
              )
                  : Image.memory(
                base64.decode(Logo),
                fit: BoxFit.cover,
                width: 200.w,
                height: 200.h,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    EmptyImg,
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          if (Logo == null)
            Positioned.fill(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
      SizedBox(width: 40.w,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            name??"",
            style: TextStyle(
              fontSize: 32.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "$state - $city"??"",
            style: TextStyle(
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            " شروع : $startDate",
            style: TextStyle(
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            " پایان : $endDate",
            style: TextStyle(
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            " آدرس : $address",
            style: TextStyle(
              fontSize: 22.0.sp,
              fontWeight: FontWeight.w400,
              fontFamily: IranSansWeb,
              color: BlackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    ],
  );
}