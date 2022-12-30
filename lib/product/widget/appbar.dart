import 'package:final_project/product/scanner/barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
   MyAppbar({super.key, this.backButton, this.title, this.enableTitle, this.appbarTitleIndex});
  final bool? backButton;
  final String? title;
  final bool? enableTitle;
  final int? appbarTitleIndex; 
  final List<String> _item = ["Product Scan", "Order Scan"];
  final List<String> _appBarName = ["Stock Manager", "Products", "Customer Info","Reports","Settings"];
  static const int _appBarNameIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              actions: [
                _scannerPopupMenu(context),
                IconButton(onPressed: (){}, icon: Icon(Icons.search,color:Theme.of(context).colorScheme.onBackground,))
              ],
              leading: (backButton == true) ? BackButton(color: Theme.of(context).colorScheme.onBackground) : null,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: _appBarTitle(context, (enableTitle == true && title != null) ? title! : _appBarName[(appbarTitleIndex != null && 0<=appbarTitleIndex! && appbarTitleIndex!<5 ) ? appbarTitleIndex! : _appBarNameIndex]));
  }

  Text _appBarTitle(BuildContext context, String title){
    return Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w300
            ),);
  }

  PopupMenuButton<String> _scannerPopupMenu(BuildContext context) {
    return PopupMenuButton(
                initialValue: _item.first,
                icon: Icon(Icons.qr_code_scanner,color: Theme.of(context).colorScheme.onBackground,),
                itemBuilder: (context) => <PopupMenuEntry<String>> [
                  PopupMenuItem<String>(
                  child: TextButton.icon(icon: Icon(Icons.paste_rounded,color: Theme.of(context).colorScheme.onBackground,), label: Text(_item.first,style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),), onPressed: () async {await BarcodeScanner.ScanBarcode(ScannerType.PRODUCT);},),
          ),
                  PopupMenuItem<String>(
                  value: _item[1],
                  child: TextButton.icon(icon: Icon(Icons.local_shipping_rounded,color: Theme.of(context).colorScheme.onBackground,), label: Text(_item.last,style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),), onPressed: () async {await BarcodeScanner.ScanBarcode(ScannerType.ORDERS);},),
          ),
                ]
              ,);
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}