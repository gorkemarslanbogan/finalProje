
import 'package:final_project/product/scanner/scanner_exception.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner{
BarcodeScanner._();
static Future<String> ScanBarcode(ScannerType type) async {
  if(type == ScannerType.ORDERS){
    return _scannerFun();
  }
  else if(type == ScannerType.PRODUCT){
   return  _scannerFun();
  }
  else {
    throw BarcodeScannerException();
  }
}

static Future<String> _scannerFun() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666","Kapat",true,ScanMode.BARCODE);
    return barcodeScanRes;
}

}

enum ScannerType{
  ORDERS,PRODUCT
}