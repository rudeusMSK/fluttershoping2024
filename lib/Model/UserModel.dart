class User {
  int? idnd;
  Null? tenND;
  Null? hoTenDem;
  String? email;
  String? gioiTinh;
  Null? sdt;
  Null? tuoi;
  Null? matKhau;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idnd'] = this.idnd;
    data['tenND'] = this.tenND;
    data['ho_TenDem'] = this.hoTenDem;
    data['email'] = this.email;
    data['gioiTinh'] = this.gioiTinh;
    data['sdt'] = this.sdt;
    data['tuoi'] = this.tuoi;
    data['matKhau'] = this.matKhau;
    data['tenDangNhap'] = this.tenDangNhap;
    return data;
  }
}
