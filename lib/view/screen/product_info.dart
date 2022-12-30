import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class productInfo extends StatelessWidget {
  const productInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: AppUtility.GeneralScrollPyhsics,
      padding: AppUtility.GeneralAppPadding,
      itemCount: context.watch<HomeScreenProvider>().item.length,
      itemBuilder: (BuildContext context, int index) {
        final data = context.watch<HomeScreenProvider>().item;
        return Card(child: _productCard(context, data, index));
      },
    );
  }
  }
  ListTile _productCard(BuildContext context, List<StockData> data, int index) {
    return ListTile(
                  onTap: () {
                    context.read<HomeScreenProvider>().gotoDetails(data[index], context);
                  },
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: Text("Ürün Adı: ${data[index].order?.marka}"),
                  subtitle: Text("Ürün Fiyatı: ${data[index].order?.fiyat}"),
                  trailing: const Icon(Icons.navigate_next_rounded)
                );
  }