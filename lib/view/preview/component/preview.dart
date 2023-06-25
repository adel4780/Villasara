import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villasara_front_end/utils/constants.dart';
import '../../header-footer/footer.dart';
import '../../header-footer/header_panel.dart';
import 'package:villasara_front_end/model/entity/villa.dart';
import 'package:villasara_front_end/model/entity/contract.dart';
import '../../../model/entity/image.dart';
import 'package:villasara_front_end/view_model/contract_viewmodel.dart';

class Date {
  late int d, m, y;
}

class PreviewScreen extends StatefulWidget {
  PreviewScreen({super.key});

  var parameters = Get.arguments;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  var user;
  Villa? villa;
  late Contract contract;

  @override
  void initState() {
    user = widget.parameters[0];
    villa = widget.parameters[1];
    contract = widget.parameters[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: WhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPanel(user: user),
            Preview(
              user: user,
              villa: villa,
              contract: contract,
              id: villa?.id,
              name: villa?.name,
              vilaOwnerid: villa?.villaOwner,
              state: Proviences[(villa!.state ?? 0) + 1] ?? "",
              city: villa?.city,
              region: villa?.region,
              address: villa?.address,
            ),
            Footer(),
          ],
        ),
      ),
    ));
  }
}

class Preview extends StatefulWidget {
  Preview({
    super.key,
    required this.user,
    required this.villa,
    required this.contract,
    required this.id,
    required this.name,
    required this.vilaOwnerid,
    required this.state,
    required this.city,
    required this.region,
    required this.address,
  });

  var user;
  Villa? villa;
  Contract contract;
  late int? id;
  late String? name;
  late int? vilaOwnerid;
  late String? state;
  late String? city;
  late String? region;
  late String? address;
  late String? description;
  late double? pricePerNight;
  late List<VillaImage> images;

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final _viewModel = ContractViewModel();
  String? startdate;
  String? enddate;
  late int amount;
  late int period;
  @override
  void initState() {
    startdate = widget.contract!.startDate;
    enddate = widget.contract!.endDate;
    Date dt1 = Date();
    dt1.d = int.parse(startdate!.substring(8, startdate!.length));
    dt1.m = int.parse(startdate!.substring(5, 7));
    dt1.y = int.parse(startdate!.substring(0, 4));

    Date dt2 = Date();
    dt2.d = int.parse(enddate!.substring(8, enddate!.length));
    dt2.m = int.parse(enddate!.substring(5, 7));
    dt2.y = int.parse(enddate!.substring(0, 4));

    period = getDifference(dt1, dt2);

    widget.contract!.totalPrice =
        amount!.toDouble() * widget.villa!.pricePerNight!.toDouble();

    super.initState();
  }

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
                                      widget.villa!.name ?? "",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: widget.state ?? "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "، ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: widget.region,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: amount.toString(),
                                        ),
                                        TextSpan(
                                          text: " شب ×",
                                        ),
                                        TextSpan(
                                          text: widget.villa!.pricePerNight
                                              .toString(),
                                        ),
                                        TextSpan(
                                          text: " تومان",
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: widget.contract!.totalPrice
                                              .toString(),
                                        ),
                                        TextSpan(
                                          text: " تومان",
                                        ),
                                      ],
                                    ),
                                  ),
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
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "جمع مبلغ قابل پرداخت: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.contract!.totalPrice.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: " تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          HorizonalLine(),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _addContract();
                            },
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
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.contract!.startDate.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: widget.contract!.endDate.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("تعداد مسافران"),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.contract!.peopleCount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " نفر",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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

  var monthDays = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30];
  int countLeapYears(Date d) {
    int years = d.y;

    if (d.m <= 2) {
      years--;
    }

    return ((years / 4) - (years / 100) + (years / 400)).toInt();
  }

  int getDifference(Date dt1, Date dt2) {
    int n1 = dt1.y * 365 + dt1.d;
    for (int i = 0; i < dt1.m - 1; i++) {
      n1 += monthDays[i];
    }
    n1 += countLeapYears(dt1);
    int n2 = dt2.y * 365 + dt2.d;
    for (int i = 0; i < dt2.m - 1; i++) {
      n2 += monthDays[i];
    }
    n2 += countLeapYears(dt2);
    return (n2 - n1) + 1;
  }

  void _addContract() {
    _viewModel.addContract(widget.contract).asStream().listen((event) async {
      if (event.id! > 0) {
        Get.toNamed(
          SuccessfulPurchasePage,
          arguments: [
            period,
            amount,
            widget.contract.totalPrice,
            widget.user,
          ],
        );
      }
    });
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
