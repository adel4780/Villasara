import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants.dart';
import '../header-footer/footer.dart';
import '../header-footer/header.dart';
import 'CAR_style.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              ContactUs(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 50.0.h,
        right: 150.0.w,
        bottom: 81.0.h,
      ),
      width: 1920.w,
      height: 600.0.h,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: titleStyle("ارتباط با "),
              ),
              SizedBox(
                height: 20.h,
              ),
              ContactusStyle(
                master: "  تلفن :",
                slave: Phone,
                icon: Icons.call,
              ),
              SizedBox(
                height: 10.h,
              ),
              ContactusStyle(
                master: "  ایمیل :",
                slave: Email,
                icon: Icons.mail,
              ),
              SizedBox(
                height: 10.h,
              ),
              ContactusStyle(
                master: "  آدرس :",
                slave: Address,
                icon: Icons.location_on,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactusStyle(
                    master: "  شبکه های اجتماعی :",
                    slave: "",
                    icon: Icons.campaign,
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Wrap(
                    spacing: 70.r,
                    children: [
                      Image.asset(
                        Instagram,
                        height: 68.h,
                        width: 68.w,
                      ),
                      Image.asset(
                        Twitter,
                        height: 68.h,
                        width: 68.w,
                      ),
                      Image.asset(
                        Telegram,
                        height: 68.h,
                        width: 68.w,
                      ),
                      Image.asset(
                        Linkedin,
                        height: 68.h,
                        width: 68.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 230.w,),
          Column(
            children: [
              SizedBox(height: 30.h,),
              GestureDetector(
                onTap: () {},
                child: Image.asset(Map,height: 400.r, width: 400.r,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
