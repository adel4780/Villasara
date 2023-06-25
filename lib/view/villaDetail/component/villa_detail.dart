import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:villasara_front_end/model/entity/villa.dart';
import 'package:villasara_front_end/utils/constants.dart';
import '../../../model/entity/person.dart';
import '../../../view_model/person_viewmodel.dart';
import '../../header-footer/footer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../model/entity/image.dart';
import '../../header-footer/header_panel.dart';
import 'package:villasara_front_end/model/entity/contract.dart';

class VillaDetail extends StatefulWidget {
  VillaDetail({super.key});

  var parameters = Get.arguments;

  @override
  State<VillaDetail> createState() => _VillaDetailState();
}

class _VillaDetailState extends State<VillaDetail> {
  late Contract contract;
  late Person user;
  Villa? villa;
  late Person tenant;
  late String _owner_name;
  final _personviewModel = PersonViewModel();
  final List<Person> _owners = [];

  @override
  void initState() {
    user = widget.parameters[0];
    villa = widget.parameters[1];

    if (user.role == guest) {
      tenant = widget.parameters[0];
    }
    findOwner(villa!.villaOwner);
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
            Detail(
              user: user,
              villa: villa,
              tenant: tenant,
              id: villa?.id,
              name: villa?.name,
              vilaOwnerid: villa?.villaOwner,
              villaOwner: _owner_name,
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

  void findOwner(int? id) {
    _personviewModel.searchPersons(id??0);
    _personviewModel.persons.stream.listen((list) async {
      setState(() {
        _owners.addAll(list);
      });
      if (_owners.isNotEmpty) {
        for (var item in _owners) {
          String? firstName = item.first_name;
          String? lastName = item.last_name;
          _owner_name = "$firstName $lastName" ?? '';
        }
      }
    });
  }
}

final List<String> imgList = [
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
  "assets/images/villa_img.png",
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
  Detail({
    super.key,
    required this.user,
    required this.villa,
    required this.tenant,
    required this.id,
    required this.name,
    required this.vilaOwnerid,
    required this.villaOwner,
    required this.state,
    required this.city,
    required this.region,
    required this.address,
  });
  Person user;
  Villa? villa;
  Person tenant;
  late int? id;
  late String? name;
  late int? vilaOwnerid;
  late String? villaOwner;
  late String? state;
  late String? city;
  late String? region;
  late String? address;
  late String? description;
  late double? pricePerNight;
  late List<VillaImage> images;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Contract contract;

  final CarouselController _controller = CarouselController();
  int _current = 0;
  int _counter = 0;

  String startDay = '';
  String endDay = '';

  @override
  void initState() {
    contract.villaOwner = widget.vilaOwnerid;
    contract.villa = widget.id;
    contract.tenant = widget.tenant.id;
    super.initState();
  }

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
                widget.name ?? "",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on),
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
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: "به میزبانی "),
                              TextSpan(text: widget.villaOwner),
                            ],
                          ),
                        ),
                        HorizonalLine(),
                        Text(
                          "درباره‌ی اقامتگاه",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(widget.description ?? ""),
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
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(text: "شروع از "),
                                TextSpan(
                                    text:
                                        widget.pricePerNight.toString() ?? ""),
                                const TextSpan(text: "تومان / هرشب"),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              right: 10,
                              left: 10,
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
                                      contract.startDate = startDay;
                                      contract.endDate = endDay;
                                      contract.totalPrice = (double.parse(
                                                  endDay.substring(
                                                      8, endDay.length)) -
                                              double.parse(startDay.substring(
                                                  8, startDay.length))) *
                                          widget.pricePerNight!.toInt();
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
                            onPressed: () {
                              Get.toNamed(PreviewPage, arguments: [
                                widget.user,
                                widget.villa,
                                contract,
                              ]);
                            },
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
