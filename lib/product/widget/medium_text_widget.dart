import 'package:flutter/material.dart';


class mediumText extends StatelessWidget {
  const mediumText({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline4?.copyWith(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onBackground,
    ),);
  }
}