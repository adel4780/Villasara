import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:villasara_front_end/utils/constants.dart';
import 'package:villasara_front_end/view/profile/component/profile.dart';
import 'package:villasara_front_end/view/villaregistration/components/villaEdit.dart';
import 'package:villasara_front_end/view/villaregistration/components/villaRegistration.dart';
import 'view/car/aboutUs.dart';
import 'view/car/contact.dart';
import 'view/car/rules.dart';
import 'view/homepage/home-page.dart';
import 'view/maskgroup/components/maskGroup.dart';
import 'view/preview/component/preview.dart';
import 'view/purchase/successful.dart';
import 'view/purchase/unSuccessful.dart';

import 'firebase_options.dart';
import 'view/villaDetail/component/villa_detail.dart';
import 'view/villaLists/villa-list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
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
            GetPage(name: MaskGroupPage, page: () => MaskGroupScreen()),
            GetPage(name: RulesPage, page: () => RulesScreen()),
            GetPage(name: AboutPage, page: () => AboutScreen()),
            GetPage(name: ContactUsPage, page: () => ContactUsScreen()),
            GetPage(name: ProfilePage, page: () => UserRegisterScreen()),
            GetPage(name: VillaRegistrationPage, page: () => VillaRegisterScreen()),
            GetPage(name: VillaEditPage, page: () => VillaEditScreen()),
            GetPage(name: HomePage, page: () => HomeScreen()),
            GetPage(name: VillaListPage, page: () => MyVillaScreen()),
            GetPage(name: VillaDetailPage, page: () => VillaDetail()),
            GetPage(name: PreviewPage, page: () => PreviewScreen(),),
            GetPage(name: SuccessfulPurchasePage, page: () => SuccessfulPurchaseScreen()),
            GetPage(name: UnSuccessfulPurchasePage, page: () => UnSuccessfulPurchaseScreen()),
          ],
          initialRoute: MaskGroupPage,
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
