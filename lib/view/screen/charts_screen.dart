import 'package:final_project/product/utils/app_utilts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior();
  }
  @override
  void dispose() {
    super.dispose();
    _tooltipBehavior;
  }
late TooltipBehavior _tooltipBehavior;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SizedBox(
      height: MediaQuery.of(context).size.height*2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppUtility.GeneralSpace,
            SfCartesianChart(
              title: _title(context, "Ürün Satış Eğrisi"),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: _tooltipBehavior,
              series: <SplineSeries<SalesData, String>>[
                SplineSeries<SalesData, String>(
                  dataSource:  <SalesData>[
                    SalesData('Ocak', 35),
                    SalesData('Şubat', 28),
                    SalesData('Mart', 34),
                    SalesData('Nisan', 32),
                    SalesData('Mayıs', 40),
                    SalesData('Haziran', 30),
                    SalesData('Temmuz', 28),
                    SalesData('Ağustos', 34),
                    SalesData('Eylül', 32),
                    SalesData('Ekim', 55),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)
                ),
              ]
            ),
            SfCartesianChart(
              title: _title(context, "Aylara Göre Satış Eğrisi"),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: _tooltipBehavior,
              series: <SplineSeries<SalesData, String>>[
                SplineSeries<SalesData, String>(
                  dataSource:  <SalesData>[
                    SalesData('Ocak', 70),
                    SalesData('Şubat', 28),
                    SalesData('Mart', 34),
                    SalesData('Nisan', 62),
                    SalesData('Mayıs', 50),
                    SalesData('Haziran', 70),
                    SalesData('Temmuz', 88),
                    SalesData('Ağustos', 134),
                    SalesData('Eylül', 232),
                    SalesData('Ekim', 155),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)
                ),
              ]
            ),
            AppUtility.GeneralSpace,
            SfCartesianChart(
              title: _title(context, "En Çok Satılan Markalar"),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: _tooltipBehavior,
              series: <ColumnSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                  dataSource:  <SalesData>[
                    SalesData('Adidas', 38),
                    SalesData('Nike', 35),
                    SalesData('Asus', 34),
                    SalesData('Apple', 30),
                    SalesData('Samsung', 28),
                    SalesData('Huawei', 25),
                    SalesData('Monster', 23),
                    SalesData('Hp', 20),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: Colors.indigoAccent.shade700
                ),
              ]
            ),
            AppUtility.GeneralSpace,
            SfCartesianChart(
              title: _title(context, "Top 5 Müşteri"),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: _tooltipBehavior,
              series: <ColumnSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                  dataSource:  <SalesData>[
                    SalesData('Yakup Kutlu', 55),
                    SalesData('Gorkem Arsl', 35),
                    SalesData('Meriç Yaman', 34),
                    SalesData('Berkan Bysl', 32),
                    SalesData('Hakan Çelk', 28)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: Colors.amber
                ),
              ]
            ),
            AppUtility.GeneralSpace,
            SfCartesianChart(
              title: _title(context, "En İyi Çalışanlar"),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: _tooltipBehavior,
              series: <ColumnSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                  dataSource:  <SalesData>[
                    SalesData('Görkem', 45),
                    SalesData('Derya', 35),
                    SalesData('İlayda', 34),
                    SalesData('Selin', 32),
                    SalesData('Ayla', 40)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: Colors.indigoAccent
                ),
              ]
            ),
          ],
        ),
      ),
    )
  );
}

  ChartTitle _title(BuildContext context, String text) {
    return ChartTitle(text: text,
            textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w400));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}