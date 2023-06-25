import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../utils/constants.dart';
import 'Purchase-style.dart';

class SuccessfulPurchaseScreen extends StatefulWidget {
  var purchase = Get.arguments;

  SuccessfulPurchaseScreen({super.key});

  @override
  State<SuccessfulPurchaseScreen> createState() => _SuccessfulPurchaseState();
}

class _SuccessfulPurchaseState extends State<SuccessfulPurchaseScreen> {

  late int period ;
  late int amount = 0;
  late String name;
  late var owner;
  @override
  void initState() {
    period = widget.purchase[0];
    amount = widget.purchase[1];
    name = widget.purchase[2];
    owner = widget.purchase[3];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              successfulPurchase(),
            ],
          ),
        ),
      ),
    );
  }
  Widget successfulPurchase() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        640.0.w,
        30.0.h,
        640.0.w,
        70.0.h,
      ),
      decoration: BoxDecoration(
        image:
        DecorationImage(image: AssetImage(Purchase), fit: BoxFit.cover),
      ),
      width: 1920.w,
      height: 1080.0.h,
      child: Container(
        color: Color(0xffD2E1D0),
        padding: EdgeInsets.only(left: 80.w, right: 80.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            CircleAvatar(
              backgroundColor: Color(0xff2CBA15),
              child: Image.asset(
                Tick,
                height: 97.h,
                width: 97.w,
              ),
              radius: 60.r,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PurchaseStyle(text: "پرداخت موفق"),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "نام ویلا :"),
                PurchaseStyle(text: name,),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "مبلغ :"),
                Row(
                  children: [
                    PurchaseStyle(text: "${amount}".seRagham()),
                    PurchaseStyle(text: " تومان"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "تاریخ :"),
                PurchaseStyle(text: DateTime.now().toPersianDate()),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "شناسه پرداخت :"),
                PurchaseStyle(text: "12345"),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PurchaseStyle(text: "مدت اقامت :"),
                Row(
                  children: [
                    PurchaseStyle(text: "${period}"),
                    PurchaseStyle(text: " روز"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(HomePage, arguments: owner);
                      },
                      child: PurchaseStyle(text: "بازگشت"),
                      style: buttonStyle_build(190, 55, 10, Color(0xff9FB19F)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
