import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/product/widget/appbar.dart';
import 'package:final_project/view/screen/charts_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.model});
  final StockData model;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
      appBar: MyAppbar(backButton: true, enableTitle: true, title: "Product Details"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: AppUtility.GeneralScrollPyhsics,
          child: Column(
            children: [
              _modelInformation(context),
              SfCartesianChart(
                  title: _title(context, "Ürün Satış Eğrisi"),
                  primaryXAxis: CategoryAxis(),
                  tooltipBehavior: _tooltipBehavior,
                  series: <SplineSeries<SalesData, String>>[
                    SplineSeries<SalesData, String>(
                      dataSource:  <SalesData>[
                        SalesData('Ocak', 50),
                        SalesData('Şubat', 28),
                        SalesData('Mart', 14),
                        SalesData('Nisan', 56),
                        SalesData('Mayıs', 40),
                        SalesData('Haziran', 30),
                        SalesData('Temmuz', 5),
                        SalesData('Ağustos', 34),
                        SalesData('Eylül', 32),
                        SalesData('Ekim', 55),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: Colors.indigoAccent
                    ),
                  ]
                ),
                SfCartesianChart(
                  title: _title(context, "Aylara Satış Tutarı Eğrisi"),
                  primaryXAxis: CategoryAxis(),
                  tooltipBehavior: _tooltipBehavior,
                  series: <SplineSeries<SalesData, String>>[
                    SplineSeries<SalesData, String>(
                      dataSource:  <SalesData>[
                        SalesData('Ocak', 700),
                        SalesData('Şubat', 500),
                        SalesData('Mart', 590),
                        SalesData('Nisan', 850),
                        SalesData('Mayıs', 504),
                        SalesData('Haziran', 790),
                        SalesData('Temmuz', 858),
                        SalesData('Ağustos', 134),
                        SalesData('Eylül', 232),
                        SalesData('Ekim', 155),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      color: Colors.deepOrange
                    ),
                  ]
                ),
            ],
          ),
        ),
      ));
  }

  Widget _modelInformation(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: _ProductCardText(text: "Müşteri Adı: ${widget.model.order?.musteriAdi ?? ""}"),
            title:   _ProductCardText(text: "Marka: ${widget.model.order?.marka ?? ""}"),
            trailing: _ProductCardText(text: "Tarih: ${widget.model.order?.tarih?.substring(0,10) ?? ""}"),
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading: _ProductCardText(text: "İl: ${widget.model.order?.il ?? ""}"),
            title:   _ProductCardText(text: "Fiyat: ${widget.model.order?.fiyat ?? ""} TL"),
            subtitle: _ProductCardText(text: "Adet: ${widget.model.order?.adet?.toUpperCase()}"),
            trailing:  _ProductCardText(text: "Sipariş No: ${widget.model.order?.siparisNo?.substring(5) ?? ""}"),
          ),
        ],
      )
    );
  }
  ChartTitle _title(BuildContext context, String text) {
    return ChartTitle(text: text,
            textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w400));
  }
}

class _ProductCardText extends StatelessWidget {
  const _ProductCardText({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.subtitle1?.copyWith(
      fontWeight: FontWeight.w400
    ),);
  }
}
