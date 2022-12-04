import 'package:final_project/core/widget/loading_bar.dart';
import 'package:final_project/viewmodel/homescreen_viewmodel.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const _containers(),
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
    return isLoading ? const LoadingBar() : SizedBox(
              height: MediaQuery.of(context).size.height *0.80,
              width: MediaQuery.of(context).size.width,
              child:  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (item.length >50) ? 20 : item.length,
                itemBuilder: (context, index) {
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
              ?.copyWith(color: _utility.black, fontWeight: FontWeight.w300),
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_input_component_rounded,
              color: _utility.black,
            ),
            label: Text(
              "See All",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: _utility.black, fontWeight: FontWeight.w300),
            ))
      ],
    );
  }
}

class _containers extends StatelessWidget {
  const _containers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomContainer(
          background: Colors.blue.shade400,
          productCount: "1500",
          title: "Product In",
        ),
        const CustomContainer(
          background: Color.fromARGB(255, 58, 211, 137),
          productCount: "500",
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
