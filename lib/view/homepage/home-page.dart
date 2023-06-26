import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:villasara_front_end/view/header-footer/header_panel.dart';
import 'package:villasara_front_end/view_model/villa_viewmodel.dart';
import '../../model/entity/person.dart';
import '../../model/entity/villa.dart';
import '../../utils/constants.dart';
import '../header-footer/footer.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  Person user = Get.arguments;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _gotFromServer = false;
  late List<Villa> villas = [];
  final villaViewModel = VillaViewModel();

  @override
  void initState() {
    loadData().then(
      (value) => Timer(
        Duration(seconds: 4),
        () {
          setState(
            () {
              _gotFromServer = villas.isNotEmpty;
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPanel(user: widget.user),
              putHomeImage(),
              SizedBox(
                height: 10.h,
              ),
              search(),
              SizedBox(
                height: 10.h,
              ),
              _gotFromServer != false
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: showVillaList())
                  : loading(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget search() {
    void updateQuantities(List<Villa> updatedVillas) {
      setState(() {
        villas = [...updatedVillas]; // update the villa list
      });
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: IconButton(
            icon: const Icon(
              Icons.search,
              size: 24,
              color: BlackColor,
            ),
            onPressed: () async {
              List<Villa> updatedVillas = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    searchVillas: villas,
                    onSearch: updateQuantities,
                    user: widget.user,
                    // pass updateQuantities as a callback
                  ),
                ),
              );
              if (updatedVillas != null) {
                // check if the user pressed back or not
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }

  Widget putHomeImage() {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 57.0.h,
        right: 150.0.w,
        bottom: 81.0.h,
      ),
      width: 1920.w,
      height: 1000.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(MaskGroupimg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget showVillaList() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: List.generate(
            villas.length,
            (index) {
              final villa = villas[index];
              return Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () {
                    if(widget.user.role == guest) {
                      Get.toNamed(VillaDetailPage,
                          arguments: [widget.user, villa]);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10.h, right: 20.h),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: BlackColor,
                        ),
                        right: BorderSide(
                          color: BlackColor,
                        ),
                        left: BorderSide(
                          color: BlackColor,
                        ),
                        bottom: BorderSide(
                          color: BlackColor,
                        ),
                      ),
                    ),
                    height: 300.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200.w,
                          height: 200.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: villa.image1 == null
                                      ? Image.asset(
                                          EmptyImg,
                                          width: 100.w,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.memory(
                                          base64
                                              .decode(villa.image1!),
                                          fit: BoxFit.cover,
                                          width: 100.w,
                                          height: 100.h,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              EmptyImg,
                                              width: 100.w,
                                              height: 100.h,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                ),
                              ),
                              if (villa.image1 == null)
                                const Positioned.fill(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    villa.name ?? "",
                                    style: TextStyle(
                                      fontFamily: IranSansWeb,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (Proviences[(villa.state ?? 0) + 1] ??
                                          ""),
                                      style: TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16.sp,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Text(
                                      (villa.city ?? ""),
                                      style: TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16.sp,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "تومان",
                                          style: TextStyle(
                                            fontFamily: IranSansWeb,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          (villa.pricePerNight
                                                  .toString()
                                                  .toPersianDigit()
                                                  .seRagham() ??
                                              ""),
                                          style: TextStyle(
                                            fontFamily: IranSansWeb,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> loadData() async {
    villaViewModel.getVillas();
    villaViewModel.villas.stream.listen((listVillas) {
      setState(() {
        villas.addAll(listVillas);
        _gotFromServer = true;
      });
    });
  }
}
