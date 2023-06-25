import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:villasara_front_end/utils/constants.dart';

import '../../model/entity/villa.dart';
import '../villaLists/VL-Style.dart';
class SearchScreen extends StatefulWidget {
  final List<Villa> searchVillas;
  final Function(List<Villa>) onSearch;
  final user;
  const SearchScreen(
      {Key? key, required this.searchVillas, required this.onSearch, required this.user})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Villa> searchResults = [];
  @override
  void dispose() {
    super.dispose();
    widget.onSearch(widget.searchVillas);
  }
  @override
  void initState() {
    super.initState();
    //searchResults = searchVilla;
  }
  @override
  void _search(String keyword) {
    setState(() {
      if (keyword.isNotEmpty) {
        if(!searchResults.contains(widget.searchVillas.where((villa) => Proviences[villa.state??0 + 1].contains(keyword)))){
          searchResults.clear();
          searchResults.addAll(widget.searchVillas.where((villa) => Proviences[villa.state??0].contains(keyword)));}
        widget.onSearch(searchResults);

      } else {
        searchResults = widget.searchVillas;
      }
    });
    widget.onSearch(searchResults);
  }
  @override
  void didUpdateWidget(SearchScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchVillas != oldWidget.searchVillas) {
      setState(() {
        searchResults = widget.searchVillas;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
        child: AppBar(
          backgroundColor:  DarkBlueColor,
          automaticallyImplyLeading: false,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double availableWidth = constraints.maxWidth;
              final double availableHeight = constraints.maxHeight;
              final double logoHeight = availableHeight * 0.5;
              final double titleFontSize = availableHeight * 0.12;
              final double backIconSize = availableHeight * 0.10;
              return Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: availableHeight * 0.05),
                          Text(
                            'جستجو',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                              WhiteColor,
                              fontFamily: IranSansWeb,
                              fontSize: titleFontSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  /*Positioned(
                    right: availableWidth * 0.10,
                    top: availableHeight * 0.72,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context, widget.searchVillas);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: backIconSize,
                          color: WhiteColor),
                    ),
                  ),*/
                ],
              );
            },
          ),
          elevation: 0.0,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _search,
              decoration: const InputDecoration(
                labelText: 'جستجو',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final villa = searchResults[index];
                return ListTile(
                  onTap: (){
                    Get.toNamed(VillaDetailPage, arguments: [widget.user, villa]);
                  },
                  title: villaTitle(villa),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2.w),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  /*subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(' قیمت:', style: TextStyle(fontFamily: IranSansWeb, fontSize: 20),),
                          Text(' ${villa.pricePerNight?.round()} '.seRagham().toPersianDigit(), style: TextStyle(fontFamily: IranSansWeb, fontSize: 20),),
                          Text(' تومان ', style: TextStyle(fontFamily: IranSansWeb, fontSize: 20),),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),*/
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle buttonStyle(
      double width, double height, double radius, Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      elevation: MaterialStateProperty.all<double>(0.0),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      fixedSize: MaterialStateProperty.all<Size>(
        Size(width, height),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(color: BlackColor),
        ),
      ),
    );
  }
}

