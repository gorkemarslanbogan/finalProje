
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner {
BarcodeScanner._();
static Future<String> ScanBarcode() async {
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666","Kapat",true,ScanMode.BARCODE);
  return barcodeScanRes;
}
}