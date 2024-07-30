// ignore: file_names

// class ProductCart {
//   int? iDSP;
//   String? tenSP;
//   int? iDThuongHieu;
//   int? iDLoai;
//   int? iDMau;
//   int? iDTrangThai;
//   int? iDNV;

//   ProductCart(
//       {this.iDSP,
//       this.tenSP,
//       this.iDThuongHieu,
//       this.iDLoai,
//       this.iDMau,
//       this.iDTrangThai,
//       this.iDNV});

//   ProductCart.fromJson(Map<String, dynamic> json) {
//     iDSP = json['IDSP'];
//     tenSP = json['TenSP'];
//     iDThuongHieu = json['IDThuongHieu'];
//     iDLoai = json['IDLoai'];
//     iDMau = json['IDMau'];
//     iDTrangThai = json['IDTrangThai'];
//     iDNV = json['IDNV'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['IDSP'] = iDSP;
//     data['TenSP'] = tenSP;
//     data['IDThuongHieu'] = iDThuongHieu;
//     data['IDLoai'] = iDLoai;
//     data['IDMau'] = iDMau;
//     data['IDTrangThai'] = iDTrangThai;
//     data['IDNV'] = iDNV;
//     return data;
//   }
// }

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
