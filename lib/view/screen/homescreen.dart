import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/view/screen/all_orders.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:final_project/viewmodel/homescreen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product/widget/product_details_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends homescreen_viewmodel {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AppUtility.GeneralScrollPyhsics,
      padding: AppUtility.GeneralAppPadding,
      children: [
        _containers(itemLength: context.watch<HomeScreenProvider>().item.length),
         AppUtility.GeneralSpace,
        _productTexts(item: context.watch<HomeScreenProvider>().item),
        _productListview(context)
      ],
    );
  }

  Widget _productListview(BuildContext context) {
    return SizedBox(
                height: MediaQuery.of(context).size.height *0.82+15,
                width: MediaQuery.of(context).size.width,
                child:  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: context.watch<HomeScreenProvider>().item.length,
                itemBuilder: (context, index) {
                List<StockData> data = context.watch<HomeScreenProvider>().item;
                  return _productCard(context, data, index);
                },
              ),
            );
  }

  ListTile _productCard(BuildContext context, List<StockData> data, int index) {
    return ListTile(
                  onTap: () {
                    context.read<HomeScreenProvider>().gotoDetails(data[index], context);
                  },
                  title: Text(data[index].order?.musteriAdi ?? ""),
                  subtitle: Text(data[index].order?.marka ?? ""),
                  leading: Text(data[index].order?.siparisNo ?? ""),
                  trailing: const Icon(Icons.navigate_next_rounded)
                );
  }
}

class _productTexts extends StatelessWidget {
  const _productTexts({
    Key? key, required this.item,
  }) : super(key: key);
final List<StockData>? item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Order List",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w300),
        ),
        TextButton.icon(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SeeAllOrders())));
          },
            icon: Icon(
              Icons.settings_input_component_rounded,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            label: Text(
              "See All",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w300),
            ))
      ],
    );
  }
}

class _containers extends StatelessWidget {
  const _containers({
    Key? key, required this.itemLength,
  }) : super(key: key);
  final int itemLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainer(
          background: const Color(0xff0080f6),
          productCount: itemLength.toString(),
          title: "Product In",
        ),
         CustomContainer(
          background: const Color(0xff00b2eb),
          productCount: ((itemLength/2).floor()).toString(),
          title: "Product Out",
        )
      ],
    );
  }
}


