import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SeeAllProduct extends StatefulWidget {
  const SeeAllProduct({super.key});
  @override
  State<SeeAllProduct> createState() => _SeeAllProductState();
}

class _SeeAllProductState extends State<SeeAllProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: ListView.builder(
          itemCount: context.watch<HomeScreenProvider>().item.length,
          itemBuilder: ((context, index) {
           final item =  context.watch<HomeScreenProvider>().item;
          return Card(
            child: ListTile(
              onTap: () {
                context.read<HomeScreenProvider>().gotoDetails(item[index], context);
              },
              leading: Text(item[index].order?.siparisNo ?? ""),
              title: Text(item[index].order?.musteriAdi ?? ""),
              subtitle: Text(item[index].order?.urunKodu ?? ""),
              trailing: const Icon(Icons.navigate_next_rounded)
            ),
          );
      })),
        ),
      ),
    );
  }
}