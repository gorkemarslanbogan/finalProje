import 'package:final_project/core/widget/loading_bar.dart';
import 'package:final_project/viewmodel/homescreen_viewmodel.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends homescreen_viewmodel {
  @override
  Widget build(BuildContext context) {
    return isLoading ? const LoadingBar() : ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
          onTap: () => gotoDetails(item[index]),
          title: Text(item[index].customer ?? ""),
          subtitle: Text(item[index].ship_city ?? ""),
          leading: Text(item[index].product_id ?? ""),
          trailing: Text(item[index].date ?? ""),
          ));
      },
    );
  }
}
