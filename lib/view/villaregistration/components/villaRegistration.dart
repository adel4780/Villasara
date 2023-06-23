import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/entity/villa.dart';
import '../../../view_model/villa_viewmodel.dart';
import '../../header-footer/footer.dart';
import '../../../utils/constants.dart';
import '../../header-footer/header_panel.dart';

class VillaRegisterScreen extends StatefulWidget {
  VillaRegisterScreen({Key? key}) : super(key: key);
  var ID = 1;

  @override
  _VillaRegisterScreen createState() => _VillaRegisterScreen();
}

class _VillaRegisterScreen extends State<VillaRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderPanel(ID : widget.ID),
                VillaRegister(
                  Id: widget.ID,
                ),
                SizedBox(height: 32.r),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VillaRegister extends StatefulWidget {
  VillaRegister({Key? key, required this.Id}) : super(key: key);
  var Id;
  @override
  State<VillaRegister> createState() => _VillaRegisterState();
}

class _VillaRegisterState extends State<VillaRegister> {
  //dropdown options for type of business
  var userId ;
  final _formKey = GlobalKey<FormState>();


//form field variables
  String _name ="";
  late int _state ;
  late String _city;
  late String _region;
  late String _phone_number;
  late String _home_number;

  String _email = "";

  final _viewModel = VillaViewModel();
  final List<Villa> _villas = [];

  @override
  void initState() {
    // findPhone();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              width: 1920.w,
              height: 1180.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(VillaBack),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.only(left: 150.w, top: 45.r, right: 150),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              border: Border.all(
                                  width: 20.w, color: Colors.transparent),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Text(
                                    "ثبت ویلا",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.w,
                                      color: BlackColor,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  // Row 1
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.person,
                                              color: BlackColor,
                                            ),
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                            TextStyle(color: BlackColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: BlackColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: LightBlueColor),
                                            ),
                                            errorStyle: TextStyle(color: DarkBlueColor,fontWeight: FontWeight.bold),
                                            labelText: 'نام ویلا',
                                            helperText: "* الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            setState(() {
                                              _name = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "لطفا نام را وارد نمایید";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 16.0.w),
                                      Expanded(
                                        child: DropdownButtonFormField<String>(
                                          menuMaxHeight: 200,
                                          style: TextStyle(fontSize: 20.w,fontFamily: IranSansWeb,),
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(color: DarkBlueColor,fontWeight: FontWeight.bold),
                                            labelText: 'انتخاب استان',
                                            helperText: "* الزامی",
                                            hintText: "انتخاب استان",
                                            hintStyle: TextStyle(color: BlackColor),
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                            suffixIcon: Icon(
                                              Icons.location_city_outlined,
                                              color: BlackColor,
                                            ),
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                            TextStyle(color: BlackColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: BlackColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: LightBlueColor),
                                            ),
                                          ),
                                          dropdownColor: BlackColor,
                                          items: Proviences.map((province) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                province,
                                                style:
                                                TextStyle(color: BlackColor),
                                              ),
                                              value: province,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              // _state_text = value!;
                                              // // TODO index of _state
                                              _state =
                                                  Proviences.indexOf(value!)+1;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'لطفا استان خود را انتخاب کنید';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24.0.h),
                                  // Row 2
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.person,
                                              color: BlackColor,
                                            ),
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                            TextStyle(color: BlackColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: BlackColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: LightBlueColor),
                                            ),
                                            errorStyle: TextStyle(color: DarkBlueColor,fontWeight: FontWeight.bold),
                                            labelText: 'شهر',
                                            helperText: "* الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            setState(() {
                                              _city = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "لطفا شهر را وارد نمایید";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 16.0.w),
                                      Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.person,
                                              color: BlackColor,
                                            ),
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                            TextStyle(color: BlackColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: BlackColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: LightBlueColor),
                                            ),
                                            errorStyle: TextStyle(color: DarkBlueColor,fontWeight: FontWeight.bold),
                                            labelText: 'منطقه',
                                            helperText: "* الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            setState(() {
                                              _region = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "لطفا منطقه را وارد نمایید";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Row 3
                                  SizedBox(height: 24.0.h),
                                  // Row 4
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.email_outlined,
                                              color: BlackColor,
                                            ),
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                            TextStyle(color: BlackColor),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: BlackColor),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: LightBlueColor),
                                            ),
                                            labelText: 'ایمیل',
                                            helperText: "* اختیاری",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            _email = value;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 16.0.w),
                                      Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                Icons.phone,
                                                color: BlackColor,
                                              ),
                                              border: OutlineInputBorder(),
                                              labelStyle:
                                              TextStyle(color: BlackColor),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: BlackColor),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: LightBlueColor),
                                              ),
                                              errorStyle: TextStyle(color: LightBlueColor,fontWeight: FontWeight.bold),
                                              labelText: "شماره تلفن ثابت",
                                              helperText: "* اختیاری",
                                              helperStyle:
                                              TextStyle(color: BlackColor),
                                            ),
                                            style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            onChanged: (value) {
                                              _home_number = value;
                                            },
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 24.0.h),
                                  //button to submit the form
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 5,
                                        height: 60.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: LightBlueColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          onPressed: () async {
                                            // if (_formKey.currentState!.validate()) {
                                            //   userId = widget.Id;
                                            //   Villa villa = Villa(
                                            //     id: userId,
                                            //     first_name: _first_name,
                                            //     last_name: _last_name,
                                            //     home_number: _home_number,
                                            //     phone_number: _phone_number,
                                            //     code_meli: _code_meli.toString(),
                                            //     email: _email,
                                            //   );
                                            //
                                            //   await _viewModel.editUser(user);
                                            //   Get.toNamed(HomePage,
                                            //       arguments: userId);
                                            // }
                                          },
                                          child: Text(
                                            'ثبت اطلاعات',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width / 5,
                                        height: 60.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: LightBlueColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.toNamed(HomePage,
                                                arguments: widget.Id);
                                          },
                                          child: Text(
                                            'انصراف',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.r,
            ),
          ],
        ));
  }
  // void findPhone() {
  //   // print(code);
  //   // code to verify the confirmation code entered by the user
  //   _viewModel.searchUsers(widget.Id);
  //   _viewModel.users.stream.listen((list) async {
  //     setState(() {
  //       _owners.addAll(list);
  //     });
  //     if(_owners.isNotEmpty){
  //       for (User item in _owners) {
  //         _phone_number = item.phone_number??'';
  //       }
  //     }
  //   });
  // }
}
