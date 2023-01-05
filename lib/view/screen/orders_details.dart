import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/product/widget/appbar.dart';
import 'package:final_project/product/widget/medium_text_widget.dart';
import 'package:final_project/product/widget/product_card.dart';
import 'package:final_project/product/widget/smal_text.dart';
import 'package:flutter/material.dart';


class orderDetails extends StatelessWidget {
  const orderDetails({super.key, required this.item});
  final List<StockData> item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(enableTitle: true,title: "Sipariş Bilgileri"),
      body: Padding(
        padding: AppUtility.GeneralAppPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Card(
              color: Theme.of(context).colorScheme.onSecondary,
              shape: _RoundedBorder(context),
              child: Container(
                padding: AppUtility.ContainerSymmetricPadding,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*00.19,
              decoration: const BoxDecoration(
                borderRadius: AppUtility.ContainerBorderRadius),
                child: _cardItem(),
              ),
            ),
            AppUtility.GeneralSpaceSmall,
            _shippingAdressCard(context),
            AppUtility.GeneralSpace,
            const mediumText(title: "Ürünler"),
            AppUtility.GeneralSpaceSmall,
           Expanded(
             child: ListView.separated(
               itemCount: 3,
               physics: AppUtility.GeneralScrollPyhsics,
               itemBuilder: (BuildContext context, int index) {
                 return  productCard(data: item.first);
               },
               separatorBuilder: (context, index) {
                 return const Divider();
               },
             ),
           ),
          ],
        ),
      ),
    );
  }

  SizedBox _shippingAdressCard(BuildContext context) {
    return SizedBox(
            height: MediaQuery.of(context).size.height*00.11,
            child: Card(
              color: Theme.of(context).colorScheme.onSecondary,
              shape: _RoundedBorder(context),
              child: const Center(
                child:  ListTile(
                  leading: Icon(Icons.location_on_outlined,size: 38,),
                  title: Text("Ziyapaşa Caddesi Kurtuluş Bahçe Sk. Seyhan/Adana"),
                ),
              ),
            ),
          );
  }

  Column _cardItem() {
    return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                    children: const [
                      Icon(Icons.person_outline_outlined,size: 30,),
                      smallText(title: "Müşteri Bilgileri: Görkem Arslanboğan",),
                    ],
                  )),
                  AppUtility.GeneralSpaceMedium,
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                    children: const [
                       Icon(Icons.sell_outlined,size: 30,),
                      smallText(title: "Satış Kanalı HB"),
                    ],
                  )),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                      children: const [
                         Icon(Icons.money,size: 30,),
                        smallText(title: "Toplam Tutar: 1200TL"),
                      ]),
                    )),
                  AppUtility.GeneralSpaceMedium,
                   Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                      children: const [
                         Icon(Icons.copy_rounded,size: 30,),
                        smallText(title: "Sipariş Kodu: TK52848"),
                      ]),
                    )),
                   const Expanded(child: Align(
                      alignment: Alignment.topLeft,
                      child: smallText(title: "Tarih: 04.01.2023")))
                ], 
              );
  }

  RoundedRectangleBorder _RoundedBorder(BuildContext context) {
    return RoundedRectangleBorder(
                borderRadius: AppUtility.ContainerBorderRadius,
                side: BorderSide(color: Theme.of(context).colorScheme.outline,width: 0.9,));
  }
}


//sipariş kodu
//tarih
//ürünler liste şeklinde {ürün resmi,ürün kodu,birim fiyatı,siparişte kaç adet sipariş edildiği}
//müşteri adsoyad kargo adresi
//toplam tutar
//satış kanalı hepsiburada , trendyol,amazon,n11