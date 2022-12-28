import 'package:final_project/product/utils/app_utilts.dart';
import 'package:flutter/material.dart';



class customSingleChildWidget extends StatelessWidget {
  const customSingleChildWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
    height: height,
    child: SingleChildScrollView(
      physics: AppUtility.GeneralScrollPyhsics,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: AppUtility.GeneralAppPaddingForListview,
        child: SizedBox(
          height: height,
          child: child,
        ),
      ),
    ),
  );
  }
}