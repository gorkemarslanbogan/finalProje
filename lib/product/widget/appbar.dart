import 'package:final_project/product/scanner/barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key, this.backButton});
  final bool? backButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              actions: [
                IconButton(onPressed: () async {
                  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode( "#ff6666","Kapat",true,ScanMode.BARCODE);
                }, icon: const Icon(Icons.qr_code_scanner,color: Colors.black,)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.black,))
              ],
              leading: (backButton == true) ? BackButton(color: Theme.of(context).colorScheme.shadow) : null,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 0,
              title: Text('Stock Manager',style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300
              ),));
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}