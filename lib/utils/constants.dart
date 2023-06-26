import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/entity/person.dart';

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
String VillaRegistrationPage = "/villaregistrationpage";
String VillaEditPage = "/villaeditpage";
String VillaDetailPage = "/villaDetailPage";
String VillaListPage = "/villaListPage";
String PreviewPage = "/preiewPage";
//Strings, Names, Address
String AppName = "ویلا سرا";
String AppNameEn = "VillaSara";
String AppVersion = "";
String Phone = "35269854 (031)";
String Email = "villaSara@gmail.com";
String Name = "";
String Address = "اصفهان - میدان آزادی - دانشگاه اصفهان";
String guest = "guest";
String host = "host";
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
String MaskGroupimg = "assets/images/maskPage.png";
String EmptyImg = "assets/images/emptyImage.png";
String SadFace = "assets/images/sadface.png";
// Fonts
String IranSansWeb = "IranSansWeb";
String FugazOne = "FugazOne";

String AboutUsPhrase =
    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه \nروزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود\n ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را\n می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی \nایجاد کرد."
;
String RulesPhrase =
    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه \nروزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود\n ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را\n می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی \nایجاد کرد.";

List<String> Proviences = [
  'آذربایجان شرقی',
  'آذربایجان غربی',
  'اردبیل',
  'اصفهان',
  'البرز',
  'ایلام',
  'بوشهر',
  'تهران',
  'چهارمحال و بختیاری',
  'خراسان جنوبی',
  'خراسان رضوی',
  'خراسان شمالی',
  'خوزستان',
  'زنجان',
  'سمنان',
  'سیستان و بلوچستان',
  'فارس',
  'قزوین',
  'قم',
  'کردستان',
  'کرمان',
  'کرمانشاه',
  'کهکیلویه و بویراحمد',
  'گلستان',
  'گیلان',
  'لرستان',
  'مازندران',
  'مرکزی',
  'هرمزگان',
  'همدان',
  'یزد'
];

ButtonStyle buttonStyle_build(int width, int height, int radius, Color color) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(color),
    elevation: MaterialStateProperty.all<double>(0.0),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
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
    child: SelectableText(
      text,
      textAlign: TextAlign.justify,
    ),
  );
}

Widget villaTextStyle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 34.sp,
      fontFamily: IranSansWeb,
      color: BlackColor,
    ),
  );
}

Widget buttonTextStyle(String? text) {
  return Text(
    text ?? "",
    style: TextStyle(
      fontSize: 24.sp,
      fontFamily: IranSansWeb,
      color: BlackColor,
    ),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(
      left: 150.0.w,
      top: 51.0.h,
      right: 150.0.w,
    ),
    width: 1920.w,
    height: 700.h,
    child: Center(
      child: SpinKitCircle(
        size: 140.r,
        duration: Duration(seconds: 2),
        itemBuilder: (context, index) {
          final colors = [LightBlueColor, DarkBlueColor];
          final color = colors[index % colors.length];
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    ),
  );
}
bool tenantOrOwner(Person person){
  bool TeOw = false;
  if(person.role == guest){
    TeOw = false;
  }else{
    TeOw = true;
  }
  return TeOw;
}
