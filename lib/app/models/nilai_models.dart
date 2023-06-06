class Nilai {
  double? mtk;
  double? binggris;
  double? ipa;
  double? ips;

  Nilai({this.mtk, this.binggris, this.ipa, this.ips});

  Nilai.fromJson(Map<String, dynamic> json) {
    mtk = json['mtk'];
    binggris = json['binggris'];
    ipa = json['ipa'];
    ips = json['ips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['mtk'] = this.mtk;
    data['binggris'] = this.binggris;
    data['ipa'] = this.ipa;
    data['ips'] = this.ips;
    return data;
  }
}
