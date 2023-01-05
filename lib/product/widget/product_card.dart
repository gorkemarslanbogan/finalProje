import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/product/widget/smal_text.dart';
import 'package:flutter/material.dart';


class productCard extends StatelessWidget {
  const productCard({super.key, required this.data});
  final StockData data;
  final String _networkImage = "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Container(
      height: height*00.17,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.zero,
      child:   _productCardChild(height, width),
      decoration: const BoxDecoration(
        color: Color.fromARGB(159, 231, 231, 231),
        borderRadius: AppUtility.ContainerBorderRadius,
      ),
    );
  }

  Column _productCardChild(double height,double width) 
  => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _cardImage(height, width),
      const SizedBox(width: 6,),
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children:  [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: smallText(title: "Ürün Adı: ${data.order?.marka?.toUpperCase()}"),
            ),
            AppUtility.GeneralSpaceSmall,
            smallText(title: "Ürün Kodu: ${data.order?.siparisNo?.toUpperCase()}"),
             AppUtility.GeneralSpaceSmall,
            smallText(title: "Ürün Adet: ${data.order?.adet?.toUpperCase()}"),
             AppUtility.GeneralSpaceSmall,
            smallText(title: "Birim Fiyatı: ${data.order?.fiyat?.toUpperCase()}"),
         ],
       ),
      ],
    )
  ],);

  ClipRRect _cardImage(double height, double width) {
    return ClipRRect(
    borderRadius: AppUtility.ContainerBorderRadius,
    child: Image.network(_networkImage,fit: BoxFit.cover, height: height*00.17, width: width*00.3,));
  }
}