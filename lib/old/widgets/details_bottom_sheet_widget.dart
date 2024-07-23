import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart'
    hide ModalBottomSheetRoute;

Future<dynamic> bottomDetails(BuildContext context, String caption) {
  return showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(maxHeight: 500, minHeight: 300),
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFFDEDADA),
                            borderRadius: BorderRadius.circular(30)),
                        width: 150,
                        height: 6,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(caption.toString())
                  ],
                )),
          ),
        );
      });
}

Future<dynamic> bottomMenuDetails(
  BuildContext context,
  List<Widget> items,
) {
  return showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(maxHeight: 150, minHeight: 140),
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFFDEDADA),
                            borderRadius: BorderRadius.circular(30)),
                        width: 60,
                        height: 6,
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   children: [
                    //     Icon(icon, size: 35),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text("Settings", style: getCustomTextStyle(context))
                    //   ],
                    // ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return items[index];
                      },
                    ),
                  ],
                )),
          ),
        );
      });
}

TextStyle? getCustomTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );
}
