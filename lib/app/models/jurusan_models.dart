class Jurusan {
  int? kode;
  String? namaJurusan;
  double? mtk;
  double? binggris;
  double? ipa;
  double? ips;

  Jurusan(
      {this.kode,
      this.namaJurusan,
      this.mtk,
      this.binggris,
      this.ipa,
      this.ips});

  Jurusan.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    namaJurusan = json['nama_jurusan'];
    mtk = json['mtk'];
    binggris = json['binggris'];
    ipa = json['ipa'];
    ips = json['ips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['nama_jurusan'] = this.namaJurusan;
    data['mtk'] = this.mtk;
    data['binggris'] = this.binggris;
    data['ipa'] = this.ipa;
    data['ips'] = this.ips;
    return data;
  }
}
