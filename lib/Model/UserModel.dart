class User {
  int? iDND;
  String? tenND;
  String? hoTenDem;
  String? email;
  String? gioiTinh;
  String? sDT;
  int? tuoi;
  String? matKhau;
  String? tenDangNhap;

  User(
      {this.iDND,
      this.tenND,
      this.hoTenDem,
      this.email,
      this.gioiTinh,
      this.sDT,
      this.tuoi,
      this.matKhau,
      this.tenDangNhap});

  User.fromJson(Map<String, dynamic> json) {
    iDND = json['IDND'];
    tenND = json['TenND'];
    hoTenDem = json['Ho_TenDem'];
    email = json['Email'];
    gioiTinh = json['GioiTinh'];
    sDT = json['SDT'];
    tuoi = json['Tuoi'];
    matKhau = json['MatKhau'];
    tenDangNhap = json['TenDangNhap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDND'] = this.iDND;
    data['TenND'] = this.tenND;
    data['Ho_TenDem'] = this.hoTenDem;
    data['Email'] = this.email;
    data['GioiTinh'] = this.gioiTinh;
    data['SDT'] = this.sDT;
    data['Tuoi'] = this.tuoi;
    data['MatKhau'] = this.matKhau;
    data['TenDangNhap'] = this.tenDangNhap;
    return data;
  }
}
