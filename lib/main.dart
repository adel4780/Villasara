import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:villasara_front_end/utils/constants.dart';
import 'package:villasara_front_end/view/profile/component/profile.dart';
import 'view/car/aboutUs.dart';
import 'view/car/contact.dart';
import 'view/car/rules.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920.0, 1080.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: [
            //GetPage(name: MaskGroupPage, page: () => MaskGroupScreen()),
            GetPage(name: RulesPage, page: () => RulesScreen()),
            GetPage(name: AboutPage, page: () => AboutScreen()),
            GetPage(name: ContactUsPage, page: () => ContactUsScreen()),
            GetPage(name: ProfilePage, page: () => UserRegisterScreen()),
            //GetPage(name: HomePage, page: () => HomeScreen()),
            //GetPage(name: OwnerRegisterPage, page: () => OwenerRegisterScreen()),
            //GetPage(name: EditOwnerRegisterPage, page: () => EditOwenerRegisterScreen()),
            //GetPage(name: ProfilePage, page: () => EditProfileDialog(),),
            //GetPage(name: SuccessfulPurchasePage, page: () => SuccessfulPurchaseScreen()),
            //GetPage(name: UnSuccessfulPurchasePage, page: () => UnSuccessfulPurchaseScreen()),
          ],
          //initialRoute: ,
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.noTransition,
          theme: ThemeData(primarySwatch: LightBlueColor.toMaterialColor(),),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}
