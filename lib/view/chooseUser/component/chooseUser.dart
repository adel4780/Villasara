import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberDialog extends StatefulWidget {
  @override
  _PhoneNumberDialogState createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<PhoneNumberDialog> {
  late String _phoneController = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      title: Text(
        "ورود یا عضویت",
        style: TextStyle(fontFamily: IranSansWeb),
      ),
      content: SizedBox(
        width: 700.w,
        child: Form(
          key: _formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: LightBlueColor,
                    fixedSize: Size.fromWidth(220),
                    padding: EdgeInsets.all(30)),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PhoneNumberDialog();
                    },
                  );
                },
                child: Text(
                  "ورود/عضویت میزبان",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: IranSansWeb,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: LightBlueColor,
                    fixedSize: Size.fromWidth(220),
                    padding: EdgeInsets.all(30)),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PhoneNumberDialog();
                      });
                },
                child: Text(
                  "ورود/عضویت میهمان",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: IranSansWeb,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
