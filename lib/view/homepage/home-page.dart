import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:villasara_front_end/view_model/villa_viewmodel.dart';
import '../../model/entity/image.dart';
import '../../model/entity/villa.dart';
import '../../utils/constants.dart';
import '../header-footer/footer.dart';
import '../header-footer/header.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  var Id = Get.arguments;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _gotFromServer = false;
  late List<Villa> villas = [];
  late List<VillaImage> villaImage = [];
  final villaViewModel = VillaViewModel();
  @override
  void initState() {
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              putHomeImage(),
              _gotFromServer != null
              ? showVillaList()
              : loading(),
              Footer(),
            ],
          ),
        ),
      ),
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
      height: 1080.h,
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: AssetImage(MaskGroupimg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
  Widget showVillaList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          children: List.generate(
            villas.length,
                (index) {
              final villa = villas[index];
              return Directionality(
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: (){
                    Get.toNamed(VillaDetailPage, arguments: villa);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BlackColor,
                        ),
                      ),
                    ),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: villa.images == null
                                      ? Image.asset(
                                    EmptyImg,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.memory(
                                    base64.decode(villa.images!.first.image!),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        EmptyImg,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (villa.images == null)
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
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    villa.description ?? "",
                                    style: TextStyle(
                                      fontFamily: IranSansWeb,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    Text(
                                      (villa.city??""),
                                      style: TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Text(
                                      (villa.region??""),
                                      style: TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "تومان",
                                      style: TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (villa.pricePerNight.toString().toPersianDigit().seRagham()??""),
                                      style: TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
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
  void loadData() {
    villaViewModel.getVillas(widget.Id);
    villaViewModel.getImage(widget.Id);
    villaViewModel.villas.stream.listen((listVillas) {
      villaViewModel.Images.stream.listen((listImages) {
        setState(() {
          _gotFromServer = true;
          villas.addAll(listVillas);
          for (var villa in villas) {
            villa.images = [];
            for (var image in listImages) {
              if (image.villa == villa.id) {
                villa.images!.add(image);
              }
            }
          }
        });
      });
    });
  }

}
