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
            title: Text("Müşteri: ${model.order?.musteriAdi ?? ""}"),
            subtitle: Text("Konum: ${model.order?.il ?? ""}"),
            leading: Text(model.order?.siparisNo ?? ""),
            trailing: Text(model.order?.tarih ?? ""),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(model.order?.musteriAdi ?? ""),
            subtitle: Text("Fiyat: ${model.order?.fiyat ?? ""}"),
            leading: Text(model.order?.pazarYeri ?? ""),
            trailing: Text(model.order?.siparisNo ?? ""),
          ),
        )
      ],
    );
  }
}
