class Product {
  int? iDSP;
  String? moTa;
  int? giaBan;
  int? giaMua;
  int? soLuong;
  String? sodo;
  String? donVi;

  Product(
      {this.iDSP,
      this.moTa,
      this.giaBan,
      this.giaMua,
      this.soLuong,
      this.sodo,
      this.donVi});

  Product.fromJson(Map<String, dynamic> json) {
    iDSP = json['IDSP'];
    moTa = json['MoTa'];
    giaBan = json['GiaBan'];
    giaMua = json['GiaMua'];
    soLuong = json['SoLuong'];
    sodo = json['Sodo'];
    donVi = json['DonVi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IDSP'] = iDSP;
    data['MoTa'] = moTa;
    data['GiaBan'] = giaBan;
    data['GiaMua'] = giaMua;
    data['SoLuong'] = soLuong;
    data['Sodo'] = sodo;
    data['DonVi'] = donVi;
    return data;
  }
}
