class Category {
  int? iDLoai;
  String? tenLoai;

  Category({this.iDLoai, this.tenLoai});

  Category.fromJson(Map<String, dynamic> json) {
    iDLoai = json['IDLoai'];
    tenLoai = json['TenLoai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IDLoai'] = iDLoai;
    data['TenLoai'] = tenLoai;
    return data;
  }
}
