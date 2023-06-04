import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants.dart';
import 'HF_style.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 30.0.h,
        right: 143.0.w,
        //12.0.r,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFACA1A1),
          ),
        ),
      ),
      width: 1920.w,
      height: 335.0.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        Logo,
                        height: 185.h,
                        width: 171.w,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Expanded(
                      child: Image.asset(
                        ENamad,
                        height: 220.h,
                        width: 150.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          buildInfoDialog(context, "درباره ", AboutUsPhrase),
                    );
                  },
                  child: FTextStyle(
                    text: 'درباره ویلا سرا',
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          buildInfoDialog(context, "قوانین ", RulesPhrase),
                    );
                  },
                  child: FTextStyle(
                    text: 'قوانین ویلا سرا',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 45.w,
                      ),
                      FTextStyle(text: "تلفن :"),
                      SizedBox(
                        width: 20.w,
                      ),
                      FTextStyle(text: Phone),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 45.w,
                      ),
                      FTextStyle(text: "ایمیل :"),
                      SizedBox(
                        width: 20.w,
                      ),
                      FTextStyle(text: Email),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 45.w,
                        ),
                        FTextStyle(text: "آدرس :"),
                        SizedBox(
                          width: 20.w,
                        ),
                        FTextStyle(text: Address),
                      ],
                    )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // To DO
                            //go to Instagram
                          },
                          child: Image.asset(
                            Instagram,
                            height: 40.h,
                            width: 40.w,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // ToDO go to Twitter
                          },
                          child: Image.asset(
                            Twitter,
                            height: 40.h,
                            width: 40.w,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // ToDO go to Telegram
                          },
                          child: Image.asset(
                            Telegram,
                            height: 40.h,
                            width: 40.w,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // ToDO go to Linkedin
                          },
                          child: Image.asset(
                            Linkedin,
                            height: 40.h,
                            width: 40.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
