import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class customerInfo extends StatelessWidget {
  const customerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        padding: AppUtility.GeneralAppPadding,
        physics: AppUtility.GeneralScrollPyhsics,
        itemCount: context.watch<HomeScreenProvider>().item.length,
        itemBuilder: (BuildContext context, int index) {
          final data = context.watch<HomeScreenProvider>().item;
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text("Müşteri Adı: ${data[index].order?.musteriAdi}"),
              subtitle: Text("Yaşadığı İl: ${data[index].order?.il}"),
            ),
          );
        },
      ),
    );
  }
}

//müşteri kısmı için 
//ad soyad bilgisi gerekli 
//sadece ad var