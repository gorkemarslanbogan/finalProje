import 'package:final_project/product/utils/app_utilts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
 


class LoadingBar extends Center {
   LoadingBar({super.key}) : super(child: Lottie.asset(AppUtility.LOADING_BAR_PATH, fit: BoxFit.fill));
}