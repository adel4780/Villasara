import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import 'HF_style.dart';

class HeaderPanel extends StatelessWidget {
  HeaderPanel({Key? key, required this.ID}) : super(key: key);
  int ID;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        150.0.w,
        12.0.h,
        143.0.w,
        12.0.h,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFACA1A1),
          ),
        ),
      ),
      width: 1920.w,
      height: 101.0.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 300.0.w,
            height: 84.0.h,
            child: Center(
              child: LogoTextStyle(
                text: 'VillaSara',
              ),
            ),
          ),
          SizedBox(
            width: 600.0.w,
            height: 72.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    /*Get.toNamed(HomePage, arguments: ID);*/
                  },
                  child: warpText('خانه', Icons.home_outlined),
                ),
                SizedBox(
                  width: 40.w,
                ),
                profileMenu(),
                SizedBox(
                  width: 40.w,
                ),
                haveVillas("ویلا های من"),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget profileMenu() {
    return PopupMenuButton(
      child: warpText("پروفایل",Icons.person_outline,),
      onSelected: (String choice) async {
        if (choice == 'view_profile') {
          Get.toNamed(ProfilePage, arguments: ID);
        } else if (choice == 'villa-register') {
          //Get.toNamed(OwnerRegisterPage, arguments: ID);
        } else if (choice == 'exit') {
          //SharedPreferences prefs = await SharedPreferences.getInstance();
          //await prefs.remove('user.api_token');
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'view_profile',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('مشاهده حساب کاربری'),
              SizedBox(width: 8.w),
              Icon(Icons.person_outline),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'villa-register',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ثبت ویلا'),
              SizedBox(width: 8.w),
              Icon(Icons.home_outlined),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'exit',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('خروج'),
              SizedBox(width: 8.w),
              Icon(Icons.exit_to_app_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget haveVillas(String? text) {
    return TextButton(
      onPressed: () => null,//Get.toNamed(VillaListPage, arguments: ID),
      style: TextButton.styleFrom(
        backgroundColor: WhiteColor,
      ),
      child: warpText(text, Icons.home_outlined),
    );
  }

  Widget warpText(String? text, IconData? myIcon) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: SizedBox(
                  width: 8.0.w,
                ),
              ),
              WidgetSpan(
                child: Icon(myIcon,color: BlackColor, size: 35.r),
              ),
              TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: IranSansWeb,
                  color: BlackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

