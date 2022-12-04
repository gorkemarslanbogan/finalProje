import 'package:final_project/product/widget/appbar.dart';
import 'package:flutter/material.dart';


class SeeAllProduct extends StatefulWidget {
  const SeeAllProduct({super.key});

  @override
  State<SeeAllProduct> createState() => _SeeAllProductState();
}

class _SeeAllProductState extends State<SeeAllProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppbar(),
      body: Center());
  }
}