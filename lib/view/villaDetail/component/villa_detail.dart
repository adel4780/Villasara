import 'package:flutter/material.dart';
import 'package:villasara_front_end/utils/constants.dart';
import '../../header-footer/footer.dart';
import '../../header-footer/header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class VillaDetail extends StatefulWidget {
  const VillaDetail({super.key});

  @override
  State<VillaDetail> createState() => _VillaDetailState();
}

class _VillaDetailState extends State<VillaDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: WhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Detail(),
            Footer(),
          ],
        ),
      ),
    ));
  }
}

final List<String> imgList = [
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
];

final List<String> facilitiesList = [
  "آب",
  "شوفاژ",
  "برق",
  "کولر آبی",
  "گاز",
  "مبلمان",
  "سرویس بهداشتی فرنگی",
  "رستوران",
  "حمام",
  "لابی",
  "آسانسور",
  "سالن کنفرانس",
  "بخاری",
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
          ),
        ))
    .toList();

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  int _counter = 0;

  String startDay = '';
  String endDay = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "اجاره ویلا سه خوابه استخردار چهار فصل چهار باغ کردان",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    "البرز، کردان",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 400,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    carouselController: _controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                          margin: EdgeInsets.only(right: 70),
                          child: ElevatedButton(
                            onPressed: () => _controller.previousPage(),
                            child: Icon(Icons.arrow_left_outlined),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                          margin: EdgeInsets.only(left: 70),
                          child: ElevatedButton(
                            onPressed: () => _controller.nextPage(),
                            child: Icon(Icons.arrow_right_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (const Color(0xFF8B98B1))
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ویلا",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text("به میزبانی صادق فلاح"),
                        HorizonalLine(),
                        Text(
                          "درباره‌ی اقامتگاه",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("۴۰۰ متر زیربنا۱۰۰۰ متر کل بنا۳ اتاق"),
                        Text(
                          "ظرفیت",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("ظرفیت تا ۱۰ نفر (۷ نفر پایه + تا ۳ نفر اضافه)"),
                        Text(
                          "سرویس‌های خواب",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("۲ تخت دو نفره۲ تخت یک نفره۳ رخت‌خواب سنتی"),
                        Text(
                          "سرویس‌های بهداشتی",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("سرویس ایرانی ندارد۴ سرویس فرنگی۴ حمام"),
                        HorizonalLine(),
                        Text(
                          "امکانات اقامتگاه",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: facilitiesList.length,
                                itemBuilder: (context, index) {
                                  if (index % 2 == 0) {
                                    String i = facilitiesList[index];
                                    return Text("$i");
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: facilitiesList.length,
                                itemBuilder: (context, index) {
                                  if (index % 2 != 0) {
                                    String i = facilitiesList[index];
                                    return Text("$i");
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        HorizonalLine(),
                        Text(
                          "نفر اضافه",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            "هزینه‌ای که برای نفرات بیش از استاندارد (سرویس خواب و …) به مبلغ رزرو اضافه می‌شود."),
                        Text("قیمت هر نفر اضافه به ازای هر شب: 500 هزار تومان"),
                        HorizonalLine(),
                        Text(
                          "تخفیف‌ها",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("برای اقامت‌های کوتاه‌مدت 10٪ تخفیف لحاظ می‌شود."),
                        HorizonalLine(),
                        Text(
                          "قوانین و مقررات اقامتگاه",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ساعت ورود"),
                                Text(
                                  "02:00 (بعدازظهر)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ساعت خروج"),
                                Text(
                                  "11:00 (صبح)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: 300,
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
                          Text("شروع از: 4,800,000 تومان / هرشب"),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              right: 10,
                              left: 10,
                              //bottom: 5,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  var picked = await showPersianDateRangePicker(
                                    context: context,
                                    initialDateRange: JalaliRange(
                                      start: Jalali.now(),
                                      end: Jalali.now(),
                                    ),
                                    firstDate: Jalali.now(),
                                    lastDate: Jalali(1450, 9),
                                  );
                                  setState(
                                    () {
                                      startDay = picked?.start
                                              .toJalaliDateTime()
                                              .substring(0, 10) ??
                                          "";
                                      endDay = picked?.end
                                              .toJalaliDateTime()
                                              .substring(0, 10) ??
                                          "";
                                    },
                                  );
                                },
                                child: Table(
                                  border: TableBorder.all(
                                      borderRadius: BorderRadius.circular(20)),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "تاریخ ورود",
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "$startDay",
                                              style: TextStyle(
                                                color: DarkBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "تاریخ خروج",
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "$endDay",
                                              style: TextStyle(
                                                color: DarkBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              right: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: BlackColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "تعداد مسافر",
                                        textAlign: TextAlign.right,
                                      ),
                                      Text(
                                        "$_counter نفر",
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: _decrementCounter,
                                    icon: Icon(
                                      Icons.remove,
                                      color: BlackColor,
                                    ),
                                  ),
                                  Text("$_counter"),
                                  IconButton(
                                    onPressed: _incrementCounter,
                                    icon: Icon(
                                      Icons.add,
                                      color: BlackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "رزرو",
                              style: TextStyle(color: WhiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BlackColor,
                              minimumSize: Size(250, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
      height: 0.8,
      width: MediaQuery.of(context).size.width * 0.7,
      color: BlackColor,
    );
  }
}
