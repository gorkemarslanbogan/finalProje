import 'package:flutter/material.dart';


class smallText extends StatelessWidget {
  const smallText({
    Key? key, required this.title, this.fontweight,
  }) : super(key: key);
  final String title;
  final FontWeight? fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.subtitle1?.copyWith(
      fontWeight: fontweight ?? FontWeight.w400,
      color: Theme.of(context).colorScheme.onBackground,
    ),);
  }
}