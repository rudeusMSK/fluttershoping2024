class User {
  int? idnd;
  Null tenND;
  Null hoTenDem;
  String? email;
  String? gioiTinh;
  Null sdt;
  Null tuoi;
  Null matKhau;
  String? tenDangNhap;

  User(
      {this.idnd,
      this.tenND,
      this.hoTenDem,
      this.email,
      this.gioiTinh,
      this.sdt,
      this.tuoi,
      this.matKhau,
      this.tenDangNhap});

  User.fromJson(Map<String, dynamic> json) {
    idnd = json['idnd'];
    tenND = json['tenND'];
    hoTenDem = json['ho_TenDem'];
    email = json['email'];
    gioiTinh = json['gioiTinh'];
    sdt = json['sdt'];
    tuoi = json['tuoi'];
    matKhau = json['matKhau'];
    tenDangNhap = json['tenDangNhap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idnd'] = idnd;
    data['tenND'] = tenND;
    data['ho_TenDem'] = hoTenDem;
    data['email'] = email;
    data['gioiTinh'] = gioiTinh;
    data['sdt'] = sdt;
    data['tuoi'] = tuoi;
    data['matKhau'] = matKhau;
    data['tenDangNhap'] = tenDangNhap;
    return data;
  }
}
