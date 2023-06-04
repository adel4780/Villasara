import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants.dart';
import '../header-footer/footer.dart';
import '../header-footer/header.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Rules(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.fromLTRB(
        150.0.w,
        57.0.h,
        150.0.w,
        81.0.h,
      ),
      width: 1920.w,
      height: 600.0.h,
      child: Column(
        children: [
          Row(
            children: [
              titleStyle("قوانین "),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              phraseStyle(RulesPhrase),
            ],
          ),
        ],
      ),
    );
  }
}
