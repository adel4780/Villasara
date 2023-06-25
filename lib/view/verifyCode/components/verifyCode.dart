import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../model/entity/person.dart';
import '../../../utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../view_model/person_viewmodel.dart';

class ConfirmationDialog extends StatefulWidget {
  String? role;
  String? phoneNumber;
  final verificationId;

  ConfirmationDialog({required this.phoneNumber,required this.verificationId,required this.role,});
  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  TextEditingController t0 = TextEditingController(),
      t1 = TextEditingController(),
      t2 = TextEditingController(),
      t3 = TextEditingController(),
      t4 = TextEditingController(),
      t5 = TextEditingController();
  int? id;
  late bool TeOw;
  final _personViewModel = PersonViewModel();
  final List<Person> _personList = [];

  verifyOTP(String verificationId,String userOTP) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      _confirmCode();

    } on FirebaseAuthException catch(e){
      print(e.toString());
    }
  }
    // final _codeController = TextEditingController();
  Timer? _timer;
  int _resendSeconds = 100;

  @override
  void initState() {
    super.initState();

    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  Future<void> _resendCode() async {
    // code to resend the confirmation code to the user's phone number
    _resendSeconds = 100;
    _startResendTimer();
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '${widget.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (e) {
          throw Exception(e.toString());
        },
        codeSent: ((String verificationId, int? resendToken) async {
          await Future.delayed(Duration(seconds: 2));
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmationDialog(
                phoneNumber: '+${widget.phoneNumber}',
                verificationId: verificationId,
                role: widget.role,
              );
            },
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void _confirmCode() {
    Person person = Person(phone_number: "");
    if(widget.role == 'host'){
      // print(code);
      // code to verify the confirmation code entered by the user
      _personViewModel.searchHostPhone(widget.phoneNumber??"", "host");
      _personViewModel.persons.stream.listen((list) async {
        setState(() {
          _personList.addAll(list);
        });
        if(_personList.isNotEmpty){
          for (var item in _personList) {
            person = item;
          }
        } else {
          Person item = await Person(phone_number: widget.phoneNumber,first_name: "",last_name: "", role: "host");
          person = await _personViewModel.addPerson(item);
        }
        await Future.delayed(const Duration(seconds: 5));
        Get.toNamed(HomePage, arguments: person);
      });
    }else{
      // print(code);
      // code to verify the confirmation code entered by the user
      _personViewModel.searchGuestPhone(widget.phoneNumber!, "guest");
      _personViewModel.persons.stream.listen((list) async {
        setState(() {
          _personList.addAll(list);
        });
        if(_personList.isNotEmpty){
          for (var item in _personList) {
            person = item;
          }
        } else {
          Person item = await Person(phone_number: widget.phoneNumber,first_name: "",last_name: "", role: "guest");
          person = await _personViewModel.addPerson(item);
        }
        await Future.delayed(const Duration(seconds: 5));
        Get.toNamed(HomePage, arguments: person);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('تایید شماره تلفن همراه',
          style: TextStyle(
            fontFamily: IranSansWeb,
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ' لطفا کد ارسال شده به شماره ${(widget.phoneNumber)?.substring(1)} را وارد نمایید  را وارد نمایید ',
            style: TextStyle(
              fontFamily: 'IranSansWeb',
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDigitInput(0, t5),
              _buildDigitInput(1, t4),
              _buildDigitInput(2, t3),
              _buildDigitInput(3, t2),
              _buildDigitInput(4, t1),
              _buildDigitInput(5, t0),
            ],
          ),
          SizedBox(height: 24),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: (_resendSeconds != 0),
                  child: Row(
                    children: [
                      Icon(Icons.timer_outlined, size: 17),
                      Text(
                        ' $_resendSeconds ثانیه تا ارسال مجدد  ',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'IranSansWeb',
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: (_resendSeconds == 0),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: (_resendSeconds == 0) ? _resendCode : null,
                        icon: Icon(
                          Icons.restart_alt_outlined,
                          size: 20,
                          color: LightBlueColor,
                        ),
                        label: Text(
                          "ارسال مجدد",
                          style: TextStyle(
                            fontSize: 15,
                            color: LightBlueColor,
                            fontFamily: IranSansWeb,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: DarkBlueColor,
                fixedSize: Size.fromWidth(150),
              ),
              child: Text(
                'تایید',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: IranSansWeb,
                ),
              ),
              onPressed: () async {
                verifyOTP(widget.verificationId,
                t0.text + t1.text + t2.text + t3.text + t4.text + t5.text);
                // _confirmCode();
              }),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  Widget _buildDigitInput(int index, TextEditingController t) {
    return SizedBox(
      width: 42,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: t,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'IranSansWeb',
        ),
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 6 && index != 0) {
              FocusScope.of(context).previousFocus();
            }
          }
          if (value.isEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
