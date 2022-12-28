import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product/widget/medium_text_widget.dart';
import '../../product/widget/singlechilld_widget.dart';



class productInfo extends StatelessWidget {
  const productInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return customSingleChildWidget(
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const mediumText(title: "Ürünler"),
               AppUtility.GeneralSpaceSmall,
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: context.watch<HomeScreenProvider>().item.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = context.watch<HomeScreenProvider>().item;
                      return Card(child: _productCard(context, data, index));
                    },
                  ),
                ),
              ],
            ),);
  }
  }
  ListTile _productCard(BuildContext context, List<StockData> data, int index) {
    return ListTile(
                  onTap: () {
                    context.read<HomeScreenProvider>().gotoDetails(data[index], context);
                  },
                  title: Text("Ürün Adı: ${data[index].order?.marka}"),
                  subtitle: Text("Ürün Fiyatı: ${data[index].order?.fiyat}"),
                  trailing: const Icon(Icons.navigate_next_rounded)
                );
  }