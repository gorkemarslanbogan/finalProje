class StockData {
  Order? order;

  StockData({this.order});

  StockData.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ?  Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  String? siparisNo;
  String? tarih;
  String? urunKodu;
  String? fiyat;
  String? musteriAdi;
  String? marka;
  String? pazarYeri;
  String? adet;
  String? il;

  Order(
      {this.siparisNo,
      this.tarih,
      this.urunKodu,
      this.fiyat,
      this.musteriAdi,
      this.marka,
      this.pazarYeri,
      this.adet,
      this.il});

  Order.fromJson(Map<String, dynamic> json) {
    siparisNo = json['siparisNo'];
    tarih = json['tarih'];
    urunKodu = json['urunKodu'];
    fiyat = json['fiyat'];
    musteriAdi = json['musteriAdi'];
    marka = json['marka'];
    pazarYeri = json['pazarYeri'];
    adet = json['adet'];
    il = json['il'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['siparisNo'] = siparisNo;
    data['tarih'] = tarih;
    data['urunKodu'] = urunKodu;
    data['fiyat'] = fiyat;
    data['musteriAdi'] = musteriAdi;
    data['marka'] = marka;
    data['pazarYeri'] = pazarYeri;
    data['adet'] = adet;
    data['il'] = il;
    return data;
  }
}
