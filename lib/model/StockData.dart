class StockData {
  String? product_id;
  String? quantity;
  String? price;
  String? total;
  String? tax;
  String? currencyType;
  String? product_option_value_id;
  String? product_option_name;
  String? product_option_value_name;
  String? product_supplier;
  String? date;
  String? customer;
  String? ship_city;

  StockData(
      {this.product_id,
      this.quantity,
      this.price,
      this.total,
      this.tax,
      this.currencyType,
      this.product_option_value_id,
      this.product_option_name,
      this.product_option_value_name,
      this.product_supplier,
      this.date,
      this.customer,
      this.ship_city});

  StockData.fromJson(Map<String, dynamic> json) {
    product_id = json['COL 1'];
    quantity = json['COL 2'];
    price = json['COL 3'];
    total = json['COL 4'];
    tax = json['COL 5'];
    currencyType = json['COL 6'];
    product_option_value_id = json['COL 7'];
    product_option_name = json['COL 8'];
    product_option_value_name = json['COL 9'];
    product_supplier = json['COL 10'];
    date = json['COL 11'];
    customer = json['COL 12'];
    ship_city = json['COL 13'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['COL 1'] = product_id;
    data['COL 2'] = quantity;
    data['COL 3'] = price;
    data['COL 4'] = total;
    data['COL 5'] = tax;
    data['COL 6'] = currencyType;
    data['COL 7'] = product_option_value_id;
    data['COL 8'] = product_option_name;
    data['COL 9'] = product_option_value_name;
    data['COL 10'] = product_supplier;
    data['COL 11'] = date;
    data['COL 12'] = customer;
    data['COL 13'] = ship_city;
    return data;
  }
}

