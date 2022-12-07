import 'package:final_project/core/widget/loading_bar.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _containers(itemLength: context.read<HomeScreenProvider>().item.length),
              _utility.twentyspace,
             const _productTexts(),
              _productListview(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _productListview(BuildContext context) {
    return SizedBox(
              height: MediaQuery.of(context).size.height *0.80,
              width: MediaQuery.of(context).size.width,
              child:  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.read<HomeScreenProvider>().item.length,
                itemBuilder: (context, index) {
                  final item = context.read<HomeScreenProvider>().item;
                  return ListTile(
                    onTap: () => gotoDetails(item[index]),
                    title: Text(item[index].customer ?? ""),
                    subtitle: Text(item[index].ship_city ?? ""),
                    leading: Text(item[index].product_id ?? ""),
                    trailing: IconButton(onPressed: () => gotoDetails(item[index]), icon: const Icon(Icons.navigate_next_rounded)),
                  );
                },
              ),
            );
  }
}

class _productTexts extends StatelessWidget {
  const _productTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Product List",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w300),
        ),
        TextButton.icon(
            onPressed: () {},
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
          background: Color(0xff0080f6),
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

class _utility {
  _utility._();
  static const black = Color.fromARGB(255, 73, 73, 73);
  static const twentyspace = SizedBox(
    height: 20,
  );
}

// isLoading ? const LoadingBar() : ListView.builder(
//         itemCount: item.length,
//         itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//           onTap: () => gotoDetails(item[index]),
//           title: Text(item[index].customer ?? ""),
//           subtitle: Text(item[index].ship_city ?? ""),
//           leading: Text(item[index].product_id ?? ""),
//           trailing: Text(item[index].date ?? ""),
//           ));
//       },
//     );
