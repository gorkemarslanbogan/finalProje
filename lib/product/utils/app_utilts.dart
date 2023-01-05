
import 'package:flutter/material.dart';

class AppUtility {
  AppUtility._();
  static const ContainerGeneralPadding = EdgeInsets.all(14.0);
  static const ContainerSymmetricPadding = EdgeInsets.symmetric(vertical: 10.0,horizontal: 14);
  static const ContainerBorderRadius = BorderRadius.all(Radius.circular(15));
  static const GeneralAppPadding = EdgeInsets.symmetric(horizontal: 15.0, vertical: 15);
  static const GeneralAppPaddingForListview = EdgeInsets.only(right: 15,left: 15,top: 15);
  static const GeneralSpace = SizedBox(height: 20);
  static const GeneralSpaceMedium = SizedBox(height: 10);
  static const GeneralSpaceSmall = SizedBox(height: 5);
  static const GeneralScrollPyhsics = BouncingScrollPhysics();
  static const AppDivider =  Divider(thickness: 1,);
  static const PageNames  = ["Stock Manager", "Products", "Customer Info","Reports","Settings"];
  static const SPLAHS_SCREEN_PATH = "assets/splash_lottie.json";
}
