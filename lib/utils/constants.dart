import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Colors
const Color WhiteColor = Color(0xFFFFFFFF);
const Color BlackColor = Color(0xff000000);
const Color LightBlueColor = Color(0xff1fdada);
const Color DarkBlueColor = Color(0xff0080fc);
const Color GreyColor = Color(0xff5d5d5d);

// Pages
String MaskGroupPage = "/maskgroupPage";
String RulesPage = "/rulePage";
String AboutPage = "/aboutPage";
String ContactUsPage = "/contactUsPage";
String HomePage = "/homePage";
String SuccessfulPurchasePage = "/successfulPurchasePage";
String UnSuccessfulPurchasePage = "/unSuccessfulPurchasePage";
String ProfilePage = "/profilepage";

//Strings, Names, Address
String AppName = "ویلا سرا";
String AppNameEn = "VillaSara";
String AppVersion = "";
String Phone = "35269854 (031)";
String Email = "villaSara@gmail.com";
String Name = "";
String Address = "اصفهان - میدان آزادی - دانشگاه اصفهان";

// Images
String Linkedin = "assets/images/linkedin.png";
String Twitter = "assets/images/twitter.png";
String Instagram = "assets/images/instagram.png";
String Telegram = "assets/images/telegram-app.png";
String Logo = "assets/images/logo.png";
String ENamad = "assets/images/enamad.png";
String Map = "assets/images/map.png";
String Tick = "assets/images/Tick.png";
String Zabdar = "assets/images/zabdar.png";
String Purchase = "assets/images/purchase.jpg";
String VillaBack = "assets/images/villaBackground.jpg";

// Fonts
String IranSansWeb = "IranSansWeb";
String FugazOne = "FugazOne";

String AboutUsPhrase =
    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه \nروزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود\n ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را\n می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی \nایجاد کرد."
;
String RulesPhrase =
    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه \nروزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود\n ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را\n می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی \nایجاد کرد."
;

ButtonStyle buttonStyle_build(int width, int height, int radius,Color color){
  return ButtonStyle(
    backgroundColor:
    MaterialStateProperty.all<Color>(color),
    elevation: MaterialStateProperty.all<double>(0.0),
    padding:
    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(width.w, height.h),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
    ),
  );
}
Widget buildInfoDialog(BuildContext context, String? text, String? Phrase) {
  return AlertDialog(
    title: titleStyle(text ?? ""),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        phraseStyle(Phrase!),
      ],
    ),
    actions: <Widget>[
      Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'متوجه شدم',
            style: TextStyle(
              color: BlackColor,
              fontFamily: IranSansWeb,
              fontSize: 24.sp,
            ),
          ),
          style: buttonStyle_build(190, 55, 10, LightBlueColor),
        ),
      ),
    ],
  );
}
Widget titleStyle(String text) {
  return RichText(
    text: TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 36.0.sp,
        fontWeight: FontWeight.w400,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
      children: [
        TextSpan(
          text: AppName,
          style: TextStyle(
            fontSize: 36.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: IranSansWeb,
            color: DarkBlueColor,
          ),
        ),
      ],
    ),
  );
}
Widget phraseStyle(String text) {
  return DefaultTextStyle(
    style: TextStyle(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: IranSansWeb,
      color: BlackColor,
      overflow: TextOverflow.ellipsis,
    ),
    child: SelectableText(text, textAlign: TextAlign.justify,
    ),
  );
}
