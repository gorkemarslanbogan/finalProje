import 'package:d_chart/d_chart.dart';
import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/widget/appbar.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.model});
  final StockData model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(backButton: true),
      body: Column(
        children: [
          Expanded(child: _modelInformation()),
          Expanded(
            flex: 2,
            child: DChartLine(
              data: const [
                {
                  'id': 'Line',
                  'data': [
                    {'domain': 0, 'measure': 4.1},
                    {'domain': 2, 'measure': 4},
                    {'domain': 3, 'measure': 6},
                    {'domain': 4, 'measure': 1},
                  ],
                },
              ],
              lineColor: (lineData, index, id) => Colors.amber,
            ),
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
