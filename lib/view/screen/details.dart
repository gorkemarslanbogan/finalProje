import 'package:d_chart/d_chart.dart';
import 'package:final_project/model/StockData.dart';
import 'package:flutter/material.dart';


class Details extends StatelessWidget {
  const Details({super.key, required this.model});
  final StockData model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: _modelInformation()),
          Expanded(
            flex: 2,
            child: DChartPie(data:  [
             {'domain': 'React Native', 'measure': int.parse(model.product_id.toString())},
             {'domain': 'Cordova', 'measure': int.parse(model.product_option_value_id.toString())},
            ], 
            fillColor: ((pieData, index) => Colors.purple)),
          )
        ],
      ),
    );
  }

  Column _modelInformation() {
    return Column(
      children: [
        Card(
        child: ListTile(
        title: Text("Müşteri: ${model.customer ?? ""}"),
        subtitle: Text("Konum: ${model.ship_city ?? ""}"),
        leading: Text(model.product_id ?? ""),
        trailing: Text(model.date ?? ""),
          ),
        ),
        Card(
        child: ListTile(
        title: Text(model.product_option_name ?? ""),
        subtitle: Text("Fiyat: ${model.price ?? ""}"),
        leading: Text(model.tax ?? ""),
        trailing: Text(model.product_supplier ?? ""),
          ),
        )
      ],
    );
  }
}