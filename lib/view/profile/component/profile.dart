import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/entity/owner.dart';
import '../../../model/entity/tenant.dart';
import '../../../view_model/owner_viewmodel.dart';
import '../../header-footer/footer.dart';
import '../../../utils/constants.dart';
import '../../../view_model/tenant_viewmodel.dart';
import '../../header-footer/header_panel.dart';

class UserRegisterScreen extends StatefulWidget {
  UserRegisterScreen({Key? key}) : super(key: key);
  var user = Get.arguments;

  @override
  _UserRegisterScreen createState() => _UserRegisterScreen();
}

class _UserRegisterScreen extends State<UserRegisterScreen>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderPanel(user : widget.user),
                OwnerRegister(
                  user: widget.user,
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

class OwnerRegister extends StatefulWidget {
  OwnerRegister({Key? key, required this.user}) : super(key: key);
  var user;
  @override
  State<OwnerRegister> createState() => _OwnerRegisterState();
}

class _OwnerRegisterState extends State<OwnerRegister> {
  //dropdown options for type of business
  var userId ;
  final _formKey = GlobalKey<FormState>();
//form field variables
  String _first_name ="";
  String _last_name="";
  late String _phone_number;
  late String _home_number;
  late int _code_meli;
  String _email = "";
  final _ownerViewModel = OwnerViewModel();
  final _tenantViewModel = TenantViewModel();
  late Owner owner = Owner(phone_number: "");
  late Tenant tenant = Tenant(phone_number: "");
  late bool TeOw;
  @override
  void initState() {
    TeOw = tenantOrOwner(widget.user);
    if(TeOw == true){
      owner = widget.user;
    }else{
      tenant = widget.user;
    }
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
                                    "حساب کاربری",
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
                                            labelText: 'نام',
                                            helperText: "* الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            setState(() {
                                              _first_name = value;
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
                                        child: TextFormField(
                                          decoration: InputDecoration(
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
                                            labelText: 'نام خانوادگی',
                                            helperText: "الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            _last_name = value;
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "لطفا نام خانوادگی را وارد نمایید";
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
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.person_pin_circle_outlined,
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
                                            labelText: "کد ملی",
                                            helperText: "* الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            _code_meli = int.parse(value);
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "لطفا کد ملی را وارد نمایید";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 16.0.w),
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.phone_android_outlined,
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
                                            labelText: "شماره تلفن همراه",
                                            helperText: "* الزامی",
                                            helperStyle:
                                            TextStyle(color: BlackColor),
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          style: TextStyle(color: BlackColor,fontFamily: IranSansWeb,),
                                          onChanged: (value) {
                                            _phone_number = value;
                                          },
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "لطفا شماره تلفن همراه را وارد نمایید";
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
                                            if (_formKey.currentState!.validate()) {
                                              if(TeOw == true){
                                                Owner newOwner = Owner(
                                                  id: owner.id,
                                                  first_name: _first_name,
                                                  last_name: _last_name,
                                                  home_number: _home_number,
                                                  phone_number: _phone_number,
                                                  code_meli: _code_meli.toString(),
                                                  email: _email,
                                                );
                                                await _ownerViewModel.editOwner(newOwner);
                                                Get.toNamed(HomePage, arguments: newOwner);
                                              }else{
                                                Tenant newTenant = Tenant(
                                                  id: tenant.id,
                                                  first_name: _first_name,
                                                  last_name: _last_name,
                                                  home_number: _home_number,
                                                  phone_number: _phone_number,
                                                  code_meli: _code_meli.toString(),
                                                  email: _email,
                                                );
                                                await _tenantViewModel.editTenant(newTenant);
                                                Get.toNamed(HomePage, arguments: newTenant);
                                              }
                                            }
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
                                                arguments: widget.user);
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
}
