import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villasara_front_end/utils/constants.dart';
import '../../header-footer/footer.dart';
import '../../header-footer/header_panel.dart';

class PreviewScreen extends StatefulWidget {
  PreviewScreen({super.key});

  var parameters = Get.arguments;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: WhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPanel(user: widget.parameters[0] /*ID: widget.parameters[0]*/),
            Preview(/*villa : widget.parameters[1]*/),
            Footer(),
          ],
        ),
      ),
    ));
  }
}

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: BlackColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/villa_img.png",
                                height: 100,
                                width: 200,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ویلا سه خوابه استخردار چهارفصل چهارباغ کردان",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "البرز، کردان",
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          HorizonalLine(),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("جزئیات پرداخت"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("٢ شب × ٥٬٠٠٠٬٠٠٠ تومان"),
                                  Text("١٠٬٠٠٠٬٠٠٠ تومان"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          HorizonalLine(),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "جمع مبلغ قابل پرداخت:   ١٠٬٠٠٠٬٠٠٠ تومان",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          HorizonalLine(),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "پرداخت",
                              style: TextStyle(color: WhiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BlackColor,
                              minimumSize: Size(300, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("تاریخ رزرو"),
                      Text(
                        "20 خرداد - 22 خرداد",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("تعداد مسافران"),
                      Text(
                        "2 نفر",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(alignment: Alignment.center, child: HorizonalLine()),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "قوانین لغو",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "تا 18 خرداد",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("پرداخت کامل وجه به مهمان"),
                  SizedBox(height: 20),
                  Text(
                    "از 18 خرداد تا 20 خرداد",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("20٪ مبلغ شب اول + 10٪ مبلغ شب‌های باقیمانده"),
                  SizedBox(height: 20),
                  Text(
                    "از 20 خرداد تا 21 خرداد",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("100٪ مبلغ شب‌های سپری شده + 20٪ مبلغ شب‌های باقیمانده"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HorizonalLine extends StatelessWidget {
  const HorizonalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width * 0.45,
      color: BlackColor,
    );
  }
}
