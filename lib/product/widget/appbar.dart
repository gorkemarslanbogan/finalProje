import 'package:final_project/product/scanner/barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key, this.backButton});
  final bool? backButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              actions: [
                IconButton(onPressed: () async {
                  BarcodeScanner.ScanBarcode();
                }, icon:  Icon(Icons.qr_code_scanner,color: Theme.of(context).colorScheme.onBackground,)),
                IconButton(onPressed: (){}, icon:  Icon(Icons.search,color:Theme.of(context).colorScheme.onBackground,))
              ],
              leading: (backButton == true) ? BackButton(color: Theme.of(context).colorScheme.onBackground) : null,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Stock Manager',style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w300
              ),));
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}