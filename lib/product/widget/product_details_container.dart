import 'package:final_project/product/utils/app_utilts.dart';
import 'package:flutter/material.dart';



class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.background, required this.title, required this.productCount});
  final Color background;
  final String title;
  final String productCount;
  final Color _WhiteColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height *0.23,
        width: MediaQuery.of(context).size.width *0.44,
        decoration: BoxDecoration(
        borderRadius: AppUtility.ContainerBorderRadius,
        color: background,
      ),
      child: Padding(
        padding: AppUtility.ContainerGeneralPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Icon( (title == "Product In") ? Icons.incomplete_circle : Icons.track_changes_outlined, color: _WhiteColor, size: 35,)),
            _utility.spacing,
            _utility.spacing,
            Expanded(
              child: Text(productCount,style: Theme.of(context).textTheme.headline5?.copyWith(
                color: _WhiteColor,
                fontWeight: FontWeight.w400
              ),),
            ),
            _utility.spacing,
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: _WhiteColor,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class _utility {
  _utility._();
  static final spacing = SizedBox(height: 10,);
}