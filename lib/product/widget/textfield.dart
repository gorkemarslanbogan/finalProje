import 'package:flutter/material.dart';



class CustomtextField extends StatelessWidget {
  const CustomtextField({
    Key? key, required this.hintText, required this.inputType, required this.icon,
  }) : super(key: key);
final String hintText;
final TextInputType inputType;
final Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfff5f5f5),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
        color: Theme.of(context).colorScheme.outline),
         border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
         ),
        suffixIcon: icon,
      ),
    );
  }
}