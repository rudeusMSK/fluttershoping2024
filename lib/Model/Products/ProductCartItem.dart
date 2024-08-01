// ignore: file_names
class ProductCart {
  int? iDSP;
  String? tenSP;
  String? imgUrl;
  int? giaBan;

  ProductCart({this.iDSP, this.tenSP, this.imgUrl, this.giaBan});

  ProductCart.fromJson(Map<String, dynamic> json) {
    iDSP = json['IDSP'];
    tenSP = json['TenSP'];
    imgUrl = json['Img_Url'];
    giaBan = json['GiaBan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IDSP'] = iDSP;
    data['TenSP'] = tenSP;
    data['Img_Url'] = imgUrl;
    data['GiaBan'] = giaBan;
    return data;
  }
}
