import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../model/entity/owner.dart';
import '../../../model/entity/villa.dart';
import '../../../view_model/villa_viewmodel.dart';
import '../../header-footer/footer.dart';
import '../../../utils/constants.dart';
import '../../header-footer/header_panel.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;
class VillaRegisterScreen extends StatefulWidget {
  VillaRegisterScreen({Key? key}) : super(key: key);
  Owner user = Get.arguments;

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
                HeaderPanel(user: widget.user),
                VillaRegister(
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

class VillaRegister extends StatefulWidget {
  VillaRegister({Key? key, required this.user}) : super(key: key);
  Owner user;
  @override
  State<VillaRegister> createState() => _VillaRegisterState();
}

class _VillaRegisterState extends State<VillaRegister> {
  //dropdown options for type of business
  late int userId;
  final _formKey = GlobalKey<FormState>();

  List<html.File?> _image =[null,null,null];

  final picker = ImagePicker();

  Future<void> getImage(id) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      String _base64String = base64.encode(bytes);
      _logo[id] = _base64String;
      final blob = html.Blob([bytes]);
      setState(() {
        _image[id] = html.File([blob], pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }
//form field variables
  String _name = "";
  late int _state;
  late String _city;
  late String _region;
  late String _phone_number;
  late String _price;
  String startDay = '';
  String endDay = '';
  String _address = "";
  String _about = "";
  final _viewModel = VillaViewModel();
  final List<Villa> _villas = [];
  List<String> _logo =["","",""] ;
  @override
  void initState() {
    // findPhone();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                                            Icons.villa_outlined,
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
                                          errorStyle: TextStyle(
                                              color: DarkBlueColor,
                                              fontWeight: FontWeight.bold),
                                          labelText: 'نام ویلا',
                                          helperText: "* الزامی",
                                          helperStyle:
                                              TextStyle(color: BlackColor),
                                        ),
                                        style: TextStyle(
                                          color: BlackColor,
                                          fontFamily: IranSansWeb,
                                        ),
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
                                        style: TextStyle(
                                          fontSize: 20.w,
                                          fontFamily: IranSansWeb,
                                        ),
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                              color: DarkBlueColor,
                                              fontWeight: FontWeight.bold),
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
                                        dropdownColor: LightBlueColor,
                                        items: Proviences.map((province) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              province,
                                              style: TextStyle(color: BlackColor),
                                            ),
                                            value: province,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            // _state_text = value!;
                                            //
                                            _state =
                                                Proviences.indexOf(value!) + 1;
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
                                SizedBox(height: 18.0.h),
                                // Row 2
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.home_work_outlined,
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
                                          errorStyle: TextStyle(
                                              color: DarkBlueColor,
                                              fontWeight: FontWeight.bold),
                                          labelText: 'شهر',
                                          helperText: "* الزامی",
                                          helperStyle:
                                              TextStyle(color: BlackColor),
                                        ),
                                        style: TextStyle(
                                          color: BlackColor,
                                          fontFamily: IranSansWeb,
                                        ),
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
                                            Icons.house_outlined,
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
                                          errorStyle: TextStyle(
                                              color: DarkBlueColor,
                                              fontWeight: FontWeight.bold),
                                          labelText: 'منطقه',
                                          helperText: "* الزامی",
                                          helperStyle:
                                              TextStyle(color: BlackColor),
                                        ),
                                        style: TextStyle(
                                          color: BlackColor,
                                          fontFamily: IranSansWeb,
                                        ),
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
                                SizedBox(height: 18.0.h),
                                // Row 3
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.home_outlined,
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
                                          labelText: 'آدرس',
                                          helperText: "* اجباری",
                                          helperStyle:
                                              TextStyle(color: BlackColor),
                                        ),
                                        style: TextStyle(
                                          color: BlackColor,
                                          fontFamily: IranSansWeb,
                                        ),
                                        onChanged: (value) {
                                          _address = value;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 16.0.w),
                                    Expanded(
                                        child: TextFormField(
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.attach_money_outlined,
                                          color: BlackColor,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle: TextStyle(color: BlackColor),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: BlackColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: LightBlueColor),
                                        ),
                                        errorStyle: TextStyle(
                                            color: LightBlueColor,
                                            fontWeight: FontWeight.bold),
                                        labelText: "قیمت به ازای هرشب",
                                        helperText: "* اجباری",
                                        helperStyle: TextStyle(color: BlackColor),
                                      ),
                                      style: TextStyle(
                                        color: BlackColor,
                                        fontFamily: IranSansWeb,
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (value) {
                                        _price = value;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "لطفا منطقه را وارد نمایید";
                                        }
                                        return null;
                                      },
                                    )),
                                  ],
                                ),
                                SizedBox(height: 18.0.h),
                                //row of proid
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: GestureDetector(
                                            onTap: () async {
                                              var picked =
                                                  await showPersianDateRangePicker(
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
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              defaultVerticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              children: [
                                                TableRow(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "تاریخ شروغ اجاره",
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "$startDay",
                                                          style: TextStyle(
                                                            color: DarkBlueColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "تاریخ پایان اجاره",
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          "$endDay",
                                                          style: TextStyle(
                                                            color: DarkBlueColor,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                    ]),
                                SizedBox(height: 18.0.h),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.info_outline,
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
                                              borderSide: BorderSide(
                                                  color: LightBlueColor),
                                            ),
                                            labelText: 'درباره ویلا',
                                            helperText: "* اجباری",
                                            helperStyle:
                                                TextStyle(color: BlackColor),
                                          ),
                                          style: TextStyle(
                                            color: BlackColor,
                                            fontFamily: IranSansWeb,
                                          ),
                                          onChanged: (value) {
                                            _about = value;
                                          },
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: 18.0.h),
                                //images
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        // width: 50,
                                          height: 130,
                                          child: Column(
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                                                        side: BorderSide(
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    getImage(0);
                                                  },
                                                  child: Text('افزودن تصویر اول',style: TextStyle(color:WhiteColor),)),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              //if image not null show the image
                                              //if image null show text
                                              _image[0] != null
                                                  ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    //to show image, you type like this.
                                                    '${html.Url.createObjectUrl(_image[0]!)}',
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 85,
                                                  ),
                                                ),
                                              )
                                                  : Text(
                                                "",
                                                style:
                                                TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        // width: 50,
                                          height: 130,
                                          child: Column(
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                                                        side: BorderSide(
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    getImage(1);
                                                  },
                                                  child: Text('افزودن تصویر دوم',style: TextStyle(color:WhiteColor),)),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              //if image not null show the image
                                              //if image null show text
                                              _image[1] != null
                                                  ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    //to show image, you type like this.
                                                    '${html.Url.createObjectUrl(_image[1]!)}',
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 85,
                                                  ),
                                                ),
                                              )
                                                  : Text(
                                                "",
                                                style:
                                                TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        // width: 50,
                                          height: 130,
                                          child: Column(
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                                                        side: BorderSide(
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    getImage(2);
                                                  },
                                                  child: Text('افزودن تصویر سوم',style: TextStyle(color:WhiteColor),)),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              //if image not null show the image
                                              //if image null show text
                                              _image[2] != null
                                                  ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    //to show image, you type like this.
                                                    '${html.Url.createObjectUrl(_image[2]!)}',
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 85,
                                                  ),
                                                ),
                                              )
                                                  : Text(
                                                "",
                                                style:
                                                TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          )),
                                    ]),
                                SizedBox(height: 16.0.h),

                                //button to submit the form
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height: 40.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: LightBlueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState!.validate()) {
                                            int userId = widget.user.id??0;
                                            Villa villa = Villa(
                                              id: userId,
                                              name: _name,
                                              state: _state,
                                              city: _city,
                                              region: _region,
                                              address: _address,
                                              pricePerNight:double.parse(_price),
                                              startDate: startDay,
                                              endDate: endDay,
                                              description: _about,
                                              images: _logo,
                                            );

                                            await _viewModel.addVilla(villa);
                                            Get.toNamed(HomePage,
                                                arguments: widget.user);
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
                                      height: 40.h,
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
      )),
    );
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
