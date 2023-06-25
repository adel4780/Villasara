import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:villasara_front_end/view/header-footer/header_panel.dart';
import 'package:villasara_front_end/view_model/contract_viewmodel.dart';
import '../../model/entity/contract.dart';
import '../../model/entity/owner.dart';
import '../../model/entity/tenant.dart';
import '../../model/entity/villa.dart';
import '../../utils/constants.dart';
import '../../view_model/villa_viewmodel.dart';
import '../header-footer/footer.dart';
import 'VL-Style.dart';
class MyVillaScreen extends StatefulWidget {
  MyVillaScreen({Key? key}) : super(key: key);
  var user = Get.arguments;

  @override
  State<MyVillaScreen> createState() => _MyVillaScreenState();
}

class _MyVillaScreenState extends State<MyVillaScreen> {
  int? id;
  late int villaId;
  late int period;
  late double amount;
  String? startDate;
  final List<Villa> _villas = [];
  final List<Contract> _contracts = [];
  final _villaViewModel = VillaViewModel();
  final _contractViewModel = ContractViewModel();
  late Owner owner;
  late Tenant tenant;
  late bool TeOw = false;
  bool _showNoSub = false;

  @override
  initState() {
    if(widget.user is Tenant){
      tenant = widget.user;
      searchReservedVillas(tenant.id).then((_) => Timer(Duration(seconds: 8), (){
        setState((){
          _showNoSub = _contracts.isEmpty;
        });
      }));
    }else{
      owner = widget.user;
      searchVilla(owner.id).then((_) => Timer(Duration(seconds: 5), (){
        setState((){
          _showNoSub = _villas.isEmpty;
        });
      }));
    }
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
              HeaderPanel(user: widget.user),
              buildvillaList(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildvillaList() {
    if(widget.user is Owner){
      if (_villas.isEmpty) {
        if (_showNoSub) {
          return noSub();
        } else {
          return loading();
        }
      } else {
        return ownerBuildList();
      }
    }else if(widget.user is Tenant){
      if (_contracts.isEmpty) {
        if (_showNoSub) {
          return noSub();
        } else {
          return loading();
        }
      } else {
          return tenantBuildList();
      }
    }
    return noSub();
  }
  Widget ownerBuildList() {
    return Container(
      padding: EdgeInsets.only(
        left: 100.0.w,
        top: 60.0.h,
        right: 100.0.w,
      ),
      width: 1920.w,
      //height: ((300 * _villas.length) + 300).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            itemCount: _villas.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 350.w, right: 350.w,top: 20.h,),
            itemBuilder: (BuildContext context, int index) {
              Villa villa = _villas[index];
              return buildVillaList(villa, index);
            },
          ),
        ],
      ),
    );
  }
  Widget tenantBuildList() {
    return Container(
      padding: EdgeInsets.only(
        left: 100.0.w,
        top: 60.0.h,
        right: 100.0.w,
      ),
      width: 1920.w,
      //height: ((300 * _villas.length) + 300).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            itemCount: _contracts.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 350.w, right: 350.w,top: 20.h,),
            itemBuilder: (BuildContext context, int index) {
              Contract contract = _contracts[index];
              Villa villa = _villas[index];
              return buildContractList(contract, villa, index);
            },
          ),
        ],
      ),
    );
  }
  Widget noSub() {
    return Container(
      padding: EdgeInsets.only(
        left: 150.0.w,
        top: 51.0.h,
        right: 150.0.w,
      ),
      width: 1920.w,
      height: 700.h,
      child: Center(
        //TODO Empty list dialog
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              SadFace,
              width: 200.w,
              height: 200.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            villaTextStyle("ویلایی وجود ندارد"),
          ],
        ),
      ),
    );
  }
  Widget buildVillaList(Villa villa, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: villaTitle(villa),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.w),
            borderRadius: BorderRadius.circular(20.r),
          ),
          subtitle: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.w,right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {/*Get.toNamed(CategoriesPage, arguments: villa.id);*/},
                      child: buttonTextStyle(
                        'ویرایش اطلاعات',
                      ),
                      style:
                      buttonStyle_build(150, 70, 20, LightBlueColor),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _villas.remove(villa);
                        });
                      },
                      child: buttonTextStyle('حذف'),
                      style: buttonStyle_build(150, 70, 20, LightBlueColor),
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
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
  Widget buildContractList(Contract contract, Villa villa,int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: contractTitle(contract, villa),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.w),
            borderRadius: BorderRadius.circular(20.r),
          ),
          subtitle: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.w,right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _contracts.remove(contract);
                        });
                      },
                      child: buttonTextStyle('حذف'),
                      style: buttonStyle_build(150, 70, 20, LightBlueColor),
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
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
  Future<void> searchVilla(int? id) async {
    _villaViewModel.searchVillas(id??0);
    _villaViewModel.villas.stream.listen((list) {
      setState(() {
        _villas.addAll(list);
      });
    });
  }
  // TODO villa contracts List
  Future<void> searchReservedVillas(int? id) async{
    _contractViewModel.getContracts(id??0);
    _contractViewModel.villas.stream.listen((list) {
      setState(() {
        _contracts.addAll(list);
      });
    });
    for(var item in _contracts){
      searchVilla(item.villaOwner);
    }
  }
  void deleteVilla(Villa villa) {
    _villaViewModel.deleteVilla(villa);
    setState(() {
      _villas.remove(villa);
    });
  }
}
